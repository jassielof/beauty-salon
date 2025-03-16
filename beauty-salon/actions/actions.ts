"use server";

import prisma from "@/lib/prisma";

export async function createBusiness(businessData: {
  salonName: string;
  address: string;
  phoneNumbers: string;
  email: string;
  password: string;
  socials: string;
  openingTime: string | null;
  closingTime: string | null;
  services: Array<{ service: string; price: string; currency: string }>;
  employees: Array<{ name: string; role: string }>;
}) {
  try {
    // Create the user with business role
    const newUser = await prisma.user.create({
      data: {
        email: businessData.email,
        name: businessData.salonName,
        surname: "", // Provide a default or meaningful value
        phoneNumber: businessData.phoneNumbers,
        role: "CLIENT",
        password: businessData.password, // Make sure to hash this password on the client side
        address: businessData.address,
        legalId: "", // Provide a default or meaningful value
        sex: "OTHER", // Provide a default or meaningful value
        birthDate: new Date(), // Provide a default or meaningful value
      },
    });

    // Create the business record associated with the user
    const business = await prisma.beautySalon.create({
      data: {
        name: businessData.salonName,
        address: businessData.address,
        phone: businessData.phoneNumbers,
        email: businessData.email,
        description: "", // Providing default empty value
        logoUri: "", // Providing default empty value
        SocialNetwork: {
          create: businessData.socials.split(",").map((social) => ({
            name: "Default Name", // Replace with a meaningful name if available
            url: social.trim(),
          })),
        },
        ownerId: newUser.id,
      },
    });

    return { success: true, message: "Negocio creado exitosamente", business };
  } catch (error) {
    console.error("Error al crear el negocio:", error);
    return { success: false, message: "Error al crear el negocio" };
  }
}

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
        role: "CLIENT",
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
    return { success: true, message: "Cliente creado exitosamente", user: newUser };
  } catch (error) {
    console.error("Error al crear el cliente:", error);
    return { success: false, message: "Error al crear el cliente" };
  }
}
