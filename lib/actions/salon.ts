"use server";
import { createClient } from "@/utils/supabase/server";
import { redirect } from "next/navigation";

export async function addSalon(formData: FormData, userId: string) {
  const salonData = {
    name: formData.get("name") as string,
    address: formData.get("address") as string,
    phone: formData.get("phone") as string,
    owner_id: userId,
  };

  const supabase = await createClient();
  const { error } = await supabase.from("beauty_salon").insert(salonData);

  if (error) {
    console.error("Error adding salon:", error);
    return { success: false, error: error.message };
  }

  return redirect("/salons/my-salons");
}
