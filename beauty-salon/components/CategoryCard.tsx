import React from "react";

interface CategoryCardProps {
  icon: React.ReactElement<{ className?: string }>; // Asegúrate de que el icono acepte className
  title: string;
  count: string;
  className?: string; // Añade className a las props
}

const CategoryCard: React.FC<CategoryCardProps> = ({ icon, title, count, className }) => {
  // Verifica si el icono es válido antes de clonarlo
  const clonedIcon = icon
    ? React.cloneElement(icon, { className: "w-6 h-6 text-blue-600" })
    : null;

  return (
    <div className={`bg-white rounded-lg p-6 text-center shadow-md hover:shadow-lg transition-shadow ${className}`}>
      <div className="inline-block p-3 bg-blue-50 rounded-full mb-4">
        {clonedIcon} {/* Usa el icono clonado */}
      </div>
      <h3 className="text-lg text-gray-800 font-semibold mb-2">{title}</h3>
      <p className="text-gray-500">{count} lugares</p>
    </div>
  );
};

export default CategoryCard;