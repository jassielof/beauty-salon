import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';

const Login = () => {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState('');
  const navigate = useNavigate();

  const handleSubmit = (event: React.FormEvent<HTMLFormElement>) => {
    event.preventDefault();

    // Validación básica
    if (!username || !password) {
      setError('Por favor, complete todos los campos.');
      return;
    }

    // Simulación de inicio de sesión exitoso
    console.log('Usuario:', username);
    console.log('Contraseña:', password);

    // Limpiar el estado de error
    setError('');

    // Redirigir al usuario a la página de inicio
    navigate('/');
  };

  return (
    <div className="min-h-screen flex items-center justify-center bg-gradient-to-r from-blue-50 to-purple-50">
      <div className="w-full max-w-md px-4">
        <div className="bg-white p-8 rounded-xl shadow-2xl border border-gray-100">
          {/* Logo o título */}
          <div className="text-center mb-8">
            <h1 className="text-4xl font-bold text-gray-800">Bienvenido</h1>
            <p className="text-gray-500 mt-2">Inicia sesión para continuar</p>
          </div>

          {/* Formulario */}
          <form onSubmit={handleSubmit} className="space-y-6">
            {/* Campo de usuario */}
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2" htmlFor="username">
                Usuario
              </label>
              <input
                type="text"
                id="username"
                placeholder="Ingrese su usuario"
                value={username}
                onChange={(e) => setUsername(e.target.value)}
                className="w-full px-4 py-3 rounded-lg border border-gray-300 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all"
                required
                aria-label="Usuario"
              />
            </div>

            {/* Campo de contraseña */}
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
                className="w-full px-4 py-3 rounded-lg border border-gray-300 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all"
                required
                aria-label="Contraseña"
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
              className="w-full bg-gradient-to-r from-blue-600 to-purple-600 text-white font-semibold py-3 rounded-lg hover:from-blue-700 hover:to-purple-700 transition-all transform hover:scale-105"
            >
              Iniciar Sesión
            </button>
          </form>

          {/* Enlace de registro */}
          <div className="text-center mt-6">
            <p className="text-gray-600">
              ¿No tienes una cuenta?{' '}
              <a
                href="/register"
                className="text-blue-600 hover:text-blue-700 font-semibold"
              >
                Regístrate
              </a>
            </p>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Login;