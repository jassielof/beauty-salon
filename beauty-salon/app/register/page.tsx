// app/register/page.tsx
"use client"; // Marca este componente como un Client Component

import { useRouter } from 'next/navigation'; // Usa next/navigation en lugar de next/router

const Register = () => {
  const router = useRouter();

  const handleClientRegister = () => {
    router.push('/register/client'); // Redirige al formulario de registro de cliente
  };

  const handleBusinessRegister = () => {
    router.push('/register/business'); // Redirige al formulario de registro de negocio
  };

  return (
    <div className="min-h-screen flex items-center justify-center bg-gradient-to-r from-blue-50 to-purple-50">
      <div className="bg-white p-8 rounded-xl shadow-2xl border border-gray-100 w-full max-w-md">
        {/* Título */}
        <div className="text-center mb-8">
          <h2 className="text-3xl font-bold text-gray-800">Registrarse</h2>
          <p className="text-gray-500 mt-2">Elige tu tipo de cuenta</p>
        </div>

        {/* Botones de registro */}
        <div className="space-y-6">
          <button
            onClick={handleClientRegister}
            className="w-full bg-gradient-to-r from-blue-600 to-purple-600 text-white font-semibold py-3 rounded-lg hover:from-blue-700 hover:to-purple-700 transition-all transform hover:scale-105"
          >
            Registrarse como Cliente
          </button>
          <button
            onClick={handleBusinessRegister}
            className="w-full bg-gradient-to-r from-green-600 to-teal-600 text-white font-semibold py-3 rounded-lg hover:from-green-700 hover:to-teal-700 transition-all transform hover:scale-105"
          >
            Registrarse como Negocio
          </button>
        </div>

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

export default Register;