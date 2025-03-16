"use client";

import { useState } from 'react';
import { createBusiness } from '@/actions'; // Importa la función de servidor

const BusinessRegister = () => {
  const [salonName, setSalonName] = useState('');
  const [address, setAddress] = useState('');
  const [phoneNumbers, setPhoneNumbers] = useState('');
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [confirmPassword, setConfirmPassword] = useState('');
  const [socials, setSocials] = useState('');
  const [openingTime, setOpeningTime] = useState<string | null>('09:00');
  const [closingTime, setClosingTime] = useState<string | null>('18:00');
  const [services, setServices] = useState<{ service: string; price: string; currency: string }[]>([]);
  const [employees, setEmployees] = useState<{ name: string; role: string }[]>([]);
  const [error, setError] = useState('');

  const handleSubmit = async (event: React.FormEvent<HTMLFormElement>) => {
    event.preventDefault();

    // Validación básica
    if (
      !salonName ||
      !address ||
      !phoneNumbers ||
      !email ||
      !password ||
      !confirmPassword ||
      !openingTime ||
      !closingTime ||
      services.length === 0 ||
      employees.length === 0
    ) {
      setError('Por favor, complete todos los campos obligatorios.');
      return;
    }

    // Validación de contraseña
    if (password !== confirmPassword) {
      setError('Las contraseñas no coinciden.');
      return;
    }

    // Enviar datos al servidor
    const result = await createBusiness({
      salonName,
      address,
      phoneNumbers,
      email,
      password,
      socials,
      openingTime,
      closingTime,
      services,
      employees,
    });

    if (result.success) {
      alert('Negocio registrado exitosamente');
      // Redirigir o limpiar el formulario
    } else {
      setError(result.message);
    }
  };

  // Funciones para manejar servicios y empleados
  const addService = () => {
    setServices([...services, { service: '', price: '', currency: '' }]);
  };

  const removeService = (index: number) => {
    const updatedServices = services.filter((_, i) => i !== index);
    setServices(updatedServices);
  };

  const updateService = (index: number, field: string, value: string) => {
    const updatedServices = services.map((service, i) =>
      i === index ? { ...service, [field]: value } : service
    );
    setServices(updatedServices);
  };

  const addEmployee = () => {
    setEmployees([...employees, { name: '', role: '' }]);
  };

  const removeEmployee = (index: number) => {
    const updatedEmployees = employees.filter((_, i) => i !== index);
    setEmployees(updatedEmployees);
  };

  const updateEmployee = (index: number, field: string, value: string) => {
    const updatedEmployees = employees.map((employee, i) =>
      i === index ? { ...employee, [field]: value } : employee
    );
    setEmployees(updatedEmployees);
  };

  return (
    <div className="min-h-screen flex items-center justify-center bg-gradient-to-r from-blue-50 to-purple-50 p-4 pt-24">
      <div className="bg-white p-8 rounded-2xl shadow-2xl border border-gray-100 w-full max-w-2xl overflow-y-auto">
        <div className="text-center mb-8">
          <h2 className="text-4xl font-bold text-gray-800 bg-gradient-to-r from-green-600 to-teal-600 bg-clip-text text-transparent leading-tight py-2">
            Registro de Negocio
          </h2>
          <p className="text-gray-500 mt-2">Registra tu salón para empezar</p>
        </div>

        <form onSubmit={handleSubmit} className="space-y-6">
          {/* Campos del formulario */}
          {/* ... (código de los campos del formulario) ... */}

          {/* Botón de envío */}
          <button
            type="submit"
            className="w-full bg-gradient-to-r from-blue-600 to-purple-600 text-white font-semibold py-3 rounded-lg hover:from-blue-700 hover:to-purple-700 transition-all transform hover:scale-105 shadow-lg"
          >
            Registrar Negocio
          </button>
        </form>

        {/* Mensaje de error */}
        {error && (
          <div className="text-red-500 text-sm text-center">
            {error}
          </div>
        )}
      </div>
    </div>
  );
};

export default BusinessRegister;