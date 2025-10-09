<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Connexion | eSanté+</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700;800&display=swap');

        * {
            font-family: 'Inter', sans-serif;
        }

        .gradient-bg {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }

        .gradient-text {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .input-focus {
            transition: all 0.3s ease;
        }

        .input-focus:focus {
            transform: translateY(-2px);
            box-shadow: 0 10px 25px rgba(102, 126, 234, 0.2);
        }

        .float-animation {
            animation: float 6s ease-in-out infinite;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-20px); }
        }

        .pulse-slow {
            animation: pulse 4s cubic-bezier(0.4, 0, 0.6, 1) infinite;
        }

        .fade-in {
            animation: fadeIn 0.8s ease-in;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .slide-in-left {
            animation: slideInLeft 0.8s ease-out;
        }

        @keyframes slideInLeft {
            from { opacity: 0; transform: translateX(-50px); }
            to { opacity: 1; transform: translateX(0); }
        }
    </style>
</head>
<body class="bg-gradient-to-br from-purple-50 via-white to-indigo-50 min-h-screen">

<!-- Navbar -->
<nav class="bg-white/80 backdrop-blur-lg shadow-sm fixed w-full z-50 fade-in">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex justify-between items-center h-20">
            <a href="<c:url value='/'/>" class="flex items-center space-x-3">
                <div class="w-12 h-12 gradient-bg rounded-xl flex items-center justify-center">
                    <i class="fas fa-heartbeat text-white text-2xl"></i>
                </div>
                <span class="text-3xl font-bold gradient-text">eSanté+</span>
            </a>

            <div class="flex items-center space-x-4">
                <span class="text-gray-600">Pas encore de compte ?</span>
                <a href="<c:url value='/register'/>" class="text-purple-600 hover:text-purple-700 font-semibold transition">
                    S'inscrire
                </a>
            </div>
        </div>
    </div>
</nav>

<!-- Main Content -->
<div class="min-h-screen flex items-center justify-center px-4 sm:px-6 lg:px-8 pt-20">
    <div class="max-w-6xl w-full grid md:grid-cols-2 gap-8 items-center">

        <!-- Left Side - Illustration -->
        <div class="hidden md:block slide-in-left">
            <div class="relative">
                <div class="absolute inset-0 bg-gradient-to-r from-purple-400 to-indigo-400 rounded-3xl blur-3xl opacity-20"></div>
                <div class="relative bg-white rounded-3xl p-12 shadow-2xl">
                    <div class="float-animation">
                        <div class="w-32 h-32 gradient-bg rounded-3xl flex items-center justify-center mx-auto mb-8">
                            <i class="fas fa-user-md text-white text-6xl"></i>
                        </div>
                    </div>

                    <h2 class="text-3xl font-bold text-gray-900 text-center mb-4">
                        Bienvenue sur <span class="gradient-text">eSanté+</span>
                    </h2>
                    <p class="text-gray-600 text-center mb-8">
                        Connectez-vous pour accéder à votre espace de gestion médicale
                    </p>

                    <div class="space-y-4">
                        <div class="flex items-center space-x-4 bg-purple-50 p-4 rounded-xl">
                            <div class="w-12 h-12 bg-purple-600 rounded-xl flex items-center justify-center flex-shrink-0">
                                <i class="fas fa-calendar-check text-white"></i>
                            </div>
                            <div>
                                <h4 class="font-semibold text-gray-900">Gestion simplifiée</h4>
                                <p class="text-sm text-gray-600">Rendez-vous et disponibilités</p>
                            </div>
                        </div>

                        <div class="flex items-center space-x-4 bg-indigo-50 p-4 rounded-xl">
                            <div class="w-12 h-12 bg-indigo-600 rounded-xl flex items-center justify-center flex-shrink-0">
                                <i class="fas fa-shield-alt text-white"></i>
                            </div>
                            <div>
                                <h4 class="font-semibold text-gray-900">Sécurité maximale</h4>
                                <p class="text-sm text-gray-600">Données protégées et cryptées</p>
                            </div>
                        </div>

                        <div class="flex items-center space-x-4 bg-purple-50 p-4 rounded-xl">
                            <div class="w-12 h-12 bg-purple-700 rounded-xl flex items-center justify-center flex-shrink-0">
                                <i class="fas fa-clock text-white"></i>
                            </div>
                            <div>
                                <h4 class="font-semibold text-gray-900">Disponible 24/7</h4>
                                <p class="text-sm text-gray-600">Accès à tout moment</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Right Side - Login Form -->
        <div class="fade-in">
            <div class="bg-white rounded-3xl shadow-2xl p-8 md:p-12">
                <div class="mb-8">
                    <h1 class="text-4xl font-bold text-gray-900 mb-2">Connexion</h1>
                    <p class="text-gray-600">Accédez à votre espace personnel</p>
                </div>

                <!-- Error Message -->
                <c:if test="${not empty error}">
                    <div class="mb-6 bg-red-50 border-l-4 border-red-500 p-4 rounded-lg">
                        <div class="flex items-center">
                            <i class="fas fa-exclamation-circle text-red-500 mr-3"></i>
                            <p class="text-red-700 font-medium">${error}</p>
                        </div>
                    </div>
                </c:if>

                <!-- Success Message -->
                <c:if test="${not empty success}">
                    <div class="mb-6 bg-green-50 border-l-4 border-green-500 p-4 rounded-lg">
                        <div class="flex items-center">
                            <i class="fas fa-check-circle text-green-500 mr-3"></i>
                            <p class="text-green-700 font-medium">${success}</p>
                        </div>
                    </div>
                </c:if>

                <form action="<c:url value='/login'/>" method="post" class="space-y-6">
                    <!-- Email Field -->
                    <div>
                        <label for="email" class="block text-sm font-semibold text-gray-700 mb-2">
                            <i class="fas fa-envelope mr-2 text-purple-600"></i>Email
                        </label>
                        <input
                                type="email"
                                id="email"
                                name="email"
                                required
                                class="w-full px-4 py-3 border-2 border-gray-200 rounded-xl focus:border-purple-500 focus:ring-4 focus:ring-purple-100 outline-none transition input-focus"
                                placeholder="votre.email@exemple.com"
                        >
                    </div>

                    <!-- Password Field -->
                    <div>
                        <label for="password" class="block text-sm font-semibold text-gray-700 mb-2">
                            <i class="fas fa-lock mr-2 text-purple-600"></i>Mot de passe
                        </label>
                        <div class="relative">
                            <input
                                    type="password"
                                    id="password"
                                    name="password"
                                    required
                                    class="w-full px-4 py-3 border-2 border-gray-200 rounded-xl focus:border-purple-500 focus:ring-4 focus:ring-purple-100 outline-none transition input-focus"
                                    placeholder="••••••••"
                            >
                            <button
                                    type="button"
                                    onclick="togglePassword()"
                                    class="absolute right-4 top-1/2 transform -translate-y-1/2 text-gray-400 hover:text-purple-600 transition"
                            >
                                <i class="fas fa-eye" id="toggleIcon"></i>
                            </button>
                        </div>
                    </div>

                    <!-- Remember Me & Forgot Password -->
                    <div class="flex items-center justify-between">
                        <label class="flex items-center space-x-2 cursor-pointer">
                            <input
                                    type="checkbox"
                                    name="remember"
                                    class="w-5 h-5 text-purple-600 border-gray-300 rounded focus:ring-purple-500"
                            >
                            <span class="text-sm text-gray-700">Se souvenir de moi</span>
                        </label>
<%--                        <a href="<c:url value='/forgot-password'/>" class="text-sm text-purple-600 hover:text-purple-700 font-semibold transition">--%>
<%--                            Mot de passe oublié ?--%>
<%--                        </a>--%>
                    </div>

                    <!-- Submit Button -->
                    <button
                            type="submit"
                            class="w-full bg-gradient-to-r from-purple-600 to-indigo-600 text-white py-4 rounded-xl font-bold text-lg hover:shadow-xl hover:shadow-purple-500/50 transition transform hover:scale-105 flex items-center justify-center space-x-2"
                    >
                        <span>Se connecter</span>
                        <i class="fas fa-arrow-right"></i>
                    </button>
                </form>

                <!-- Divider -->
                <div class="relative my-8">
                    <div class="absolute inset-0 flex items-center">
                        <div class="w-full border-t border-gray-200"></div>
                    </div>
                    <div class="relative flex justify-center text-sm">
                        <span class="px-4 bg-white text-gray-500">Ou se connecter avec</span>
                    </div>
                </div>

                <!-- Social Login Buttons -->
                <div class="grid grid-cols-2 gap-4">
                    <button class="flex items-center justify-center space-x-2 px-4 py-3 border-2 border-gray-200 rounded-xl hover:border-purple-300 hover:bg-purple-50 transition">
                        <i class="fab fa-google text-red-500 text-xl"></i>
                        <span class="font-semibold text-gray-700">Google</span>
                    </button>
                    <button class="flex items-center justify-center space-x-2 px-4 py-3 border-2 border-gray-200 rounded-xl hover:border-purple-300 hover:bg-purple-50 transition">
                        <i class="fab fa-microsoft text-blue-500 text-xl"></i>
                        <span class="font-semibold text-gray-700">Microsoft</span>
                    </button>
                </div>

                <!-- Register Link -->
                <div class="mt-8 text-center">
                    <p class="text-gray-600">
                        Vous n'avez pas de compte ?
                        <a href="<c:url value='/register'/>" class="text-purple-600 hover:text-purple-700 font-bold transition">
                            Créer un compte
                        </a>
                    </p>
                </div>
            </div>
        </div>

    </div>
</div>

<!-- Footer -->
<footer class="bg-white border-t border-gray-100 py-6 mt-12">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex flex-col md:flex-row justify-between items-center">
            <p class="text-gray-600 text-sm">© 2025 eSanté+. Tous droits réservés.</p>
            <div class="flex space-x-6 mt-4 md:mt-0">
                <a href="#" class="text-gray-500 hover:text-purple-600 text-sm transition">Confidentialité</a>
                <a href="#" class="text-gray-500 hover:text-purple-600 text-sm transition">Conditions</a>
                <a href="#" class="text-gray-500 hover:text-purple-600 text-sm transition">Aide</a>
            </div>
        </div>
    </div>
</footer>

<script>
    function togglePassword() {
        const passwordField = document.getElementById('password');
        const toggleIcon = document.getElementById('toggleIcon');

        if (passwordField.type === 'password') {
            passwordField.type = 'text';
            toggleIcon.classList.remove('fa-eye');
            toggleIcon.classList.add('fa-eye-slash');
        } else {
            passwordField.type = 'password';
            toggleIcon.classList.remove('fa-eye-slash');
            toggleIcon.classList.add('fa-eye');
        }
    }
</script>

</body>
</html>