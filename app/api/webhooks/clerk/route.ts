// app/api/webhooks/clerk/route.ts
import { Webhook } from "svix";
import { headers } from "next/headers";
import { WebhookEvent } from "@clerk/nextjs/server";
import { prisma } from "@/lib/prisma";
import { Role } from "@prisma/client";

export async function POST(req: Request) {
  // Get the headers
  const headerPayload = headers();
  const svix_id = (await headerPayload).get("svix-id");
  const svix_timestamp = (await headerPayload).get("svix-timestamp");
  const svix_signature = (await headerPayload).get("svix-signature");

  // If there are no headers, error out
  if (!svix_id || !svix_timestamp || !svix_signature) {
    return new Response("Error: Missing svix headers", { status: 400 });
  }

  // Get the body
  const payload = await req.json();
  const body = JSON.stringify(payload);

  // Create a new Svix instance with your webhook secret
  const wh = new Webhook(process.env.WEBHOOK_SECRET || "");

  let evt: WebhookEvent;

  // Verify the payload with the headers
  try {
    evt = wh.verify(body, {
      "svix-id": svix_id,
      "svix-timestamp": svix_timestamp,
      "svix-signature": svix_signature,
    }) as WebhookEvent;
  } catch (err) {
    console.error("Error verifying webhook:", err);
    return new Response("Error verifying webhook", { status: 400 });
  }

  // Handle the webhook event
  const eventType = evt.type;

  if (eventType === "user.created") {
    // Extract user data
    const { id, email_addresses, first_name, last_name, phone_numbers, image_url } = evt.data;

    const primaryEmail = email_addresses?.find(
      (email) => email.id === evt.data.primary_email_address_id
    );
    const primaryPhone = phone_numbers?.length ? phone_numbers[0].phone_number : "";

    if (!primaryEmail) {
      return new Response("Error: User has no primary email", { status: 400 });
    }

    try {
      // Create a new user in your database
      await prisma.user.create({
        data: {
          email: primaryEmail.email_address,
          emailVerified: primaryEmail.verification?.status === "verified" ? new Date() : null,
          name: first_name || "",
          surname: last_name || "",
          phoneNumber: primaryPhone || "",
          legalId: "", // These fields need to be collected separately
          address: "",
          sex: "",
          birthDate: new Date(), // Default value, should be updated later
          image: image_url,
          role: Role.MEMBER, // Default role
          clerkId: id, // Store the Clerk user ID
        },
      });

      console.log(`User created: ${id}`);
      return new Response("User created", { status: 200 });
    } catch (error) {
      console.error("Error creating user:", error);
      return new Response("Error creating user", { status: 500 });
    }
  }

  if (eventType === "user.updated") {
    const { id, email_addresses, first_name, last_name, phone_numbers, image_url } = evt.data;

    const primaryEmail = email_addresses?.find(
      (email) => email.id === evt.data.primary_email_address_id
    );
    const primaryPhone = phone_numbers?.length ? phone_numbers[0].phone_number : "";

    if (!primaryEmail) {
      return new Response("Error: User has no primary email", { status: 400 });
    }

    try {
      // Update the user in your database
      await prisma.user.update({
        where: { clerkId: id },
        data: {
          email: primaryEmail.email_address,
          emailVerified: primaryEmail.verification?.status === "verified" ? new Date() : null,
          name: first_name || "",
          surname: last_name || "",
          phoneNumber: primaryPhone || "",
          image: image_url,
        },
      });

      console.log(`User updated: ${id}`);
      return new Response("User updated", { status: 200 });
    } catch (error) {
      console.error("Error updating user:", error);
      return new Response("Error updating user", { status: 500 });
    }
  }

  if (eventType === "user.deleted") {
    const { id } = evt.data;

    try {
      // Delete the user from your database
      await prisma.user.delete({
        where: { clerkId: id },
      });

      console.log(`User deleted: ${id}`);
      return new Response("User deleted", { status: 200 });
    } catch (error) {
      console.error("Error deleting user:", error);
      return new Response("Error deleting user", { status: 500 });
    }
  }

  return new Response("Webhook received", { status: 200 });
}
