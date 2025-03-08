import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { useAuth } from '../context/AuthContext'; // Importa el contexto de autenticación

const ClientRegister = () => {
  const navigate = useNavigate();
  const { login } = useAuth(); // Obtén la función `login` del contexto
  const [name, setName] = useState('');
  const [paternalSurname, setPaternalSurname] = useState('');
  const [maternalSurname, setMaternalSurname] = useState('');
  const [phoneNumber, setPhoneNumber] = useState('');
  const [sex, setSex] = useState('');
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [confirmPassword, setConfirmPassword] = useState('');
  const [error, setError] = useState('');

  const handleSubmit = async (event: React.FormEvent<HTMLFormElement>) => {
    event.preventDefault();

    // Validación básica
    if (
      !name ||
      !paternalSurname ||
      !maternalSurname ||
      !phoneNumber ||
      !sex ||
      !email ||
      !password ||
      !confirmPassword
    ) {
      setError('Por favor, complete todos los campos.');
      return;
    }

    // Validación de correo electrónico
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(email)) {
      setError('Por favor, ingrese un correo electrónico válido.');
      return;
    }

    // Validación de contraseña
    if (password.length < 8) {
      setError('La contraseña debe tener al menos 8 caracteres.');
      return;
    }

    // Validación de confirmación de contraseña
    if (password !== confirmPassword) {
      setError('Las contraseñas no coinciden.');
      return;
    }

    try {
      // Enviar datos al backend
      const response = await fetch('http://localhost:5000/api/register/client', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          name,
          paternalSurname,
          maternalSurname,
          phoneNumber,
          sex,
          email,
          password,
        }),
      });

      const data = await response.json();

      if (response.ok) {
        // Registro exitoso: actualiza el contexto de autenticación
        login({ username: data.user.email, userType: 'client' }); // Aquí asumimos que el backend devuelve el email y el tipo de usuario
        navigate('/dashboard/client'); // Redirige al dashboard del cliente
      } else {
        setError(data.error || 'Error al registrar el cliente.');
      }
    } catch (error) {
      setError('Error de conexión con el servidor.');
    }
  };

  return (
    <div className="min-h-screen flex items-center justify-center bg-gradient-to-r from-blue-50 to-purple-50 p-4 pt-24">
      <div className="bg-white p-8 rounded-2xl shadow-2xl border border-gray-100 w-full max-w-md overflow-y-auto">
        <div className="text-center mb-8">
          <h2 className="text-4xl font-bold text-gray-800 bg-gradient-to-r from-blue-600 to-purple-600 bg-clip-text text-transparent leading-tight py-2">
            Registro de Cliente
          </h2>
          <p className="text-gray-500 mt-2">Crea tu cuenta para empezar</p>
        </div>

        <form onSubmit={handleSubmit} className="space-y-6">
          {/* Nombre */}
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-2" htmlFor="name">
              Nombre
            </label>
            <input
              type="text"
              id="name"
              placeholder="Ingrese su nombre"
              value={name}
              onChange={(e) => setName(e.target.value)}
              className="w-full px-4 py-3 rounded-lg border-2 border-gray-200 focus:outline-none focus:border-blue-500 focus:ring-2 focus:ring-blue-200 transition-all"
              required
            />
          </div>

          {/* Apellido Paterno */}
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-2" htmlFor="paternalSurname">
              Apellido Paterno
            </label>
            <input
              type="text"
              id="paternalSurname"
              placeholder="Ingrese su apellido paterno"
              value={paternalSurname}
              onChange={(e) => setPaternalSurname(e.target.value)}
              className="w-full px-4 py-3 rounded-lg border-2 border-gray-200 focus:outline-none focus:border-blue-500 focus:ring-2 focus:ring-blue-200 transition-all"
              required
            />
          </div>

          {/* Apellido Materno */}
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-2" htmlFor="maternalSurname">
              Apellido Materno
            </label>
            <input
              type="text"
              id="maternalSurname"
              placeholder="Ingrese su apellido materno"
              value={maternalSurname}
              onChange={(e) => setMaternalSurname(e.target.value)}
              className="w-full px-4 py-3 rounded-lg border-2 border-gray-200 focus:outline-none focus:border-blue-500 focus:ring-2 focus:ring-blue-200 transition-all"
              required
            />
          </div>

          {/* Número de Teléfono */}
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-2" htmlFor="phoneNumber">
              Número de Teléfono
            </label>
            <input
              type="tel"
              id="phoneNumber"
              placeholder="Ingrese su número de teléfono"
              value={phoneNumber}
              onChange={(e) => setPhoneNumber(e.target.value)}
              className="w-full px-4 py-3 rounded-lg border-2 border-gray-200 focus:outline-none focus:border-blue-500 focus:ring-2 focus:ring-blue-200 transition-all"
              required
            />
          </div>

          {/* Sexo */}
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-2" htmlFor="sex">
              Sexo
            </label>
            <select
              id="sex"
              value={sex}
              onChange={(e) => setSex(e.target.value)}
              className="w-full px-4 py-3 rounded-lg border-2 border-gray-200 focus:outline-none focus:border-blue-500 focus:ring-2 focus:ring-blue-200 transition-all"
              required
            >
              <option value="">Seleccione su sexo</option>
              <option value="Masculino">Masculino</option>
              <option value="Femenino">Femenino</option>
              <option value="Otro">Otro</option>
            </select>
          </div>

          {/* Correo Electrónico */}
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-2" htmlFor="email">
              Correo Electrónico
            </label>
            <input
              type="email"
              id="email"
              placeholder="Ingrese su correo electrónico"
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

          {/* Confirmación de Contraseña */}
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-2" htmlFor="confirmPassword">
              Confirmar Contraseña
            </label>
            <input
              type="password"
              id="confirmPassword"
              placeholder="Confirme su contraseña"
              value={confirmPassword}
              onChange={(e) => setConfirmPassword(e.target.value)}
              className="w-full px-4 py-3 rounded-lg border-2 border-gray-200 focus:outline-none focus:border-blue-500 focus:ring-2 focus:ring-blue-200 transition-all"
              required
            />
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
            Registrarse
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

export default ClientRegister;