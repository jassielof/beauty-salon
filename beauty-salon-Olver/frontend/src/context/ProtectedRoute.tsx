import React from 'react';
import { Navigate } from 'react-router-dom';
import { useAuth } from './AuthContext';

interface ProtectedRouteProps {
  children: React.ReactNode;
  requiredUserType: 'client' | 'business';
}

const ProtectedRoute: React.FC<ProtectedRouteProps> = ({ children, requiredUserType }) => {
  const { user } = useAuth();

  if (!user || user.userType !== requiredUserType) {
    return <Navigate to="/login" />;
  }

  return children;
};

export default ProtectedRoute;