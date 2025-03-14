import Link from 'next/link';

const Footer = () => {
  return (
    <footer className="bg-gray-900 text-white py-12">
      <div className="container mx-auto px-4">
        <div className="grid grid-cols-2 md:grid-cols-4 gap-8">
          <div>
            <h3 className="text-lg font-bold mb-4">Acerca de</h3>
            <ul className="space-y-2">
              <li><Link href="/about" className="hover:text-gray-300">Sobre nosotros</Link></li>
              <li><Link href="/careers" className="hover:text-gray-300">Carreras</Link></li>
              <li><Link href="/press" className="hover:text-gray-300">Prensa</Link></li>
            </ul>
          </div>
          {/* Otras secciones del footer */}
        </div>
      </div>
    </footer>
  );
};

export default Footer;