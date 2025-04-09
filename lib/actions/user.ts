// lib/actions/user.ts
"use server";

import { auth } from "@clerk/nextjs/server";
import { prisma } from "@/lib/prisma";
import { revalidatePath } from "next/cache";
// import { redirect } from "next/navigation";
import { z } from "zod";

// Validation schema for user profile
const UserProfileSchema = z.object({
  legalId: z.string().min(1, "Legal ID is required"),
  address: z.string().min(1, "Address is required"),
  sex: z.string().min(1, "Sex is required"),
  birthDate: z.string().refine((val) => !isNaN(Date.parse(val)), {
    message: "Invalid date format",
  }),
});

export async function completeUserProfile(formData: FormData) {
  const { userId } = await auth();

  if (!userId) {
    throw new Error("You must be logged in to complete your profile");
  }

  // Parse and validate form data
  const rawData = {
    legalId: formData.get("legalId") as string,
    address: formData.get("address") as string,
    sex: formData.get("sex") as string,
    birthDate: formData.get("birthDate") as string,
  };

  const validatedData = UserProfileSchema.parse(rawData);

  // Update user in database
  try {
    await prisma.user.update({
      where: { clerkId: userId },
      data: {
        legalId: validatedData.legalId,
        address: validatedData.address,
        sex: validatedData.sex,
        birthDate: new Date(validatedData.birthDate),

        // Create a client record for this user
        Clients: {
          create: {
            isLoyal: false,
          },
        },
      },
    });

    // Revalidate paths
    revalidatePath("/dashboard");

    // Return success
    return { success: true };
  } catch (error) {
    console.error("Error updating user profile:", error);
    throw new Error("Failed to update user profile");
  }
}

// This action updates a user's role
export async function updateUserRole(userId: string, role: string) {
  const { userId: currentUserId } = await auth();

  // First check if the current user is an admin
  const currentUser = await prisma.user.findUnique({
    where: { clerkId: currentUserId as string },
  });

  if (!currentUser || currentUser.role !== "ADMIN") {
    throw new Error("Unauthorized. Only admins can update roles.");
  }

  // Validate the role
  if (!["MEMBER", "EMPLOYEE", "ADMIN", "OWNER"].includes(role)) {
    throw new Error("Invalid role");
  }

  try {
    await prisma.user.update({
      where: { clerkId: userId },
      data: { role: role as unknown },
    });

    // If setting to EMPLOYEE, create an employee record if it doesn't exist
    if (role === "EMPLOYEE") {
      const user = await prisma.user.findUnique({
        where: { clerkId: userId },
        include: { Employees: true },
      });

      if (user && user.Employees.length === 0) {
        // Create a placeholder employee record
        // Note: In a real app, you'd collect more details
        await prisma.employee.create({
          data: {
            userId: user.id,
            bio: "New employee",
            startDate: new Date(),
            branchId: 1, // Default branch ID - you'd want to make this configurable
          },
        });
      }
    }

    revalidatePath("/dashboard/users");
    return { success: true };
  } catch (error) {
    console.error("Error updating user role:", error);
    throw new Error("Failed to update user role");
  }
}
