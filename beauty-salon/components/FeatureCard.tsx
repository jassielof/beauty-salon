import React from "react";

interface FeatureCardProps {
  icon: React.ReactElement;
  title: string;
  description: string;
  className?: string; // Añade className a las props
}

const FeatureCard: React.FC<FeatureCardProps> = ({ icon, title, description, className }) => {
  return (
    <div className={`text-center text-gray-800 p-6 ${className}`}>
      <div className="inline-block mb-4">
        {icon}
      </div>
      <h3 className="text-xl font-semibold mb-2">{title}</h3>
      <p className="text-gray-600">{description}</p>
    </div>
  );
};

export default FeatureCard;