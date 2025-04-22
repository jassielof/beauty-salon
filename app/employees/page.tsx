import { createClient } from "@/utils/supabase/server";

export default async function Employees() {
  const supabase = await createClient();
  let { data: employee } = await supabase.from("employees").select("*");
  return <pre>{JSON.stringify(employee, null, 2)}</pre>;
}
