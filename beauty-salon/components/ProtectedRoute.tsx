'use client'; // Asegúrate de marcar este componente como un Client Component

import { redirect } from 'next/navigation';
import { useAuth } from '../context/AuthContext';

interface ProtectedRouteProps {
  children: React.ReactNode;
  requiredUserType: 'client' | 'business';
}

const ProtectedRoute: React.FC<ProtectedRouteProps> = ({ children, requiredUserType }) => {
  const { user } = useAuth();

  if (!user || user.userType !== requiredUserType) {
    redirect('/login'); // Redirige a la página de inicio de sesión
  }

  return children;
};

export default ProtectedRoute;