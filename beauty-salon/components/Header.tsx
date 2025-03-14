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
    if (user?.userType === 'client') {
      window.location.href = '/dashboard/client';
    } else if (user?.userType === 'business') {
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
              <div
                className={`px-4 py-2 rounded-lg text-white font-semibold ${
                  user.userType === 'client'
                    ? 'bg-gradient-to-r from-blue-600 to-purple-600'
                    : 'bg-gradient-to-r from-green-600 to-teal-600'
                }`}
              >
                {user.username} ({user.userType === 'client' ? 'Cliente' : 'Negocio'})
              </div>
              <button
                onClick={handleDashboardClick}
                className="bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700"
              >
                Dashboard
              </button>
              <button
                onClick={handleLogout}
                className="bg-red-600 text-white px-4 py-2 rounded-lg hover:bg-red-700"
              >
                Cerrar sesión
              </button>
            </div>
          ) : (
            <>
              <Link href="/business" className="text-gray-600 hover:text-gray-900">
                Negocios
              </Link>
              <Link href="/login" className="text-gray-600 hover:text-gray-900">
                Iniciar sesión
              </Link>
              <Link
                href="/register"
                className="bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700"
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