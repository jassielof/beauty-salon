import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { useAuth } from '../context/AuthContext';

const Login = () => {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState('');
  const [loading, setLoading] = useState(false);
  const navigate = useNavigate();
  const { login } = useAuth();

  const handleSubmit = async (event: React.FormEvent<HTMLFormElement>) => {
    event.preventDefault();

    if (!email || !password) {
      setError('Por favor, complete todos los campos.');
      return;
    }

    setLoading(true);
    setError('');

    try {
      const response = await fetch('http://localhost:5000/api/login', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ email, password }),
      });

      if (!response.ok) {
        throw new Error('Credenciales incorrectas');
      }

      const data = await response.json();
      login({ username: data.user.email, userType: data.user.userType });

      if (data.user.userType === 'client') {
        navigate('/dashboard/client');
      } else if (data.user.userType === 'business') {
        navigate('/dashboard/business');
      }
    } catch (error) {
      setError('Credenciales incorrectas');
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="min-h-screen flex items-center justify-center bg-gradient-to-r from-blue-50 to-purple-50">
      <div className="w-full max-w-md px-4">
        <div className="bg-white p-8 rounded-xl shadow-2xl border border-gray-100">
          <div className="text-center mb-8">
            <h1 className="text-4xl font-bold text-gray-800">Bienvenido</h1>
            <p className="text-gray-500 mt-2">Inicia sesión para continuar</p>
          </div>

          <form onSubmit={handleSubmit} className="space-y-6">
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
                className="w-full px-4 py-3 rounded-lg border border-gray-300 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all"
                required
              />
            </div>

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
              />
            </div>

            {error && (
              <div className="text-red-500 text-sm text-center">
                {error}
              </div>
            )}

            <button
              type="submit"
              className="w-full bg-gradient-to-r from-blue-600 to-purple-600 text-white font-semibold py-3 rounded-lg hover:from-blue-700 hover:to-purple-700 transition-all transform hover:scale-105"
              disabled={loading}
            >
              {loading ? 'Cargando...' : 'Iniciar Sesión'}
            </button>
          </form>

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