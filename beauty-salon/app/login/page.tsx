// app/login/page.tsx
"use client";

import React, { useState } from 'react';
import { useRouter } from 'next/navigation';
import { useAuth } from '../../context/AuthContext';
import { PrismaClient } from '@prisma/client';
import bcrypt from 'bcryptjs';

const prisma = new PrismaClient();

const Login = () => {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState('');
  const [loading, setLoading] = useState(false);
  const router = useRouter();
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
      const user = await prisma.user.findUnique({
        where: { email },
      });

      if (!user) {
        setError('Usuario no encontrado.');
        return;
      }

      const isPasswordValid = await bcrypt.compare(password, user.password);

      if (!isPasswordValid) {
        setError('Contraseña incorrecta.');
        return;
      }

      // Logueamos al usuario con los datos obtenidos de la base de datos
      login({
        id: user.id,
        email: user.email,
        name: user.name,
        surname: user.surname,
        role: user.role,
      });

      // Redirigimos según el rol del usuario
      switch (user.role) {
        case 'CLIENT':
          router.push('/dashboard/client');
          break;
        case 'OWNER':
          router.push('/dashboard/business');
          break;
        case 'ADMIN':
          router.push('/dashboard/admin');
          break;
        case 'EMPLOYEE':
          router.push('/dashboard/employee');
          break;
        default:
          router.push('/');
      }
    } catch (error) {
      if (error instanceof Error) {
        setError(error.message); // Muestra el mensaje de error específico
      } else {
        setError('Error al iniciar sesión.'); // Mensaje genérico si no es un Error
      }
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
                className="w-full px-4 py-3 rounded-lg border text-gray-500 border-gray-300 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all"
                required
              />
            </div>

            <div>
              <label className="block text-sm font-medium text text-gray-700 mb-2" htmlFor="password">
                Contraseña
              </label>
              <input
                type="password"
                id="password"
                placeholder="Ingrese su contraseña"
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                className="w-full px-4 py-3 rounded-lg border text-gray-500 border-gray-300 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all"
                required
              />
            </div>

            {error && <div className="text-red-500 text-sm text-center">{error}</div>}

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
              <a href="/register" className="text-blue-600 hover:text-blue-700 font-semibold">
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