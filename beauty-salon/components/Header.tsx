"use client";
import Link from "next/link";
import { useState } from "react";
import { useAuth } from "../context/AuthContext";
import { Button, buttonVariants } from "@/components/ui/button";
import { Avatar, AvatarFallback } from "@/components/ui/avatar";
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuSeparator,
  DropdownMenuTrigger,
} from "@/components/ui/dropdown-menu";
import { Sheet, SheetContent, SheetTrigger } from "@/components/ui/sheet";
import { Menu } from "lucide-react";

export default function Header() {
  const { user, logout } = useAuth();
  const [isOpen, setIsOpen] = useState(false);

  const handleLogout = () => {
    logout();
    window.location.href = "/";
  };

  const getInitials = (email: string) => {
    return email.charAt(0).toUpperCase();
  };

  const navigateToDashboard = () => {
    if (user?.role === "CLIENT") {
      window.location.href = "/dashboard/client";
    } else if (user?.role === "OWNER") {
      window.location.href = "/dashboard/business";
    }
  };

  return (
    <header className="bg-white border-b border-gray-100 fixed w-full top-0 z-50">
      <div className="container mx-auto px-4 h-16 flex items-center justify-between">
        <Link href="/" className={buttonVariants({ variant: "default" })}>
          Salón de Belleza
        </Link>

        {/* Desktop Navigation */}
        <nav className="hidden md:flex items-center space-x-4">
          {user ? (
            <DropdownMenu>
              <DropdownMenuTrigger asChild>
                <Button variant="ghost" className="flex items-center gap-2 px-2">
                  <Avatar className="h-8 w-8">
                    <AvatarFallback className="bg-primary text-primary-foreground">
                      {getInitials(user.email)}
                    </AvatarFallback>
                  </Avatar>
                  <span className="text-sm font-normal">{user.email}</span>
                </Button>
              </DropdownMenuTrigger>
              <DropdownMenuContent align="end" className="w-56">
                <div className="px-2 py-1.5 text-sm font-medium text-muted-foreground">
                  {user.role === "CLIENT" ? "Cliente" : "Negocio"}
                </div>
                <DropdownMenuSeparator />
                <DropdownMenuItem onClick={navigateToDashboard}>Dashboard</DropdownMenuItem>
                <DropdownMenuSeparator />
                <DropdownMenuItem onClick={handleLogout} className="text-red-500">
                  Cerrar sesión
                </DropdownMenuItem>
              </DropdownMenuContent>
            </DropdownMenu>
          ) : (
            <>
              <Link href="/business" className={buttonVariants({ variant: "default" })}>
                Negocios
              </Link>
              <Link href="/login" className={buttonVariants({ variant: "default" })}>
                Iniciar sesión
              </Link>
              <Link href="/register" className={buttonVariants({ variant: "default" })}>
                Registrarse
              </Link>
            </>
          )}
        </nav>
      </div>
    </header>
  );
}
