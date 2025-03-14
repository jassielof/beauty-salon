'use server'; // Indica que este es un Server Action

import { PrismaClient } from '@prisma/client';
import bcrypt from 'bcryptjs';

const prisma = new PrismaClient();

export async function loginUser(email: string, password: string) {
  try {
    // Buscar al usuario en la base de datos
    const user = await prisma.user.findUnique({ where: { email } });

    if (!user) {
      throw new Error('Credenciales incorrectas');
    }

    // Comparar la contraseña hasheada
    const isPasswordValid = await bcrypt.compare(password, user.password);

    if (!isPasswordValid) {
      throw new Error('Credenciales incorrectas');
    }

    // Si todo está bien, devolver los datos del usuario (sin la contraseña)
    // eslint-disable-next-line @typescript-eslint/no-unused-vars
    const { password: _, ...userWithoutPassword } = user;
    return userWithoutPassword;
  } catch (error: unknown) {
    if (error instanceof Error) {
      throw new Error(error.message || 'Error en el servidor');
    } else {
      throw new Error('Error desconocido');
    }
  }
}