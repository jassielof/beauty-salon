import React from 'react';
import { BrowserRouter as Router, Routes, Route, Link, useNavigate } from 'react-router-dom';
import { Search, MapPin, Calendar, Clock, Star, Scissors, Space as Spa, Camera, Users, Heart } from 'lucide-react';
import Register from './pages/register'; 
import Login from './pages/login'; 
import ClientRegister from './pages/ClientRegister';
import BusinessRegister from './pages/BusinessRegister';

const App: React.FC = () => {
  return (
    <Router>
      <div className="min-h-screen bg-white">
        {/* Header */}
        <Header />
        {/* Rutas */}
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/register" element={<Register />} />
          <Route path="/login" element={<Login />} />
          <Route path="/register/client" element={<ClientRegister />} />
          <Route path="/register/business" element={<BusinessRegister />} />
        </Routes>
        {/* Footer */}
        <Footer />
      </div>
    </Router>
  );
};

// Componente Header
const Header = () => {
  const navigate = useNavigate();

  const handleLogoClick = () => {
    navigate('/'); // Redirige a la página principal
    window.scrollTo(0, 0); // Desplaza la página al inicio
  };

  return (
    <header className="bg-white shadow-sm fixed w-full top-0 z-50">
      <div className="container mx-auto px-4 py-4 flex items-center justify-between">
        {/* Botón con manejador de clic personalizado */}
        <button
          onClick={handleLogoClick}
          className="text-2xl font-bold text-blue-600 hover:text-blue-800 focus:outline-none"
        >
          Salón de Belleza
        </button>
        <nav className="hidden md:flex space-x-6">
          <Link to="/business" className="text-gray-600 hover:text-gray-900">Negocios</Link>
          <Link to="/login" className="text-gray-600 hover:text-gray-900">Iniciar sesión</Link>
          <Link to="/register" className="bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700">
            Registrarse
          </Link>
        </nav>
      </div>
    </header>
  );
};

// Componente Home
const Home = () => {
  return (
    <>
      {/* Hero Section */}
      <section className="pt-24 pb-16 px-4">
        <div className="container mx-auto text-center">
          <h1 className="text-4xl md:text-6xl font-bold text-gray-900 mb-6">
            Reserva citas de belleza y bienestar
          </h1>
          <p className="text-xl text-gray-600 mb-8">
            Encuentra y reserva los mejores salones y spas cerca de ti
          </p>
          
          {/* Search Bar */}
          <div className="max-w-4xl mx-auto bg-white rounded-lg shadow-lg p-2">
            <div className="flex flex-col md:flex-row gap-4">
              <div className="flex-1 flex items-center border rounded-lg px-4 py-2">
                <Search className="w-5 h-5 text-gray-400 mr-2" />
                <input
                  type="text"
                  placeholder="Servicio"
                  className="w-full outline-none"
                />
              </div>
              <div className="flex-1 flex items-center border rounded-lg px-4 py-2">
                <MapPin className="w-5 h-5 text-gray-400 mr-2" />
                <input
                  type="text"
                  placeholder="Ubicación actual"
                  className="w-full outline-none"
                />
              </div>
              <button className="bg-blue-600 text-white px-8 py-3 rounded-lg hover:bg-blue-700">
                Buscar
              </button>
            </div>
          </div>
        </div>
      </section>

      {/* Popular Categories */}
      <section className="py-16 bg-gray-50">
        <div className="container mx-auto px-4">
          <h2 className="text-3xl font-bold text-center mb-12">Categorías Populares</h2>
          <div className="grid grid-cols-2 md:grid-cols-4 gap-8">
            <CategoryCard icon={<Scissors />} title="Cabello" count="12,435" />
            <CategoryCard icon={<Spa />} title="Uñas" count="8,742" />
            <CategoryCard icon={<Camera />} title="Maquillaje" count="6,129" />
            <CategoryCard icon={<Users />} title="Spa" count="4,891" />
          </div>
        </div>
      </section>

      {/* Featured Venues */}
      <section className="py-16">
        <div className="container mx-auto px-4">
          <h2 className="text-3xl font-bold text-center mb-12">Lugares Destacados</h2>
          <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
            <VenueCard
              image="https://images.unsplash.com/photo-1560066984-138dadb4c035?auto=format&fit=crop&w=800&q=80"
              name="Salón de Belleza Luxe"
              rating={4.8}
              reviews={128}
              location="Centro Comercial Av. Brasil"
            />
            <VenueCard
              image="https://images.unsplash.com/photo-1522337660859-02fbefca4702?auto=format&fit=crop&w=800&q=80"
              name="Spa Serenity"
              rating={4.9}
              reviews={256}
              location="2do Anillo - Paragua"
            />
            <VenueCard
              image="https://images.unsplash.com/photo-1487412947147-5cebf100ffc2?auto=format&fit=crop&w=800&q=80"
              name="Bienestar Puro"
              rating={4.7}
              reviews={189}
              location="Cine Center"
            />
          </div>
        </div>
      </section>

      {/* Features */}
      <section className="py-16 bg-gray-50">
        <div className="container mx-auto px-4">
          <h2 className="text-3xl font-bold text-center mb-12">Por qué elegirnos</h2>
          <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
            <FeatureCard
              icon={<Calendar className="w-8 h-8 text-blue-600" />}
              title="Reserva en línea 24/7"
              description="Reserva citas en cualquier momento y lugar"
            />
            <FeatureCard
              icon={<Clock className="w-8 h-8 text-blue-600" />}
              title="Confirmación instantánea"
              description="Recibe confirmaciones de reserva inmediatas"
            />
            <FeatureCard
              icon={<Heart className="w-8 h-8 text-blue-600" />}
              title="Reseñas verificadas"
              description="Lee reseñas auténticas de clientes"
            />
          </div>
        </div>
      </section>
    </>
  );
};

// Componente Footer
const Footer = () => {
  return (
    <footer className="bg-gray-900 text-white py-12">
      <div className="container mx-auto px-4">
        <div className="grid grid-cols-2 md:grid-cols-4 gap-8">
          <div>
            <h3 className="text-lg font-bold mb-4">Acerca de</h3>
            <ul className="space-y-2">
              <li><Link to="/about" className="hover:text-gray-300">Sobre nosotros</Link></li>
              <li><Link to="/careers" className="hover:text-gray-300">Carreras</Link></li>
              <li><Link to="/press" className="hover:text-gray-300">Prensa</Link></li>
            </ul>
          </div>
          {/* Otras secciones del footer */}
        </div>
      </div>
    </footer>
  );
};

// Componentes auxiliares
interface CategoryCardProps {
  icon: React.ReactElement;
  title: string;
  count: string;
}

const CategoryCard: React.FC<CategoryCardProps> = ({ icon, title, count }) => {
  return (
    <div className="bg-white rounded-lg p-6 text-center shadow-md hover:shadow-lg transition-shadow">
      <div className="inline-block p-3 bg-blue-50 rounded-full mb-4">
        {React.cloneElement(icon, { className: "w-6 h-6 text-blue-600" })}
      </div>
      <h3 className="text-lg font-semibold mb-2">{title}</h3>
      <p className="text-gray-500">{count} lugares</p>
    </div>
  );
};

interface VenueCardProps {
  image: string;
  name: string;
  rating: number;
  reviews: number;
  location: string;
}

const VenueCard: React.FC<VenueCardProps> = ({ image, name, rating, reviews, location }) => {
  return (
    <div className="bg-white rounded-lg overflow-hidden shadow-md hover:shadow-lg transition-shadow">
      <img src={image} alt={name} className="w-full h-48 object-cover" />
      <div className="p-4">
        <h3 className="text-lg font-semibold mb-2">{name}</h3>
        <div className="flex items-center mb-2">
          <Star className="w-4 h-4 text-yellow-400 mr-1" />
          <span className="text-gray-700">{rating}</span>
          <span className="text-gray-500 ml-1">({reviews} reseñas)</span>
        </div>
        <div className="flex items-center text-gray-500">
          <MapPin className="w-4 h-4 mr-1" />
          <span>{location}</span>
        </div>
      </div>
    </div>
  );
};

interface FeatureCardProps {
  icon: React.ReactElement;
  title: string;
  description: string;
}

const FeatureCard: React.FC<FeatureCardProps> = ({ icon, title, description }) => {
  return (
    <div className="text-center p-6">
      <div className="inline-block mb-4">
        {icon}
      </div>
      <h3 className="text-xl font-semibold mb-2">{title}</h3>
      <p className="text-gray-600">{description}</p>
    </div>
  );
};

export default App;