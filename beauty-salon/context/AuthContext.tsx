// context/AuthContext.tsx
'use client'; // Agrega esta línea

import { createContext, useContext, useState, ReactNode } from 'react';

// Definimos la interfaz del usuario basada en tu esquema de Prisma
interface User {
  id: number;
  email: string;
  name: string;
  surname: string;
  role: 'CLIENT' | 'OWNER' | 'ADMIN' | 'EMPLOYEE'; // Los roles definidos en tu enum de Prisma
}

interface AuthContextType {
  user: User | null;
  login: (userData: User) => void;
  logout: () => void;
}

const AuthContext = createContext<AuthContextType | null>(null);

export const AuthProvider = ({ children }: { children: ReactNode }) => {
  const [user, setUser] = useState<User | null>(null);

  const login = (userData: User) => {
    setUser(userData);
  };

  const logout = () => {
    setUser(null);
  };

  return (
    <AuthContext.Provider value={{ user, login, logout }}>
      {children}
    </AuthContext.Provider>
  );
};

export const useAuth = () => {
  const context = useContext(AuthContext);
  if (!context) {
    throw new Error('useAuth must be used within an AuthProvider');
  }
  return context;
};