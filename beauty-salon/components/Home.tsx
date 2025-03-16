import React from "react";
import {
  Search,
  MapPin,
  Calendar,
  Clock,
  Scissors,
  Spade,
  Camera,
  Users,
  Heart,
} from "lucide-react";

import {
  Card,
  CardContent,
  CardDescription,
  CardFooter,
  CardHeader,
  CardTitle,
} from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import Image from "next/image";

export default function Home() {
  return (
    <>
      {/* Hero Section */}
      <section className="pt-24 pb-16 px-4 bg-gradient-to-b from-white to-gray-50">
        <div className="container mx-auto text-center">
          <h1 className="text-4xl md:text-6xl font-bold text-gray-900 mb-6 tracking-tight">
            Reserva citas de belleza y bienestar
          </h1>
          <p className="text-xl text-gray-500 mb-8 max-w-2xl mx-auto">
            Encuentra y reserva los mejores salones y spas cerca de ti
          </p>

          {/* Search Bar */}
          <Card className="max-w-4xl mx-auto border border-gray-200">
            <CardContent className="p-4">
              <div className="flex flex-col md:flex-row gap-4">
                <div className="flex-1 relative">
                  <Search className="absolute left-2 top-3 h-4 w-4 text-muted-foreground" />
                  <Input placeholder="Servicio" className="pl-8" />
                </div>
                <div className="flex-1 relative">
                  <MapPin className="absolute left-2 top-3 h-4 w-4 text-muted-foreground" />
                  <Input placeholder="Ubicación actual" className="pl-8" />
                </div>
                <Button size="lg" className="bg-blue-600 hover:bg-blue-700">
                  Buscar
                </Button>
              </div>
            </CardContent>
          </Card>
        </div>
      </section>

      {/* Popular Categories */}
      <section className="py-16 bg-gray-50">
        <div className="container mx-auto px-4">
          <h2 className="text-3xl text-gray-900 font-bold text-center mb-12">
            Categorías Populares
          </h2>
          <div className="grid grid-cols-2 md:grid-cols-4 gap-8">
            <Card className="border-none shadow-sm hover:shadow-md transition-shadow">
              <CardContent className="p-6 flex flex-col items-center text-center">
                <div className="w-12 h-12 bg-blue-100 rounded-full flex items-center justify-center mb-4">
                  <Scissors className="h-6 w-6 text-blue-600" />
                </div>
                <CardTitle className="mb-2">Cabello</CardTitle>
                <CardDescription>12,435 servicios</CardDescription>
              </CardContent>
            </Card>

            <Card className="border-none shadow-sm hover:shadow-md transition-shadow">
              <CardContent className="p-6 flex flex-col items-center text-center">
                <div className="w-12 h-12 bg-purple-100 rounded-full flex items-center justify-center mb-4">
                  <Spade className="h-6 w-6 text-purple-600" />
                </div>
                <CardTitle className="mb-2">Uñas</CardTitle>
                <CardDescription>8,742 servicios</CardDescription>
              </CardContent>
            </Card>

            <Card className="border-none shadow-sm hover:shadow-md transition-shadow">
              <CardContent className="p-6 flex flex-col items-center text-center">
                <div className="w-12 h-12 bg-pink-100 rounded-full flex items-center justify-center mb-4">
                  <Camera className="h-6 w-6 text-pink-600" />
                </div>
                <CardTitle className="mb-2">Maquillaje</CardTitle>
                <CardDescription>6,129 servicios</CardDescription>
              </CardContent>
            </Card>

            <Card className="border-none shadow-sm hover:shadow-md transition-shadow">
              <CardContent className="p-6 flex flex-col items-center text-center">
                <div className="w-12 h-12 bg-green-100 rounded-full flex items-center justify-center mb-4">
                  <Users className="h-6 w-6 text-green-600" />
                </div>
                <CardTitle className="mb-2">Spa</CardTitle>
                <CardDescription>4,891 servicios</CardDescription>
              </CardContent>
            </Card>
          </div>
        </div>
      </section>

      {/* Featured Venues */}
      <section className="py-16 bg-white">
        <div className="container mx-auto px-4">
          <h2 className="text-3xl font-bold text-gray-900 text-center mb-12">Lugares Destacados</h2>
          <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
            <Card className="overflow-hidden">
              <div className="aspect-video relative">
                <Image
                  width={800}
                  height={600}
                  src="https://images.unsplash.com/photo-1560066984-138dadb4c035?auto=format&fit=crop&w=800&q=80"
                  alt="Salón de Belleza Luxe"
                  className="object-cover w-full h-full"
                />
              </div>
              <CardHeader>
                <CardTitle>Salón de Belleza Luxe</CardTitle>
                <CardDescription>Centro Comercial Av. Brasil</CardDescription>
              </CardHeader>
              <CardFooter className="flex justify-between">
                <div className="flex items-center">
                  <Badge variant="outline" className="flex gap-1 items-center">
                    <svg
                      xmlns="http://www.w3.org/2000/svg"
                      viewBox="0 0 24 24"
                      fill="currentColor"
                      className="w-4 h-4 text-amber-500"
                    >
                      <path
                        fillRule="evenodd"
                        d="M10.788 3.21c.448-1.077 1.976-1.077 2.424 0l2.082 5.007 5.404.433c1.164.093 1.636 1.545.749 2.305l-4.117 3.527 1.257 5.273c.271 1.136-.964 2.033-1.96 1.425L12 18.354 7.373 21.18c-.996.608-2.231-.29-1.96-1.425l1.257-5.273-4.117-3.527c-.887-.76-.415-2.212.749-2.305l5.404-.433 2.082-5.006z"
                        clipRule="evenodd"
                      />
                    </svg>
                    4.8
                  </Badge>
                </div>
                <span className="text-sm text-muted-foreground">128 reseñas</span>
              </CardFooter>
            </Card>

            <Card className="overflow-hidden">
              <div className="aspect-video relative">
                <Image
                  width={800}
                  height={600}
                  src="https://images.unsplash.com/photo-1522337660859-02fbefca4702?auto=format&fit=crop&w=800&q=80"
                  alt="Spa Serenity"
                  className="object-cover w-full h-full"
                />
              </div>
              <CardHeader>
                <CardTitle>Spa Serenity</CardTitle>
                <CardDescription>2do Anillo - Paragua</CardDescription>
              </CardHeader>
              <CardFooter className="flex justify-between">
                <div className="flex items-center">
                  <Badge variant="outline" className="flex gap-1 items-center">
                    <svg
                      xmlns="http://www.w3.org/2000/svg"
                      viewBox="0 0 24 24"
                      fill="currentColor"
                      className="w-4 h-4 text-amber-500"
                    >
                      <path
                        fillRule="evenodd"
                        d="M10.788 3.21c.448-1.077 1.976-1.077 2.424 0l2.082 5.007 5.404.433c1.164.093 1.636 1.545.749 2.305l-4.117 3.527 1.257 5.273c.271 1.136-.964 2.033-1.96 1.425L12 18.354 7.373 21.18c-.996.608-2.231-.29-1.96-1.425l1.257-5.273-4.117-3.527c-.887-.76-.415-2.212.749-2.305l5.404-.433 2.082-5.006z"
                        clipRule="evenodd"
                      />
                    </svg>
                    4.9
                  </Badge>
                </div>
                <span className="text-sm text-muted-foreground">256 reseñas</span>
              </CardFooter>
            </Card>

            <Card className="overflow-hidden">
              <div className="aspect-video relative">
                <Image
                  width={800}
                  height={600}
                  src="https://images.unsplash.com/photo-1487412947147-5cebf100ffc2?auto=format&fit=crop&w=800&q=80"
                  alt="Bienestar Puro"
                  className="object-cover w-full h-full"
                />
              </div>
              <CardHeader>
                <CardTitle>Bienestar Puro</CardTitle>
                <CardDescription>Cine Center</CardDescription>
              </CardHeader>
              <CardFooter className="flex justify-between">
                <div className="flex items-center">
                  <Badge variant="outline" className="flex gap-1 items-center">
                    <svg
                      xmlns="http://www.w3.org/2000/svg"
                      viewBox="0 0 24 24"
                      fill="currentColor"
                      className="w-4 h-4 text-amber-500"
                    >
                      <path
                        fillRule="evenodd"
                        d="M10.788 3.21c.448-1.077 1.976-1.077 2.424 0l2.082 5.007 5.404.433c1.164.093 1.636 1.545.749 2.305l-4.117 3.527 1.257 5.273c.271 1.136-.964 2.033-1.96 1.425L12 18.354 7.373 21.18c-.996.608-2.231-.29-1.96-1.425l1.257-5.273-4.117-3.527c-.887-.76-.415-2.212.749-2.305l5.404-.433 2.082-5.006z"
                        clipRule="evenodd"
                      />
                    </svg>
                    4.7
                  </Badge>
                </div>
                <span className="text-sm text-muted-foreground">189 reseñas</span>
              </CardFooter>
            </Card>
          </div>
        </div>
      </section>

      {/* Features */}
      <section className="py-16 bg-gray-50">
        <div className="container mx-auto px-4">
          <h2 className="text-3xl font-bold text-gray-800 text-center mb-12">Por qué elegirnos</h2>
          <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
            <Card className="border-none shadow-sm">
              <CardHeader className="flex flex-col items-center">
                <div className="w-12 h-12 bg-blue-100 rounded-full flex items-center justify-center mb-4">
                  <Calendar className="h-6 w-6 text-blue-600" />
                </div>
                <CardTitle>Reserva en línea 24/7</CardTitle>
              </CardHeader>
              <CardContent>
                <p className="text-center text-muted-foreground">
                  Reserva citas en cualquier momento y lugar
                </p>
              </CardContent>
            </Card>

            <Card className="border-none shadow-sm">
              <CardHeader className="flex flex-col items-center">
                <div className="w-12 h-12 bg-blue-100 rounded-full flex items-center justify-center mb-4">
                  <Clock className="h-6 w-6 text-blue-600" />
                </div>
                <CardTitle>Confirmación instantánea</CardTitle>
              </CardHeader>
              <CardContent>
                <p className="text-center text-muted-foreground">
                  Recibe confirmaciones de reserva inmediatas
                </p>
              </CardContent>
            </Card>

            <Card className="border-none shadow-sm">
              <CardHeader className="flex flex-col items-center">
                <div className="w-12 h-12 bg-blue-100 rounded-full flex items-center justify-center mb-4">
                  <Heart className="h-6 w-6 text-blue-600" />
                </div>
                <CardTitle>Reseñas verificadas</CardTitle>
              </CardHeader>
              <CardContent>
                <p className="text-center text-muted-foreground">
                  Lee reseñas auténticas de clientes
                </p>
              </CardContent>
            </Card>
          </div>
        </div>
      </section>
    </>
  );
}
