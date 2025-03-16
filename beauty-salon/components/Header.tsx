"use client"; // Añade esto en la parte superior
import Link from 'next/link';
import { useAuth } from '../context/AuthContext';

const Header = () => {
  const { user, logout } = useAuth();

  const handleLogout = () => {
    logout();
    window.location.href = '/';
  };

  const handleDashboardClick = () => {
    if (user?.role === 'CLIENT') {
      window.location.href = '/dashboard/client';
    } else if (user?.role === 'OWNER') {
      window.location.href = '/dashboard/business';
    }
  };

  return (
    <header className="bg-white shadow-sm fixed w-full top-0 z-50">
      <div className="container mx-auto px-4 py-4 flex items-center justify-between">
        <Link href="/" className="text-2xl font-bold text-blue-600 hover:text-blue-800">
          Salón de Belleza
        </Link>
        <nav className="hidden md:flex space-x-6">
          {user ? (
            <div className="flex items-center space-x-4">
              {/* Mostrar el correo del usuario */}
              <div
                className={`px-4 py-2 rounded-lg text-white font-semibold ${
                  user.role === 'CLIENT'
                    ? 'bg-gradient-to-r from-blue-600 to-purple-600'
                    : 'bg-gradient-to-r from-green-600 to-teal-600'
                }`}
              >
                {user.email} ({user.role === 'CLIENT' ? 'Cliente' : 'Negocio'})
              </div>

              {/* Botón de Dashboard */}
              <button
                onClick={handleDashboardClick}
                className="bg-gradient-to-r from-blue-600 to-purple-600 text-white px-4 py-2 rounded-lg hover:from-blue-700 hover:to-purple-700 transition-all transform hover:scale-105 shadow-lg"
              >
                Dashboard
              </button>

              {/* Botón de Cerrar sesión */}
              <button
                onClick={handleLogout}
                className="bg-gradient-to-r from-red-600 to-pink-600 text-white px-4 py-2 rounded-lg hover:from-red-700 hover:to-pink-700 transition-all transform hover:scale-105 shadow-lg"
              >
                Cerrar sesión
              </button>
            </div>
          ) : (
            <>
              {/* Enlaces para usuarios no logueados */}
              <Link href="/business" className="text-gray-600 hover:text-gray-900">
                Negocios
              </Link>
              <Link href="/login" className="text-gray-600 hover:text-gray-900">
                Iniciar sesión
              </Link>
              <Link
                href="/register"
                className="bg-gradient-to-r from-blue-600 to-purple-600 text-white px-4 py-2 rounded-lg hover:from-blue-700 hover:to-purple-700 transition-all transform hover:scale-105 shadow-lg"
              >
                Registrarse
              </Link>
            </>
          )}
        </nav>
      </div>
    </header>
  );
};

export default Header;