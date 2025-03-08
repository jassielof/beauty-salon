const express = require('express');
const fs = require('fs');
const path = require('path');
const bodyParser = require('body-parser');
const cors = require('cors');

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
app.post('/api/register/client', (req, res) => {
  const { name, paternalSurname, maternalSurname, phoneNumber, sex, email, password } = req.body;

  // Validación básica
  if (!name || !paternalSurname || !maternalSurname || !phoneNumber || !sex || !email || !password) {
    return res.status(400).json({ error: 'Por favor, complete todos los campos.' });
  }

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
app.post('/api/register/business', (req, res) => {
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

  // Validación básica
  if (
    !salonName ||
    !address ||
    !phoneNumbers ||
    !email ||
    !password ||
    !openingTime ||
    !closingTime ||
    !services ||
    !employees
  ) {
    return res.status(400).json({ error: 'Por favor, complete todos los campos obligatorios.' });
  }

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
    services,
    employees,
    userType: 'business', // Tipo de usuario
  };

  // Guardar el nuevo usuario
  users.push(newUser);
  saveUsers(users);

  // Respuesta exitosa
  res.status(201).json({ message: 'Negocio registrado exitosamente.', user: newUser });
});

// Ruta para manejar el login
app.post('/api/login', (req, res) => {
  const { email, password } = req.body;

  // Validación básica
  if (!email || !password) {
    return res.status(400).json({ error: 'Por favor, complete todos los campos.' });
  }

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

// Iniciar el servidor
app.listen(PORT, () => {
  console.log(`Servidor backend corriendo en http://localhost:${PORT}`);
});