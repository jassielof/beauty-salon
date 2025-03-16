"use client";

import { createClient } from '@/actions/actions';
import React, { useState } from 'react';
import { useRouter } from 'next/navigation';
import { useAuth } from '../../../context/AuthContext';
import bcrypt from 'bcryptjs';

const ClientRegister = () => {
  const router = useRouter();
  const { login } = useAuth();

  const [name, setName] = useState('');
  const [paternalSurname, setPaternalSurname] = useState('');
  const [maternalSurname, setMaternalSurname] = useState('');
  const [phoneNumber, setPhoneNumber] = useState('');
  const [sex, setSex] = useState('');
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [confirmPassword, setConfirmPassword] = useState('');
  const [legalId, setLegalId] = useState('');
  const [address, setAddress] = useState('');
  const [birthDate, setBirthDate] = useState('');
  const [error, setError] = useState('');

  const handleSubmit = async (event: React.FormEvent<HTMLFormElement>) => {
    event.preventDefault();

    // Validación de campos obligatorios
    if (!name || !paternalSurname || !maternalSurname || !phoneNumber || !sex || !email || !password || !confirmPassword || !legalId || !address || !birthDate) {
      setError('Por favor, complete todos los campos.');
      return;
    }

    // Validación de formato de correo electrónico
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(email)) {
      setError('Ingrese un correo electrónico válido.');
      return;
    }

    // Validación de longitud de contraseña
    if (password.length < 8) {
      setError('La contraseña debe tener al menos 8 caracteres.');
      return;
    }

    // Validación de coincidencia de contraseñas
    if (password !== confirmPassword) {
      setError('Las contraseñas no coinciden.');
      return;
    }

    try {
      // Hashear la contraseña antes de enviarla al servidor
      const hashedPassword = await bcrypt.hash(password, 10);

      // Datos del cliente para enviar al servidor
      const clientData = {
        name,
        paternalSurname,
        maternalSurname,
        phoneNumber,
        sex,
        email,
        password: hashedPassword,
        legalId,
        address,
        birthDate,
      };

      // Llamar a la función createClient para registrar al cliente
      const result = await createClient(clientData);

      if (result.success) {
        // Verificar si result.user está definido
        if (result.user) {
          // Loguear al usuario después del registro
          login({
            id: result.user.id, // Acceder al ID del usuario creado
            email: result.user.email,
            name: result.user.name,
            surname: result.user.surname,
            role: result.user.role,
          });

          // Redirigir al dashboard del cliente
          router.push('/dashboard/client');
        } else {
          setError('Error: No se pudo obtener la información del usuario.');
        }
      } else {
        setError(result.message);
      }
    } catch (error) {
      console.error('Error al registrar el cliente:', error);
      setError('Error de conexión con el servidor.');
    }
  };

  return (
    <div className="min-h-screen flex items-center justify-center bg-gradient-to-r from-blue-50 to-purple-50 p-4 pt-24">
      <div className="bg-white p-8 rounded-2xl shadow-2xl border border-gray-100 w-full max-w-md overflow-y-auto">
        <div className="text-center mb-8">
          <h2 className="text-4xl font-bold text-gray-800 bg-gradient-to-r from-blue-600 to-purple-600 bg-clip-text leading-tight py-2">
            Registro de Cliente
          </h2>
          <p className="text-gray-500 mt-2">Crea tu cuenta para empezar</p>
        </div>

        <form onSubmit={handleSubmit} className="space-y-6">
          <InputField label="Nombre" id="name" value={name} setValue={setName} placeholder="Ingrese su nombre" />
          <InputField label="Apellido Paterno" id="paternalSurname" value={paternalSurname} setValue={setPaternalSurname} placeholder="Ingrese su apellido paterno" />
          <InputField label="Apellido Materno" id="maternalSurname" value={maternalSurname} setValue={setMaternalSurname} placeholder="Ingrese su apellido materno" />
          <InputField label="Número de Teléfono" id="phoneNumber" value={phoneNumber} setValue={setPhoneNumber} placeholder="Ingrese su número de teléfono" type="tel" />
          <InputField label="Cédula de Identidad" id="legalId" value={legalId} setValue={setLegalId} placeholder="Ingrese su cédula de identidad" />
          <InputField label="Dirección" id="address" value={address} setValue={setAddress} placeholder="Ingrese su dirección" />
          <InputField label="Fecha de Nacimiento" id="birthDate" value={birthDate} setValue={setBirthDate} type="date" />

          <div>
            <label className="block text-sm font-medium text-black mb-2" htmlFor="sex">Sexo</label>
            <select id="sex" value={sex} onChange={(e) => setSex(e.target.value)} className="w-full px-4 py-3 rounded-lg border-2 border-gray-200 text-black focus:outline-none focus:border-blue-500 focus:ring-2 focus:ring-blue-200 transition-all" required>
              <option value="">Seleccione su sexo</option>
              <option value="Masculino">Masculino</option>
              <option value="Femenino">Femenino</option>
              <option value="Otro">Otro</option>
            </select>
          </div>

          <InputField label="Correo Electrónico" id="email" value={email} setValue={setEmail} placeholder="Ingrese su correo electrónico" type="email" />
          <InputField label="Contraseña" id="password" value={password} setValue={setPassword} placeholder="Ingrese su contraseña" type="password" />
          <InputField label="Confirmar Contraseña" id="confirmPassword" value={confirmPassword} setValue={setConfirmPassword} placeholder="Confirme su contraseña" type="password" />

          {error && <div className="text-red-500 text-sm text-center">{error}</div>}

          <button type="submit" className="w-full bg-gradient-to-r from-blue-600 to-purple-600 text-white font-semibold py-3 rounded-lg hover:from-blue-700 hover:to-purple-700 transition-all transform hover:scale-105 shadow-lg">
            Registrarse
          </button>
        </form>

        <div className="text-center mt-6">
          <p className="text-gray-600">
            ¿Ya tienes una cuenta?{' '}
            <a href="/login" className="text-blue-600 hover:text-blue-700 font-semibold">
              Iniciar sesión
            </a>
          </p>
        </div>
      </div>
    </div>
  );
};

interface InputFieldProps {
  label: string;
  id: string;
  value: string;
  setValue: React.Dispatch<React.SetStateAction<string>>;
  placeholder?: string;
  type?: string;
}

const InputField: React.FC<InputFieldProps> = ({ label, id, value, setValue, placeholder = "", type = "text" }) => (
  <div>
    <label className="block text-sm font-medium text-black mb-2" htmlFor={id}>{label}</label>
    <input 
      type={type} 
      id={id} 
      placeholder={placeholder} 
      value={value} 
      onChange={(e) => setValue(e.target.value)} 
      className="w-full px-4 py-3 rounded-lg border-2 border-gray-200 text-black focus:outline-none focus:border-blue-500 focus:ring-2 focus:ring-blue-200 transition-all" 
      required 
    />
  </div>
);

export default ClientRegister;