<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>eSanté+ | Gestion de Clinique Intelligente</title>
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

        .card-hover {
            transition: all 0.3s ease;
        }

        .card-hover:hover {
            transform: translateY(-8px);
            box-shadow: 0 20px 40px rgba(102, 126, 234, 0.3);
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
            animation: fadeIn 1s ease-in;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body class="bg-gradient-to-br from-purple-50 via-white to-indigo-50 min-h-screen">

<!-- Navbar -->
<nav class="bg-white/80 backdrop-blur-lg shadow-sm fixed w-full z-50 fade-in">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex justify-between items-center h-20">
            <div class="flex items-center space-x-3">
                <div class="w-12 h-12 gradient-bg rounded-xl flex items-center justify-center">
                    <i class="fas fa-heartbeat text-white text-2xl"></i>
                </div>
                <span class="text-3xl font-bold gradient-text">eSanté+</span>
            </div>

            <div class="hidden md:flex items-center space-x-8">
                <a href="#features" class="text-gray-700 hover:text-purple-600 transition font-medium">Fonctionnalités</a>
                <a href="#about" class="text-gray-700 hover:text-purple-600 transition font-medium">À propos</a>
                <a href="#contact" class="text-gray-700 hover:text-purple-600 transition font-medium">Contact</a>
            </div>

            <div class="flex items-center space-x-4">
                <a href="<c:url value='/login'/>" class="text-purple-600 hover:text-purple-700 font-semibold transition">
                    Se Connecter
                </a>
                <a href="<c:url value='/register'/>" class="bg-gradient-to-r from-purple-600 to-indigo-600 text-white px-6 py-3 rounded-xl hover:shadow-lg hover:shadow-purple-500/50 transition transform hover:scale-105 font-semibold">
                    S'inscrire
                </a>
            </div>
        </div>
    </div>
</nav>

<!-- Hero Section -->
<section class="pt-32 pb-20 px-4 sm:px-6 lg:px-8 fade-in">
    <div class="max-w-7xl mx-auto">
        <div class="grid md:grid-cols-2 gap-12 items-center">
            <div class="space-y-8">
                <div class="inline-block">
                        <span class="bg-purple-100 text-purple-700 px-4 py-2 rounded-full text-sm font-semibold">
                            <i class="fas fa-star mr-2"></i>Solution Moderne de Gestion Clinique
                        </span>
                </div>

                <h1 class="text-5xl md:text-6xl font-bold text-gray-900 leading-tight">
                    Votre Santé,
                    <span class="gradient-text block">Notre Priorité</span>
                </h1>

                <p class="text-xl text-gray-600 leading-relaxed">
                    Automatisez la gestion de votre clinique avec eSanté+. Rendez-vous, dossiers patients,
                    disponibilités médecins - tout centralisé en une plateforme intelligente.
                </p>

                <div class="flex flex-wrap gap-4">
                    <a href="<c:url value='/register'/>" class="bg-gradient-to-r from-purple-600 to-indigo-600 text-white px-8 py-4 rounded-xl hover:shadow-xl hover:shadow-purple-500/50 transition transform hover:scale-105 font-semibold text-lg flex items-center">
                        Commencer Maintenant
                        <i class="fas fa-arrow-right ml-3"></i>
                    </a>
                    <a href="#features" class="bg-white text-purple-600 px-8 py-4 rounded-xl border-2 border-purple-200 hover:border-purple-400 transition font-semibold text-lg flex items-center">
                        <i class="fas fa-play-circle mr-3"></i>
                        Découvrir
                    </a>
                </div>

                <div class="flex items-center space-x-8 pt-4">
                    <div class="flex -space-x-3">
                        <div class="w-10 h-10 rounded-full bg-purple-500 border-2 border-white flex items-center justify-center">
                            <i class="fas fa-user-md text-white text-sm"></i>
                        </div>
                        <div class="w-10 h-10 rounded-full bg-indigo-500 border-2 border-white flex items-center justify-center">
                            <i class="fas fa-user-nurse text-white text-sm"></i>
                        </div>
                        <div class="w-10 h-10 rounded-full bg-purple-700 border-2 border-white flex items-center justify-center">
                            <i class="fas fa-users text-white text-sm"></i>
                        </div>
                    </div>
                    <div>
                        <p class="text-gray-900 font-bold">500+ Professionnels</p>
                        <p class="text-gray-600 text-sm">Nous font confiance</p>
                    </div>
                </div>
            </div>

            <div class="relative float-animation">
                <div class="absolute inset-0 bg-gradient-to-r from-purple-400 to-indigo-400 rounded-3xl blur-3xl opacity-20"></div>
                <img src="https://images.unsplash.com/photo-1576091160399-112ba8d25d1d?w=800&q=80"
                     alt="Clinique moderne"
                     class="relative rounded-3xl shadow-2xl w-full">

                <!-- Floating Stats Cards -->
                <div class="absolute -bottom-6 -left-6 bg-white rounded-2xl shadow-xl p-4 card-hover">
                    <div class="flex items-center space-x-3">
                        <div class="w-12 h-12 bg-green-100 rounded-xl flex items-center justify-center">
                            <i class="fas fa-check-circle text-green-600 text-xl"></i>
                        </div>
                        <div>
                            <p class="text-2xl font-bold text-gray-900">98%</p>
                            <p class="text-sm text-gray-600">Satisfaction</p>
                        </div>
                    </div>
                </div>

                <div class="absolute -top-6 -right-6 bg-white rounded-2xl shadow-xl p-4 card-hover">
                    <div class="flex items-center space-x-3">
                        <div class="w-12 h-12 bg-purple-100 rounded-xl flex items-center justify-center">
                            <i class="fas fa-calendar-check text-purple-600 text-xl"></i>
                        </div>
                        <div>
                            <p class="text-2xl font-bold text-gray-900">24/7</p>
                            <p class="text-sm text-gray-600">Disponible</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Features Section -->
<section id="features" class="py-20 px-4 sm:px-6 lg:px-8 bg-white">
    <div class="max-w-7xl mx-auto">
        <div class="text-center mb-16">
            <span class="text-purple-600 font-semibold text-lg">Fonctionnalités</span>
            <h2 class="text-4xl md:text-5xl font-bold text-gray-900 mt-3">
                Tout ce dont vous avez <span class="gradient-text">besoin</span>
            </h2>
            <p class="text-gray-600 text-lg mt-4 max-w-2xl mx-auto">
                Une solution complète pour moderniser la gestion de votre établissement de santé
            </p>
        </div>

        <div class="grid md:grid-cols-3 gap-8">
            <div class="bg-gradient-to-br from-purple-50 to-indigo-50 p-8 rounded-2xl card-hover">
                <div class="w-14 h-14 bg-purple-600 rounded-xl flex items-center justify-center mb-6">
                    <i class="fas fa-calendar-alt text-white text-2xl"></i>
                </div>
                <h3 class="text-2xl font-bold text-gray-900 mb-4">Gestion des Rendez-vous</h3>
                <p class="text-gray-600 leading-relaxed">
                    Planification intelligente, rappels automatiques, et synchronisation en temps réel des disponibilités.
                </p>
            </div>

            <div class="bg-gradient-to-br from-purple-50 to-indigo-50 p-8 rounded-2xl card-hover">
                <div class="w-14 h-14 bg-indigo-600 rounded-xl flex items-center justify-center mb-6">
                    <i class="fas fa-user-injured text-white text-2xl"></i>
                </div>
                <h3 class="text-2xl font-bold text-gray-900 mb-4">Dossiers Patients</h3>
                <p class="text-gray-600 leading-relaxed">
                    Suivi médical complet, historique des consultations, et traçabilité totale des opérations.
                </p>
            </div>

            <div class="bg-gradient-to-br from-purple-50 to-indigo-50 p-8 rounded-2xl card-hover">
                <div class="w-14 h-14 bg-purple-700 rounded-xl flex items-center justify-center mb-6">
                    <i class="fas fa-user-md text-white text-2xl"></i>
                </div>
                <h3 class="text-2xl font-bold text-gray-900 mb-4">Gestion Médicale</h3>
                <p class="text-gray-600 leading-relaxed">
                    Organisation des médecins, spécialités, départements et disponibilités en une interface unifiée.
                </p>
            </div>

            <div class="bg-gradient-to-br from-purple-50 to-indigo-50 p-8 rounded-2xl card-hover">
                <div class="w-14 h-14 bg-green-600 rounded-xl flex items-center justify-center mb-6">
                    <i class="fas fa-shield-alt text-white text-2xl"></i>
                </div>
                <h3 class="text-2xl font-bold text-gray-900 mb-4">Sécurité Renforcée</h3>
                <p class="text-gray-600 leading-relaxed">
                    Protection des données médicales avec authentification sécurisée et conformité RGPD.
                </p>
            </div>

            <div class="bg-gradient-to-br from-purple-50 to-indigo-50 p-8 rounded-2xl card-hover">
                <div class="w-14 h-14 bg-orange-600 rounded-xl flex items-center justify-center mb-6">
                    <i class="fas fa-chart-line text-white text-2xl"></i>
                </div>
                <h3 class="text-2xl font-bold text-gray-900 mb-4">Rapports & Analytics</h3>
                <p class="text-gray-600 leading-relaxed">
                    Tableaux de bord intuitifs pour suivre l'activité et optimiser les performances de votre clinique.
                </p>
            </div>

            <div class="bg-gradient-to-br from-purple-50 to-indigo-50 p-8 rounded-2xl card-hover">
                <div class="w-14 h-14 bg-blue-600 rounded-xl flex items-center justify-center mb-6">
                    <i class="fas fa-mobile-alt text-white text-2xl"></i>
                </div>
                <h3 class="text-2xl font-bold text-gray-900 mb-4">Interface Moderne</h3>
                <p class="text-gray-600 leading-relaxed">
                    Design responsive, intuitif et accessible depuis tous vos appareils - PC, tablette, mobile.
                </p>
            </div>
        </div>
    </div>
</section>

<!-- CTA Section -->
<section class="py-20 px-4 sm:px-6 lg:px-8">
    <div class="max-w-5xl mx-auto">
        <div class="gradient-bg rounded-3xl p-12 md:p-16 text-center relative overflow-hidden">
            <div class="absolute inset-0 opacity-10">
                <div class="absolute top-0 left-0 w-64 h-64 bg-white rounded-full -translate-x-1/2 -translate-y-1/2 pulse-slow"></div>
                <div class="absolute bottom-0 right-0 w-96 h-96 bg-white rounded-full translate-x-1/2 translate-y-1/2 pulse-slow"></div>
            </div>

            <div class="relative z-10">
                <h2 class="text-4xl md:text-5xl font-bold text-white mb-6">
                    Prêt à moderniser votre clinique ?
                </h2>
                <p class="text-xl text-purple-100 mb-8 max-w-2xl mx-auto">
                    Rejoignez les centaines de professionnels qui ont déjà choisi eSanté+ pour optimiser leur gestion.
                </p>
                <a href="<c:url value='/register'/>" class="inline-flex items-center bg-white text-purple-600 px-8 py-4 rounded-xl hover:shadow-2xl transition transform hover:scale-105 font-bold text-lg">
                    Démarrer Gratuitement
                    <i class="fas fa-arrow-right ml-3"></i>
                </a>
            </div>
        </div>
    </div>
</section>

<!-- Footer -->
<footer class="bg-gray-900 text-gray-300 py-12 px-4 sm:px-6 lg:px-8">
    <div class="max-w-7xl mx-auto">
        <div class="grid md:grid-cols-4 gap-8 mb-8">
            <div class="col-span-2">
                <div class="flex items-center space-x-3 mb-4">
                    <div class="w-10 h-10 gradient-bg rounded-lg flex items-center justify-center">
                        <i class="fas fa-heartbeat text-white"></i>
                    </div>
                    <span class="text-2xl font-bold text-white">eSanté+</span>
                </div>
                <p class="text-gray-400 max-w-md">
                    La solution complète pour automatiser la gestion de votre clinique et améliorer l'expérience patient.
                </p>
            </div>

            <div>
                <h4 class="text-white font-semibold mb-4">Liens Rapides</h4>
                <ul class="space-y-2">
                    <li><a href="#features" class="hover:text-purple-400 transition">Fonctionnalités</a></li>
                    <li><a href="#about" class="hover:text-purple-400 transition">À propos</a></li>
                    <li><a href="#contact" class="hover:text-purple-400 transition">Contact</a></li>
                </ul>
            </div>

            <div>
                <h4 class="text-white font-semibold mb-4">Technologies</h4>
                <ul class="space-y-2">
                    <li class="text-gray-400">Java EE</li>
                    <li class="text-gray-400">JPA/Hibernate</li>
                    <li class="text-gray-400">Maven</li>
                </ul>
            </div>
        </div>

        <div class="border-t border-gray-800 pt-8 flex flex-col md:flex-row justify-between items-center">
            <p class="text-gray-400">© 2025 eSanté+. Tous droits réservés.</p>
            <div class="flex space-x-6 mt-4 md:mt-0">
                <a href="#" class="text-gray-400 hover:text-purple-400 transition">
                    <i class="fab fa-facebook text-xl"></i>
                </a>
                <a href="#" class="text-gray-400 hover:text-purple-400 transition">
                    <i class="fab fa-twitter text-xl"></i>
                </a>
                <a href="#" class="text-gray-400 hover:text-purple-400 transition">
                    <i class="fab fa-linkedin text-xl"></i>
                </a>
            </div>
        </div>
    </div>
</footer>

</body>
</html>