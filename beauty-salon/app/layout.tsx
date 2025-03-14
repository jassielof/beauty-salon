import { AuthProvider } from '../context/AuthContext';
import Header from '../components/Header';
import Footer from '../components/Footer';
import './globals.css';

// Metadata para SEO (opcional)
export const metadata = {
  title: 'Beauty Salon',
  description: 'Bienvenido a Beauty Salon, tu lugar de belleza y cuidado personal.',
};

// Cargar fuentes personalizadas
import { Roboto } from 'next/font/google';

const roboto = Roboto({
  weight: ['400', '500', '700'], // Especifica los pesos de la fuente que necesitas
  subsets: ['latin'], // Especifica los subconjuntos de caracteres
  display: 'swap', // Mejora la renderización de fuentes
});

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="es" className={roboto.className}>
      <body className="min-h-screen bg-white">
        <AuthProvider>
          <Header />
          <main className="flex-grow">
            {children}
          </main>
          <Footer />
        </AuthProvider>
      </body>
    </html>
  );
}