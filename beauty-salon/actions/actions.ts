"use server";

import prisma from "@/lib/prisma";

export async function createClient(clientData: {
  name: string;
  paternalSurname: string;
  maternalSurname: string;
  phoneNumber: string;
  sex: string;
  email: string;
  password: string;
  legalId: string;
  address: string;
  birthDate: string;
}) {
  try {
    // Crear el usuario en la base de datos
    const newUser = await prisma.user.create({
      data: {
        email: clientData.email,
        name: clientData.name,
        surname: `${clientData.paternalSurname} ${clientData.maternalSurname}`,
        phoneNumber: clientData.phoneNumber,
        sex: clientData.sex,
        role: 'CLIENT',
        password: clientData.password, // Asegúrate de hashear la contraseña en el cliente
        legalId: clientData.legalId,
        address: clientData.address,
        birthDate: new Date(clientData.birthDate),
      },
    });

    // Crear el cliente asociado al usuario
    await prisma.client.create({
      data: {
        isLoyal: false, // Asumiendo que este es el valor predeterminado
        userId: newUser.id,
      },
    });

    // Devolver el usuario creado junto con un mensaje de éxito
    return { success: true, message: 'Cliente creado exitosamente', user: newUser };
  } catch (error) {
    console.error('Error al crear el cliente:', error);
    return { success: false, message: 'Error al crear el cliente' };
  }
}