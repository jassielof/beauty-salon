import { createClient } from "@/utils/supabase/server";
import { redirect } from "next/navigation";
import SalonForm from "@/components/forms/salon";

export default async function Salons() {
  const supabase = await createClient();
  // Get the current user
  const {
    data: { user },
  } = await supabase.auth.getUser();

  // Redirect if not logged in
  if (!user) {
    redirect("/login");
  }

  // Handle form submission
  async function addSalon(formData: FormData) {
    "use server";

    const salonData = {
      name: formData.get("name") as string,
      address: formData.get("address") as string,
      phone: formData.get("phone") as string,
      owner_id: user?.id,
    };

    const supabase = await createClient();
    const { error } = await supabase.from("beauty_salon").insert(salonData);

    if (error) {
      console.error("Error adding salon:", error);
      return { success: false, error: error.message };
    }

    return redirect("/salons/my-salons");
  }

  return (
    <div className="container mx-auto py-10">
      <h1 className="text-2xl font-bold mb-6">Register New Salon</h1>
      <SalonForm addSalon={addSalon} />
    </div>
  );
}
