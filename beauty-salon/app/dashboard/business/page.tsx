import { useState, useEffect } from 'react';
import { useAuth } from '../context/AuthContext';
import TimePicker from 'react-time-picker';
import 'react-time-picker/dist/TimePicker.css';
import 'react-clock/dist/Clock.css';

const BusinessDashboard = () => {
  const { user } = useAuth();

  // Estado para el horario de atención
  const [openingTime, setOpeningTime] = useState<string | null>('09:00');
  const [closingTime, setClosingTime] = useState<string | null>('18:00');

  // Estado para los servicios
  const [services, setServices] = useState<{ id: number; service: string; price: string; currency: string }[]>([]);
  const [newService, setNewService] = useState({ service: '', price: '', currency: '' });
  const [editingServiceIndex, setEditingServiceIndex] = useState<number | null>(null);

  // Estado para los empleados
  const [employees, setEmployees] = useState<{ id: number; name: string; role: string }[]>([]);
  const [newEmployee, setNewEmployee] = useState({ name: '', role: '' });
  const [editingEmployeeIndex, setEditingEmployeeIndex] = useState<number | null>(null);

  // Cargar datos del negocio al iniciar el dashboard
  useEffect(() => {
    const fetchBusinessData = async () => {
      try {
        if (user?.email) {
          const response = await fetch(`http://localhost:5000/api/business/${user.email}`);
          if (response.ok) {
            const data = await response.json();
            setOpeningTime(data.openingTime);
            setClosingTime(data.closingTime);
            setServices(
              data.services?.map(
                (service: { service: string; price: string; currency: string }, index: number) => ({
                  ...service,
                  id: index + 1,
                })
              ) || []
            );
            setEmployees(
              data.employees?.map(
                (employee: { name: string; role: string }, index: number) => ({
                  ...employee,
                  id: index + 1,
                })
              ) || []
            );
          } else {
            console.error('Error al cargar los datos del negocio');
          }
        }
      } catch (error) {
        console.error('Error de conexión con el servidor', error);
      }
    };

    fetchBusinessData();
    window.scrollTo(0, 0); // Forzar el scroll al inicio de la página
  }, [user]);

  // Función para guardar los cambios en el backend
  const saveChanges = async () => {
    try {
      if (user?.email) {
        const response = await fetch(`http://localhost:5000/api/business/${user.email}`, {
          method: 'PATCH',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({
            openingTime,
            closingTime,
            services,
            employees,
          }),
        });

        if (response.ok) {
          alert('Cambios guardados exitosamente');
        } else {
          alert('Error al guardar los cambios');
        }
      }
    } catch (error) {
      console.error('Error de conexión con el servidor', error);
    }
  };

  // Función para agregar o editar un servicio
  const handleService = () => {
    if (newService.service && newService.price && newService.currency) {
      if (editingServiceIndex !== null) {
        const updatedServices = [...services];
        updatedServices[editingServiceIndex] = { ...newService, id: services[editingServiceIndex].id };
        setServices(updatedServices);
        setEditingServiceIndex(null);
      } else {
        setServices([...services, { ...newService, id: services.length + 1 }]);
      }
      setNewService({ service: '', price: '', currency: '' });
    }
  };

  // Función para eliminar un servicio
  const removeService = (index: number) => {
    const updatedServices = services.filter((_, i) => i !== index);
    setServices(updatedServices);
  };

  // Función para editar un servicio
  const editService = (index: number) => {
    setNewService(services[index]);
    setEditingServiceIndex(index);
  };

  // Función para agregar o editar un empleado
  const handleEmployee = () => {
    if (newEmployee.name && newEmployee.role) {
      if (editingEmployeeIndex !== null) {
        const updatedEmployees = [...employees];
        updatedEmployees[editingEmployeeIndex] = { ...newEmployee, id: employees[editingEmployeeIndex].id };
        setEmployees(updatedEmployees);
        setEditingEmployeeIndex(null);
      } else {
        setEmployees([...employees, { ...newEmployee, id: employees.length + 1 }]);
      }
      setNewEmployee({ name: '', role: '' });
    }
  };

  // Función para eliminar un empleado
  const removeEmployee = (index: number) => {
    const updatedEmployees = employees.filter((_, i) => i !== index);
    setEmployees(updatedEmployees);
  };

  // Función para editar un empleado
  const editEmployee = (index: number) => {
    setNewEmployee(employees[index]);
    setEditingEmployeeIndex(index);
  };

  return (
    <div className="min-h-screen flex items-center justify-center bg-gradient-to-r from-blue-50 to-purple-50 p-4 pt-24">
      <div className="bg-white p-8 rounded-xl shadow-2xl border border-gray-100 w-full max-w-2xl overflow-y-auto">
        {/* Título */}
        <div className="text-center mb-8">
          <h2 className="text-3xl font-bold text-gray-800">Dashboard del Negocio</h2>
          <p className="text-gray-500 mt-2">Administra tu salón</p>
        </div>

        {/* Horario de Atención */}
        <div className="mb-8">
          <h3 className="text-xl font-semibold text-gray-700 mb-4">Horario de Atención</h3>
          <div className="flex flex-col space-y-4 md:flex-row md:space-y-0 md:space-x-4">
            <div className="flex-1">
              <label className="block text-sm font-medium text-gray-500 mb-1">Hora de Apertura</label>
              <TimePicker
                onChange={setOpeningTime}
                value={openingTime}
                className="w-full px-4 py-3 rounded-lg border-2 border-gray-200 focus:outline-none focus:border-blue-500 focus:ring-2 focus:ring-blue-200 transition-all"
              />
            </div>
            <div className="flex-1">
              <label className="block text-sm font-medium text-gray-500 mb-1">Hora de Cierre</label>
              <TimePicker
                onChange={setClosingTime}
                value={closingTime}
                className="w-full px-4 py-3 rounded-lg border-2 border-gray-200 focus:outline-none focus:border-blue-500 focus:ring-2 focus:ring-blue-200 transition-all"
              />
            </div>
          </div>
        </div>

        {/* Servicios */}
        <div className="mb-8">
          <h3 className="text-xl font-semibold text-gray-700 mb-4">Servicios</h3>
          {services.map((service, index) => (
            <div key={service.id} className="flex items-center justify-between mb-4">
              <div>
                <p className="text-gray-700">{service.service} - {service.price} {service.currency}</p>
              </div>
              <div className="flex space-x-2">
                <button
                  onClick={() => editService(index)}
                  className="bg-yellow-500 text-white px-4 py-2 rounded-lg hover:bg-yellow-600 transition-all"
                >
                  Editar
                </button>
                <button
                  onClick={() => removeService(index)}
                  className="bg-red-500 text-white px-4 py-2 rounded-lg hover:bg-red-600 transition-all"
                >
                  Eliminar
                </button>
              </div>
            </div>
          ))}
          <div className="flex flex-col space-y-4 md:flex-row md:space-y-0 md:space-x-4">
            <input
              type="text"
              placeholder="Nombre del servicio"
              value={newService.service}
              onChange={(e) => setNewService({ ...newService, service: e.target.value })}
              className="w-full px-4 py-3 rounded-lg border-2 border-gray-200 focus:outline-none focus:border-blue-500 focus:ring-2 focus:ring-blue-200 transition-all"
            />
            <input
              type="number"
              placeholder="Precio"
              value={newService.price}
              onChange={(e) => setNewService({ ...newService, price: e.target.value })}
              className="w-1/3 px-4 py-3 rounded-lg border-2 border-gray-200 focus:outline-none focus:border-blue-500 focus:ring-2 focus:ring-blue-200 transition-all"
            />
            <select
              value={newService.currency}
              onChange={(e) => setNewService({ ...newService, currency: e.target.value })}
              className="w-1/3 px-4 py-3 rounded-lg border-2 border-gray-200 focus:outline-none focus:border-blue-500 focus:ring-2 focus:ring-blue-200 transition-all"
            >
              <option value="">Moneda</option>
              <option value="BS">BS</option>
              <option value="USD">USD</option>
              <option value="EUR">EUR</option>
              <option value="GBP">GBP</option>
            </select>
            <button
              onClick={handleService}
              className="bg-green-500 text-white px-4 py-3 rounded-lg hover:bg-green-600 transition-all"
            >
              {editingServiceIndex !== null ? 'Actualizar' : 'Agregar'}
            </button>
          </div>
        </div>

        {/* Empleados */}
        <div className="mb-8">
          <h3 className="text-xl font-semibold text-gray-700 mb-4">Empleados</h3>
          {employees.map((employee, index) => (
            <div key={employee.id} className="flex items-center justify-between mb-4">
              <div>
                <p className="text-gray-700">{employee.name} - {employee.role}</p>
              </div>
              <div className="flex space-x-2">
                <button
                  onClick={() => editEmployee(index)}
                  className="bg-yellow-500 text-white px-4 py-2 rounded-lg hover:bg-yellow-600 transition-all"
                >
                  Editar
                </button>
                <button
                  onClick={() => removeEmployee(index)}
                  className="bg-red-500 text-white px-4 py-2 rounded-lg hover:bg-red-600 transition-all"
                >
                  Eliminar
                </button>
              </div>
            </div>
          ))}
          <div className="flex flex-col space-y-4 md:flex-row md:space-y-0 md:space-x-4">
            <input
              type="text"
              placeholder="Nombre del empleado"
              value={newEmployee.name}
              onChange={(e) => setNewEmployee({ ...newEmployee, name: e.target.value })}
              className="w-full px-4 py-3 rounded-lg border-2 border-gray-200 focus:outline-none focus:border-blue-500 focus:ring-2 focus:ring-blue-200 transition-all"
            />
            <input
              type="text"
              placeholder="Rol del empleado"
              value={newEmployee.role}
              onChange={(e) => setNewEmployee({ ...newEmployee, role: e.target.value })}
              className="w-full px-4 py-3 rounded-lg border-2 border-gray-200 focus:outline-none focus:border-blue-500 focus:ring-2 focus:ring-blue-200 transition-all"
            />
            <button
              onClick={handleEmployee}
              className="bg-green-500 text-white px-4 py-3 rounded-lg hover:bg-green-600 transition-all"
            >
              {editingEmployeeIndex !== null ? 'Actualizar' : 'Agregar'}
            </button>
          </div>
        </div>

        {/* Botón de Guardar Cambios */}
        <button
          onClick={saveChanges}
          className="w-full bg-gradient-to-r from-blue-600 to-purple-600 text-white font-semibold py-3 rounded-lg hover:from-blue-700 hover:to-purple-700 transition-all transform hover:scale-105"
        >
          Guardar Cambios
        </button>
      </div>
    </div>
  );
};

export default BusinessDashboard;