"use client";
import { useForm } from "react-hook-form";
import { z } from "zod";
import { zodResolver } from "@hookform/resolvers/zod";
import { addSalon } from "@/lib/actions/salon";
import {
  Form,
  FormControl,
  FormDescription,
  FormField,
  FormItem,
  FormLabel,
} from "@/components/ui/form";
import { Input } from "@/components/ui/input";
import { FormMessage } from "@/components/form-message";
import { Button } from "@/components/ui/button";

const formSchema = z.object({
  name: z.string().min(1, "Salon name is required"),
  address: z.string().min(1, "Address is required"),
  phone: z.string().min(1, "Phone number is required"),
});

export default function SalonForm({ userId }: { userId: string }) {
  const form = useForm<z.infer<typeof formSchema>>({
    resolver: zodResolver(formSchema),
    defaultValues: {
      name: "",
      address: "",
      phone: "",
    },
  });

  async function onSubmit(values: z.infer<typeof formSchema>) {
    const formData = new FormData();
    formData.append("name", values.name);
    formData.append("address", values.address);
    formData.append("phone", values.phone);
    await addSalon(formData, userId);
  }

  return (
    <Form {...form}>
      <form onSubmit={form.handleSubmit(onSubmit)} className="space-y-8">
        <FormField
          control={form.control}
          name="name"
          render={({ field }) => (
            <FormItem>
              <FormLabel>Salon name</FormLabel>
              <FormControl>
                <Input placeholder="name" {...field} />
              </FormControl>
              <FormDescription>
                This is the name of your salon. It will be displayed to customers.
              </FormDescription>
              <FormMessage
                message={{
                  success: "Salon name is valid",
                }}
              />
            </FormItem>
          )}
        />
        <FormField
          control={form.control}
          name="address"
          render={({ field }) => (
            <FormItem>
              <FormLabel>Address</FormLabel>
              <FormControl>
                <Input placeholder="address" {...field} />
              </FormControl>
              <FormDescription>
                This is the address of your salon. It will be displayed to customers.
              </FormDescription>
              <FormMessage
                message={{
                  success: "Address is valid",
                }}
              />
            </FormItem>
          )}
        />
        <FormField
          control={form.control}
          name="phone"
          render={({ field }) => (
            <FormItem>
              <FormLabel>Phone Number</FormLabel>
              <FormControl>
                <Input placeholder="phone" {...field} />
              </FormControl>
              <FormDescription>
                This is the phone number of your salon. It will be displayed to customers.
              </FormDescription>
              <FormMessage
                message={{
                  success: "Phone number is valid",
                }}
              />
            </FormItem>
          )}
        />
        <Button type="submit">Submit</Button>
      </form>
    </Form>
  );
}
