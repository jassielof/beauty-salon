// app/complete-profile/page.tsx
"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import { useUser } from "@clerk/nextjs";
import { completeUserProfile } from "@/lib/actions/user";

export default function CompleteProfilePage() {
  const { user, isLoaded } = useUser();
  const router = useRouter();

  const [formData, setFormData] = useState({
    legalId: "",
    address: "",
    sex: "",
    birthDate: "",
  });

  const [error, setError] = useState("");
  const [isSubmitting, setIsSubmitting] = useState(false);

  // If user data isn't loaded yet, show loading
  if (!isLoaded) {
    return <div>Loading...</div>;
  }

  // If no user is logged in, redirect to sign-in
  if (!user) {
    router.push("/sign-in");
    return null;
  }

  function handleChange(
    e: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement | HTMLSelectElement>
  ) {
    const { name, value } = e.target;
    setFormData((prev) => ({ ...prev, [name]: value }));
  }

  const handleSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    setIsSubmitting(true);
    setError("");

    try {
      const formDataToSubmit = new FormData();

      // Add form fields to FormData
      Object.entries(formData).forEach(([key, value]) => {
        formDataToSubmit.append(key, value);
      });

      // Call the server action
      await completeUserProfile(formDataToSubmit);

      // Redirect to dashboard after successful submission
      router.push("/dashboard");
    } catch (err) {
      setError("Failed to complete profile. Please try again.");
      console.error(err);
    } finally {
      setIsSubmitting(false);
    }
  };

  return (
    <div className="max-w-md mx-auto my-10 p-6 bg-white rounded-lg shadow-md">
      <h1 className="text-2xl font-bold mb-6">Complete Your Profile</h1>

      {error && <div className="mb-4 p-3 bg-red-100 text-red-700 rounded">{error}</div>}

      <form onSubmit={handleSubmit}>
        <div className="mb-4">
          <label htmlFor="legalId" className="block text-sm font-medium mb-1">
            Legal ID / National ID Number
          </label>
          <input
            type="text"
            id="legalId"
            name="legalId"
            value={formData.legalId}
            onChange={handleChange}
            required
            className="w-full p-2 border rounded"
          />
        </div>

        <div className="mb-4">
          <label htmlFor="address" className="block text-sm font-medium mb-1">
            Address
          </label>
          <textarea
            id="address"
            name="address"
            value={formData.address}
            onChange={handleChange}
            required
            rows={3}
            className="w-full p-2 border rounded"
          />
        </div>

        <div className="mb-4">
          <label htmlFor="sex" className="block text-sm font-medium mb-1">
            Sex
          </label>
          <select
            id="sex"
            name="sex"
            value={formData.sex}
            onChange={handleChange}
            required
            className="w-full p-2 border rounded"
          >
            <option value="">Select</option>
            <option value="Male">Male</option>
            <option value="Female">Female</option>
            <option value="Other">Other</option>
          </select>
        </div>

        <div className="mb-6">
          <label htmlFor="birthDate" className="block text-sm font-medium mb-1">
            Birth Date
          </label>
          <input
            type="date"
            id="birthDate"
            name="birthDate"
            value={formData.birthDate}
            onChange={handleChange}
            required
            className="w-full p-2 border rounded"
          />
        </div>

        <button
          type="submit"
          disabled={isSubmitting}
          className="w-full py-2 px-4 bg-blue-600 text-white rounded hover:bg-blue-700 disabled:bg-blue-300"
        >
          {isSubmitting ? "Saving..." : "Complete Profile"}
        </button>
      </form>
    </div>
  );
}
