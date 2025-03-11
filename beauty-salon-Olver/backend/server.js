const express = require('express');
const fs = require('fs');
const path = require('path');
const bodyParser = require('body-parser');
const cors = require('cors');
const { body, validationResult } = require('express-validator');

const app = express();
const PORT = 5000;

// Middleware
app.use(bodyParser.json());
app.use(cors());

// Ruta al archivo JSON que simula la base de datos
const usersFilePath = path.join(__dirname, 'users.json');

// Función para leer los usuarios desde el archivo JSON
const readUsers = () => {
  if (!fs.existsSync(usersFilePath)) {
    fs.writeFileSync(usersFilePath, JSON.stringify([])); // Crear el archivo si no existe
  }
  const data = fs.readFileSync(usersFilePath, 'utf-8');
  return JSON.parse(data);
};

// Función para guardar los usuarios en el archivo JSON
const saveUsers = (users) => {
  fs.writeFileSync(usersFilePath, JSON.stringify(users, null, 2));
};

// Ruta para la raíz
app.get('/', (req, res) => {
  res.send('¡Bienvenido al backend de Beauty Salon Olver!');
});

// Ruta para registrar un cliente
app.post('/api/register/client', [
  body('name').notEmpty().withMessage('El nombre es obligatorio.'),
  body('paternalSurname').notEmpty().withMessage('El apellido paterno es obligatorio.'),
  body('maternalSurname').notEmpty().withMessage('El apellido materno es obligatorio.'),
  body('phoneNumber').notEmpty().withMessage('El número de teléfono es obligatorio.'),
  body('sex').notEmpty().withMessage('El sexo es obligatorio.'),
  body('email').isEmail().withMessage('El correo electrónico no es válido.'),
  body('password').isLength({ min: 6 }).withMessage('La contraseña debe tener al menos 6 caracteres.'),
], (req, res) => {
  const errors = validationResult(req);
  if (!errors.isEmpty()) {
    return res.status(400).json({ errors: errors.array() });
  }

  const { name, paternalSurname, maternalSurname, phoneNumber, sex, email, password } = req.body;

  // Leer los usuarios existentes
  const users = readUsers();

  // Verificar si el correo ya está registrado
  if (users.some((user) => user.email === email)) {
    return res.status(400).json({ error: 'El correo electrónico ya está registrado.' });
  }

  // Crear un nuevo usuario (cliente)
  const newUser = {
    id: users.length + 1, // ID único
    name,
    paternalSurname,
    maternalSurname,
    phoneNumber,
    sex,
    email,
    password, // ¡Nunca almacenes contraseñas en texto plano en producción!
    userType: 'client', // Tipo de usuario
  };

  // Guardar el nuevo usuario
  users.push(newUser);
  saveUsers(users);

  // Respuesta exitosa
  res.status(201).json({ message: 'Cliente registrado exitosamente.', user: newUser });
});

// Ruta para registrar un negocio
app.post('/api/register/business', [
  body('salonName').notEmpty().withMessage('El nombre del salón es obligatorio.'),
  body('address').notEmpty().withMessage('La dirección es obligatoria.'),
  body('phoneNumbers').notEmpty().withMessage('El número de teléfono es obligatorio.'),
  body('email').isEmail().withMessage('El correo electrónico no es válido.'),
  body('password').isLength({ min: 6 }).withMessage('La contraseña debe tener al menos 6 caracteres.'),
  body('openingTime').notEmpty().withMessage('La hora de apertura es obligatoria.'),
  body('closingTime').notEmpty().withMessage('La hora de cierre es obligatoria.'),
], (req, res) => {
  const errors = validationResult(req);
  if (!errors.isEmpty()) {
    return res.status(400).json({ errors: errors.array() });
  }

  const {
    salonName,
    address,
    phoneNumbers,
    email,
    password,
    socials,
    openingTime,
    closingTime,
    services,
    employees,
  } = req.body;

  // Leer los usuarios existentes
  const users = readUsers();

  // Verificar si el correo ya está registrado
  if (users.some((user) => user.email === email)) {
    return res.status(400).json({ error: 'El correo electrónico ya está registrado.' });
  }

  // Crear un nuevo usuario (negocio)
  const newUser = {
    id: users.length + 1, // ID único
    salonName,
    address,
    phoneNumbers,
    email,
    password, // ¡Nunca almacenes contraseñas en texto plano en producción!
    socials,
    openingTime,
    closingTime,
    services: services || [],
    employees: employees || [],
    userType: 'business', // Tipo de usuario
  };

  // Guardar el nuevo usuario
  users.push(newUser);
  saveUsers(users);

  // Respuesta exitosa
  res.status(201).json({ message: 'Negocio registrado exitosamente.', user: newUser });
});

// Ruta para manejar el login
app.post('/api/login', [
  body('email').isEmail().withMessage('El correo electrónico no es válido.'),
  body('password').notEmpty().withMessage('La contraseña es obligatoria.'),
], (req, res) => {
  const errors = validationResult(req);
  if (!errors.isEmpty()) {
    return res.status(400).json({ errors: errors.array() });
  }

  const { email, password } = req.body;

  // Leer los usuarios existentes
  const users = readUsers();

  // Buscar el usuario por correo y contraseña
  const user = users.find((u) => u.email === email && u.password === password);

  if (user) {
    // Respuesta exitosa (sin enviar la contraseña)
    const { password, ...userData } = user; // Excluir la contraseña de la respuesta
    res.status(200).json({ message: 'Inicio de sesión exitoso.', user: userData });
  } else {
    res.status(401).json({ error: 'Credenciales incorrectas.' });
  }
});

// Ruta para obtener los datos del negocio
app.get('/api/business/:email', (req, res) => {
  const { email } = req.params;

  // Leer los usuarios existentes
  const users = readUsers();

  // Buscar el negocio por correo
  const business = users.find((user) => user.email === email && user.userType === 'business');

  if (business) {
    // Respuesta exitosa
    res.status(200).json(business);
  } else {
    res.status(404).json({ error: 'Negocio no encontrado.' });
  }
});

// Ruta para actualizar los datos del negocio (PATCH para actualización parcial)
app.patch('/api/business/:email', (req, res) => {
  const { email } = req.params;
  const { openingTime, closingTime, services, employees } = req.body;

  // Leer los usuarios existentes
  const users = readUsers();

  // Buscar el negocio por correo
  const businessIndex = users.findIndex((user) => user.email === email && user.userType === 'business');

  if (businessIndex !== -1) {
    // Actualizar solo los campos proporcionados
    if (openingTime) users[businessIndex].openingTime = openingTime;
    if (closingTime) users[businessIndex].closingTime = closingTime;
    if (services) users[businessIndex].services = services;
    if (employees) users[businessIndex].employees = employees;

    // Guardar los cambios
    saveUsers(users);

    res.status(200).json({ message: 'Datos actualizados exitosamente.', user: users[businessIndex] });
  } else {
    res.status(404).json({ error: 'Negocio no encontrado.' });
  }
});

// Ruta para actualizar un servicio específico
app.patch('/api/business/:email/services/:serviceId', [
  body('service').optional().isString(),
  body('price').optional().isString(),
  body('currency').optional().isString(),
], (req, res) => {
  const errors = validationResult(req);
  if (!errors.isEmpty()) {
    return res.status(400).json({ errors: errors.array() });
  }

  const { email, serviceId } = req.params;
  const { service, price, currency } = req.body;

  // Leer los usuarios existentes
  const users = readUsers();

  // Buscar el negocio por correo
  const businessIndex = users.findIndex((user) => user.email === email && user.userType === 'business');

  if (businessIndex !== -1) {
    const business = users[businessIndex];

    // Buscar el servicio por ID
    const serviceIndex = business.services.findIndex((s) => s.id === parseInt(serviceId));

    if (serviceIndex !== -1) {
      // Actualizar el servicio
      if (service) business.services[serviceIndex].service = service;
      if (price) business.services[serviceIndex].price = price;
      if (currency) business.services[serviceIndex].currency = currency;

      // Guardar los cambios
      saveUsers(users);

      res.status(200).json({ message: 'Servicio actualizado exitosamente.', service: business.services[serviceIndex] });
    } else {
      res.status(404).json({ error: 'Servicio no encontrado.' });
    }
  } else {
    res.status(404).json({ error: 'Negocio no encontrado.' });
  }
});

// Ruta para actualizar un empleado específico
app.patch('/api/business/:email/employees/:employeeId', [
  body('name').optional().isString(),
  body('role').optional().isString(),
], (req, res) => {
  const errors = validationResult(req);
  if (!errors.isEmpty()) {
    return res.status(400).json({ errors: errors.array() });
  }

  const { email, employeeId } = req.params;
  const { name, role } = req.body;

  // Leer los usuarios existentes
  const users = readUsers();

  // Buscar el negocio por correo
  const businessIndex = users.findIndex((user) => user.email === email && user.userType === 'business');

  if (businessIndex !== -1) {
    const business = users[businessIndex];

    // Buscar el empleado por ID
    const employeeIndex = business.employees.findIndex((e) => e.id === parseInt(employeeId));

    if (employeeIndex !== -1) {
      // Actualizar el empleado
      if (name) business.employees[employeeIndex].name = name;
      if (role) business.employees[employeeIndex].role = role;

      // Guardar los cambios
      saveUsers(users);

      res.status(200).json({ message: 'Empleado actualizado exitosamente.', employee: business.employees[employeeIndex] });
    } else {
      res.status(404).json({ error: 'Empleado no encontrado.' });
    }
  } else {
    res.status(404).json({ error: 'Negocio no encontrado.' });
  }
});

// Middleware para manejo de errores
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).json({ error: 'Algo salió mal en el servidor.' });
});

// Iniciar el servidor
app.listen(PORT, () => {
  console.log(`Servidor backend corriendo en http://localhost:${PORT}`);
});