import React from "react";
import Image from "next/image";
import { Star, MapPin } from "lucide-react";

interface VenueCardProps {
  image: string;
  name: string;
  rating: number;
  reviews: number;
  location: string;
  className?: string; // Añade className a las props
}

const VenueCard: React.FC<VenueCardProps> = ({ image, name, rating, reviews, location, className }) => {
  return (
    <div className={`bg-white rounded-lg overflow-hidden shadow-md hover:shadow-lg transition-shadow ${className}`}>
      <Image src={image} alt={name} width={800} height={400} className="w-full h-48 object-cover" />
      <div className="p-4 text-gray-700">
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

export default VenueCard;