import React from "react";
import { Search, MapPin, Calendar, Clock, Scissors, Spade, Camera, Users, Heart } from "lucide-react";
import CategoryCard from "@/components/CategoryCard";
import VenueCard from "@/components/VenueCard";
import FeatureCard from "@/components/FeatureCard";

export default function Home() {
  return (
    <>
      {/* Hero Section */}
      <section className="pt-24 pb-16 px-4 bg-white">
        <div className="container mx-auto text-center">
          <h1 className="text-4xl md:text-6xl font-bold text-gray-900 mb-6">
            Reserva citas de belleza y bienestar
          </h1>
          <p className="text-xl text-gray-800 mb-8">
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
                  className="w-full text-gray-900 outline-none"
                />
              </div>
              <div className="flex-1 flex items-center border rounded-lg px-4 py-2">
                <MapPin className="w-5 h-5 text-gray-400 mr-2" />
                <input
                  type="text"
                  placeholder="Ubicación actual"
                  className="w-full text-gray-900 outline-none"
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
          <h2 className="text-3xl text-gray-900 font-bold text-center mb-12">Categorías Populares</h2>
          <div className="grid grid-cols-2 md:grid-cols-4 gap-8">
            <CategoryCard icon={<Scissors />} title="Cabello" count="12,435" />
            <CategoryCard icon={<Spade />} title="Uñas" count="8,742" />
            <CategoryCard icon={<Camera />} title="Maquillaje" count="6,129" />
            <CategoryCard icon={<Users />} title="Spa" count="4,891" />
          </div>
        </div>
      </section>

      {/* Featured Venues */}
      <section className="py-16 bg-white">
        <div className="container mx-auto px-4">
          <h2 className="text-3xl font-bold text-gray-900 text-center mb-12">Lugares Destacados</h2>
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
          <h2 className="text-3xl font-bold text-gray-800 text-center mb-12">Por qué elegirnos</h2>
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
}