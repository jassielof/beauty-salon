import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import TimePicker from 'react-time-picker';
import 'react-time-picker/dist/TimePicker.css';
import 'react-clock/dist/Clock.css';

const BusinessRegister = () => {
  const navigate = useNavigate();

  // Estados para los campos del formulario
  const [salonName, setSalonName] = useState('');
  const [address, setAddress] = useState('');
  const [phoneNumbers, setPhoneNumbers] = useState('');
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [confirmPassword, setConfirmPassword] = useState('');
  const [socials, setSocials] = useState('');
  const [openingTime, setOpeningTime] = useState<string | null>('09:00');
  const [closingTime, setClosingTime] = useState<string | null>('18:00');
  const [services, setServices] = useState<{ service: string; price: string; currency: string }[]>([]);
  const [employees, setEmployees] = useState<{ name: string; role: string }[]>([]);
  const [error, setError] = useState('');

  // Desplazar la página al inicio al cargar
  useEffect(() => {
    window.scrollTo(0, 0);
  }, []);

  // Función para manejar el envío del formulario
  const handleSubmit = async (event: React.FormEvent<HTMLFormElement>) => {
    event.preventDefault();

    // Validación básica
    if (
      !salonName ||
      !address ||
      !phoneNumbers ||
      !email ||
      !password ||
      !confirmPassword ||
      !openingTime ||
      !closingTime ||
      services.length === 0 || // Asegurar que haya al menos un servicio
      employees.length === 0 // Asegurar que haya al menos un empleado
    ) {
      setError('Por favor, complete todos los campos obligatorios.');
      return;
    }

    // Validación de correo electrónico
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(email)) {
      setError('Por favor, ingrese un correo electrónico válido.');
      return;
    }

    // Validación de contraseña
    if (password !== confirmPassword) {
      setError('Las contraseñas no coinciden.');
      return;
    }

    try {
      // Enviar datos al backend
      const response = await fetch('http://localhost:5000/api/register/business', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
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
        }),
      });

      const data = await response.json();

      if (response.ok) {
        // Registro exitoso
        navigate('/login');
      } else {
        // Mostrar error del backend
        setError(data.error || 'Error al registrar el negocio.');
      }
    } catch (error) {
      setError('Error de conexión con el servidor.');
    }
  };

  // Función para agregar un nuevo servicio
  const addService = () => {
    setServices([...services, { service: '', price: '', currency: '' }]);
  };

  // Función para eliminar un servicio
  const removeService = (index: number) => {
    const updatedServices = services.filter((_, i) => i !== index);
    setServices(updatedServices);
  };

  // Función para actualizar un servicio
  const updateService = (index: number, field: string, value: string) => {
    const updatedServices = services.map((service, i) =>
      i === index ? { ...service, [field]: value } : service
    );
    setServices(updatedServices);
  };

  // Función para agregar un nuevo empleado
  const addEmployee = () => {
    setEmployees([...employees, { name: '', role: '' }]);
  };

  // Función para eliminar un empleado
  const removeEmployee = (index: number) => {
    const updatedEmployees = employees.filter((_, i) => i !== index);
    setEmployees(updatedEmployees);
  };

  // Función para actualizar un empleado
  const updateEmployee = (index: number, field: string, value: string) => {
    const updatedEmployees = employees.map((employee, i) =>
      i === index ? { ...employee, [field]: value } : employee
    );
    setEmployees(updatedEmployees);
  };

  return (
    <div className="min-h-screen flex items-center justify-center bg-gradient-to-r from-blue-50 to-purple-50 p-4 pt-24">
      <div className="bg-white p-8 rounded-2xl shadow-2xl border border-gray-100 w-full max-w-2xl overflow-y-auto">
        {/* Título */}
        <div className="text-center mb-8">
          <h2 className="text-4xl font-bold text-gray-800 bg-gradient-to-r from-green-600 to-teal-600 bg-clip-text text-transparent leading-tight py-2">
            Registro de Negocio
          </h2>
          <p className="text-gray-500 mt-2">Registra tu salón para empezar</p>
        </div>

        {/* Formulario */}
        <form onSubmit={handleSubmit} className="space-y-6">
          {/* Nombre del Salón */}
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-2" htmlFor="salonName">
              Nombre del Salón
            </label>
            <input
              type="text"
              id="salonName"
              placeholder="Ingrese el nombre del salón"
              value={salonName}
              onChange={(e) => setSalonName(e.target.value)}
              className="w-full px-4 py-3 rounded-lg border-2 border-gray-200 focus:outline-none focus:border-blue-500 focus:ring-2 focus:ring-blue-200 transition-all"
              required
            />
          </div>

          {/* Dirección */}
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-2" htmlFor="address">
              Dirección
            </label>
            <input
              type="text"
              id="address"
              placeholder="Ingrese la dirección del salón"
              value={address}
              onChange={(e) => setAddress(e.target.value)}
              className="w-full px-4 py-3 rounded-lg border-2 border-gray-200 focus:outline-none focus:border-blue-500 focus:ring-2 focus:ring-blue-200 transition-all"
              required
            />
          </div>

          {/* Números de Teléfono */}
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-2" htmlFor="phoneNumbers">
              Números de Teléfono
            </label>
            <input
              type="tel"
              id="phoneNumbers"
              placeholder="Ingrese los números de teléfono"
              value={phoneNumbers}
              onChange={(e) => setPhoneNumbers(e.target.value)}
              className="w-full px-4 py-3 rounded-lg border-2 border-gray-200 focus:outline-none focus:border-blue-500 focus:ring-2 focus:ring-blue-200 transition-all"
              required
            />
          </div>

          {/* Correo Electrónico */}
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-2" htmlFor="email">
              Correo Electrónico
            </label>
            <input
              type="email"
              id="email"
              placeholder="Ingrese el correo electrónico"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              className="w-full px-4 py-3 rounded-lg border-2 border-gray-200 focus:outline-none focus:border-blue-500 focus:ring-2 focus:ring-blue-200 transition-all"
              required
            />
          </div>

          {/* Contraseña */}
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-2" htmlFor="password">
              Contraseña
            </label>
            <input
              type="password"
              id="password"
              placeholder="Ingrese su contraseña"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              className="w-full px-4 py-3 rounded-lg border-2 border-gray-200 focus:outline-none focus:border-blue-500 focus:ring-2 focus:ring-blue-200 transition-all"
              required
            />
          </div>

          {/* Repetir Contraseña */}
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-2" htmlFor="confirmPassword">
              Repetir Contraseña
            </label>
            <input
              type="password"
              id="confirmPassword"
              placeholder="Repita su contraseña"
              value={confirmPassword}
              onChange={(e) => setConfirmPassword(e.target.value)}
              className="w-full px-4 py-3 rounded-lg border-2 border-gray-200 focus:outline-none focus:border-blue-500 focus:ring-2 focus:ring-blue-200 transition-all"
              required
            />
          </div>

          {/* Redes Sociales (Opcional) */}
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-2" htmlFor="socials">
              Redes Sociales (Opcional)
            </label>
            <input
              type="text"
              id="socials"
              placeholder="Ingrese los enlaces a redes sociales"
              value={socials}
              onChange={(e) => setSocials(e.target.value)}
              className="w-full px-4 py-3 rounded-lg border-2 border-gray-200 focus:outline-none focus:border-blue-500 focus:ring-2 focus:ring-blue-200 transition-all"
            />
          </div>

          {/* Horario de Atención */}
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-2" htmlFor="hoursOfOperation">
              Horario de Atención
            </label>
            <div className="flex space-x-4">
              <div className="flex-1">
                <label className="block text-sm font-medium text-gray-500 mb-1">Hora de Apertura</label>
                <TimePicker
                  onChange={setOpeningTime}
                  value={openingTime}
                  className="w-full px-4 py-3 rounded-lg border-2 border-gray-200 focus:outline-none focus:border-blue-500 focus:ring-2 focus:ring-blue-200 transition-all"
                />
              </div>
              <div className="flex-1">
                <label className="block text-sm font-medium text-gray-500 mb-1">Hora de Cierre</label>
                <TimePicker
                  onChange={setClosingTime}
                  value={closingTime}
                  className="w-full px-4 py-3 rounded-lg border-2 border-gray-200 focus:outline-none focus:border-blue-500 focus:ring-2 focus:ring-blue-200 transition-all"
                />
              </div>
            </div>
          </div>

          {/* Servicios y Precios */}
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-2" htmlFor="services">
              Servicios y Precios
            </label>
            {services.map((service, index) => (
              <div key={index} className="space-y-4 mb-4">
                <div className="flex space-x-4">
                  <input
                    type="text"
                    placeholder="Nombre del servicio"
                    value={service.service}
                    onChange={(e) => updateService(index, 'service', e.target.value)}
                    className="w-full px-4 py-3 rounded-lg border-2 border-gray-200 focus:outline-none focus:border-blue-500 focus:ring-2 focus:ring-blue-200 transition-all"
                    required
                  />
                  <input
                    type="number"
                    placeholder="Precio"
                    value={service.price}
                    onChange={(e) => updateService(index, 'price', e.target.value)}
                    className="w-1/3 px-4 py-3 rounded-lg border-2 border-gray-200 focus:outline-none focus:border-blue-500 focus:ring-2 focus:ring-blue-200 transition-all"
                    required
                  />
                  <select
                    value={service.currency}
                    onChange={(e) => updateService(index, 'currency', e.target.value)}
                    className="w-1/3 px-1 py-3 rounded-lg border-2 border-gray-200 focus:outline-none focus:border-blue-500 focus:ring-2 focus:ring-blue-200 transition-all"
                    required
                  >
                    <option value="">Moneda</option>
                    <option value="BS">BS</option>
                    <option value="USD">USD</option>
                    <option value="EUR">EUR</option>
                    <option value="GBP">GBP</option>
                  </select>
                  <button
                    type="button"
                    onClick={() => removeService(index)}
                    className="w-1/6 px-4 py-3 bg-red-500 text-white rounded-lg hover:bg-red-600 transition-all"
                  >
                    Eliminar
                  </button>
                </div>
              </div>
            ))}
            <button
              type="button"
              onClick={addService}
              className="w-full px-4 py-3 bg-green-500 text-white rounded-lg hover:bg-green-600 transition-all"
            >
              Agregar Servicio
            </button>
          </div>

          {/* Empleados */}
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-2" htmlFor="employees">
              Empleados
            </label>
            {employees.map((employee, index) => (
              <div key={index} className="space-y-4 mb-4">
                <div className="flex space-x-4">
                  <input
                    type="text"
                    placeholder="Nombre del empleado"
                    value={employee.name}
                    onChange={(e) => updateEmployee(index, 'name', e.target.value)}
                    className="w-full px-4 py-3 rounded-lg border-2 border-gray-200 focus:outline-none focus:border-blue-500 focus:ring-2 focus:ring-blue-200 transition-all"
                    required
                  />
                  <input
                    type="text"
                    placeholder="Rol del empleado"
                    value={employee.role}
                    onChange={(e) => updateEmployee(index, 'role', e.target.value)}
                    className="w-full px-4 py-3 rounded-lg border-2 border-gray-200 focus:outline-none focus:border-blue-500 focus:ring-2 focus:ring-blue-200 transition-all"
                    required
                  />
                  <button
                    type="button"
                    onClick={() => removeEmployee(index)}
                    className="w-1/6 px-4 py-3 bg-red-500 text-white rounded-lg hover:bg-red-600 transition-all"
                  >
                    Eliminar
                  </button>
                </div>
              </div>
            ))}
            <button
              type="button"
              onClick={addEmployee}
              className="w-full px-4 py-3 bg-green-500 text-white rounded-lg hover:bg-green-600 transition-all"
            >
              Agregar Empleado
            </button>
          </div>

          {/* Mensaje de error */}
          {error && (
            <div className="text-red-500 text-sm text-center">
              {error}
            </div>
          )}

          {/* Botón de envío */}
          <button
            type="submit"
            className="w-full bg-gradient-to-r from-blue-600 to-purple-600 text-white font-semibold py-3 rounded-lg hover:from-blue-700 hover:to-purple-700 transition-all transform hover:scale-105 shadow-lg"
          >
            Registrar Negocio
          </button>
        </form>

        {/* Enlace de inicio de sesión */}
        <div className="text-center mt-6">
          <p className="text-gray-600">
            ¿Ya tienes una cuenta?{' '}
            <a
              href="/login"
              className="text-blue-600 hover:text-blue-700 font-semibold"
            >
              Iniciar sesión
            </a>
          </p>
        </div>
      </div>
    </div>
  );
};

export default BusinessRegister;