import { createClient } from "@/utils/supabase/server";
import { redirect } from "next/navigation";
import SalonForm from "@/components/forms/salon";

export default async function Salons() {
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();

  if (!user) {
    redirect("/login");
  }

  return (
    <div className="container mx-auto py-10">
      <h1 className="text-2xl font-bold mb-6">Register New Salon</h1>
      <SalonForm userId={user.id} />
    </div>
  );
}
