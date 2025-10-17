<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard Médecin | eSanté+</title>
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

        .fade-in {
            animation: fadeIn 0.6s ease-in;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .nav-link {
            transition: all 0.2s ease;
        }

        .nav-link:hover {
            background: rgba(255, 255, 255, 0.15);
            transform: translateX(5px);
        }

        .nav-link.active {
            background: rgba(255, 255, 255, 0.2);
        }
    </style>
</head>
<body class="bg-gradient-to-br from-purple-50 via-white to-indigo-50 min-h-screen">

<!-- Sidebar -->
<div class="fixed left-0 top-0 h-full w-64 gradient-bg text-white p-6 shadow-2xl z-40">
    <div class="flex items-center space-x-3 mb-12">
        <div class="w-12 h-12 bg-white/20 backdrop-blur-lg rounded-xl flex items-center justify-center">
            <i class="fas fa-heartbeat text-white text-2xl"></i>
        </div>
        <span class="text-2xl font-bold">eSanté+</span>
    </div>

    <nav class="space-y-2">
        <a href="<c:url value='/doctor/dashboard'/>" class="nav-link active flex items-center space-x-3 px-4 py-3 rounded-xl">
            <i class="fas fa-chart-line w-5"></i>
            <span class="font-semibold">Dashboard</span>
        </a>
        <a href="<c:url value='/doctor/rendezVous'/>" class="nav-link flex items-center space-x-3 px-4 py-3 rounded-xl">
            <i class="fas fa-calendar-check w-5"></i>
            <span>Mes Rendez-vous</span>
        </a>
        <a href="<c:url value='/doctor/availability'/>" class="nav-link flex items-center space-x-3 px-4 py-3 rounded-xl">
            <i class="fas fa-clock w-5"></i>
            <span>Disponibilités</span>
        </a>
        <a href="#" class="nav-link flex items-center space-x-3 px-4 py-3 rounded-xl">
            <i class="fas fa-user-injured w-5"></i>
            <span>Mes Patients</span>
        </a>
    </nav>

    <div class="absolute bottom-6 left-6 right-6">
        <div class="bg-white/10 backdrop-blur-lg rounded-xl p-4 mb-4">
            <div class="flex items-center space-x-3">
                <div class="w-10 h-10 bg-white/20 rounded-lg flex items-center justify-center">
                    <i class="fas fa-user-md text-white"></i>
                </div>
                <div class="flex-1 min-w-0">
                    <p class="text-white font-semibold text-sm truncate">
                        Dr. <c:out value="${sessionScope.user.nom}"/>
                    </p>
                    <p class="text-purple-200 text-xs">${sessionScope.user.role}</p>
                </div>
            </div>
        </div>
        <a href="<c:url value='/logout'/>" class="nav-link flex items-center space-x-3 px-4 py-3 rounded-xl text-white/80 hover:text-white">
            <i class="fas fa-sign-out-alt w-5"></i>
            <span>Déconnexion</span>
        </a>
    </div>
</div>

<!-- Main Content -->
<div class="ml-64 p-8">
    <!-- Header -->
    <div class="bg-white rounded-2xl shadow-lg p-6 mb-8 fade-in">
        <div class="flex justify-between items-center">
            <div>
                <h1 class="text-3xl font-bold text-gray-900">
                    Bienvenue, <span class="gradient-text">Dr. <c:out value="${sessionScope.user.nom}"/></span> !
                </h1>
                <p class="text-gray-600 mt-1">Gérez votre emploi du temps et vos consultations</p>
            </div>
            <div class="flex items-center space-x-4">
                <button class="bg-purple-100 text-purple-600 px-4 py-2 rounded-xl hover:bg-purple-200 transition">
                    <i class="fas fa-bell mr-2"></i>
                    <span class="font-semibold">5</span>
                </button>
            </div>
        </div>
    </div>

    <!-- Stats Cards -->
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
        <!-- RDV Aujourd'hui -->
        <div class="bg-white rounded-2xl shadow-lg p-6 card-hover fade-in">
            <div class="flex justify-between items-start mb-4">
                <div class="w-12 h-12 bg-blue-100 rounded-xl flex items-center justify-center">
                    <i class="fas fa-calendar-day text-blue-600 text-xl"></i>
                </div>
                <span class="bg-blue-100 text-blue-700 text-xs font-semibold px-2 py-1 rounded-lg">
                    Aujourd'hui
                </span>
            </div>
            <p class="text-gray-600 text-sm mb-1">Rendez-vous</p>
            <p class="text-3xl font-bold text-gray-900">8</p>
            <p class="text-gray-500 text-xs mt-2">
                <i class="fas fa-clock text-blue-500 mr-1"></i>
                3 en attente
            </p>
        </div>

        <!-- Patients Total -->
        <div class="bg-white rounded-2xl shadow-lg p-6 card-hover fade-in" style="animation-delay: 0.1s;">
            <div class="flex justify-between items-start mb-4">
                <div class="w-12 h-12 bg-purple-100 rounded-xl flex items-center justify-center">
                    <i class="fas fa-user-injured text-purple-600 text-xl"></i>
                </div>
                <span class="bg-green-100 text-green-700 text-xs font-semibold px-2 py-1 rounded-lg">
                    +15%
                </span>
            </div>
            <p class="text-gray-600 text-sm mb-1">Mes Patients</p>
            <p class="text-3xl font-bold text-gray-900">142</p>
            <p class="text-gray-500 text-xs mt-2">
                <i class="fas fa-arrow-up text-green-500 mr-1"></i>
                18 nouveaux ce mois
            </p>
        </div>

        <!-- Consultations Semaine -->
        <div class="bg-white rounded-2xl shadow-lg p-6 card-hover fade-in" style="animation-delay: 0.2s;">
            <div class="flex justify-between items-start mb-4">
                <div class="w-12 h-12 bg-green-100 rounded-xl flex items-center justify-center">
                    <i class="fas fa-stethoscope text-green-600 text-xl"></i>
                </div>
                <span class="bg-purple-100 text-purple-700 text-xs font-semibold px-2 py-1 rounded-lg">
                    Cette semaine
                </span>
            </div>
            <p class="text-gray-600 text-sm mb-1">Consultations</p>
            <p class="text-3xl font-bold text-gray-900">34</p>
            <p class="text-gray-500 text-xs mt-2">
                <i class="fas fa-check-circle text-green-500 mr-1"></i>
                32 complétées
            </p>
        </div>

        <!-- Disponibilité -->
        <div class="bg-white rounded-2xl shadow-lg p-6 card-hover fade-in" style="animation-delay: 0.3s;">
            <div class="flex justify-between items-start mb-4">
                <div class="w-12 h-12 bg-orange-100 rounded-xl flex items-center justify-center">
                    <i class="fas fa-clock text-orange-600 text-xl"></i>
                </div>
                <span class="bg-green-100 text-green-700 text-xs font-semibold px-2 py-1 rounded-lg">
                    Disponible
                </span>
            </div>
            <p class="text-gray-600 text-sm mb-1">Statut</p>
            <p class="text-3xl font-bold text-gray-900">En ligne</p>
            <p class="text-gray-500 text-xs mt-2">
                <i class="fas fa-calendar text-orange-500 mr-1"></i>
                5 créneaux libres
            </p>
        </div>
    </div>

    <!-- Quick Actions & Image Section -->
    <div class="grid grid-cols-1 lg:grid-cols-3 gap-6 mb-8">
        <!-- Gestion Rapide -->
        <div class="lg:col-span-2 bg-white rounded-2xl shadow-lg p-6 fade-in">
            <h2 class="text-xl font-bold text-gray-900 mb-6">Actions Rapides</h2>
            <div class="grid grid-cols-2 gap-4">
                <a href="<c:url value='/doctor/rendezVous'/>" class="bg-gradient-to-br from-blue-50 to-cyan-50 p-6 rounded-xl card-hover border-2 border-transparent hover:border-blue-200">
                    <div class="w-10 h-10 bg-blue-600 rounded-lg flex items-center justify-center mb-3">
                        <i class="fas fa-calendar-check text-white"></i>
                    </div>
                    <h3 class="font-semibold text-gray-900 mb-1">Rendez-vous</h3>
                    <p class="text-sm text-gray-600">Gérer mes consultations</p>
                </a>

                <a href="<c:url value='/doctor/availability'/>" class="bg-gradient-to-br from-purple-50 to-indigo-50 p-6 rounded-xl card-hover border-2 border-transparent hover:border-purple-200">
                    <div class="w-10 h-10 bg-purple-600 rounded-lg flex items-center justify-center mb-3">
                        <i class="fas fa-clock text-white"></i>
                    </div>
                    <h3 class="font-semibold text-gray-900 mb-1">Disponibilités</h3>
                    <p class="text-sm text-gray-600">Configurer mon agenda</p>
                </a>

                <a href="#" class="bg-gradient-to-br from-green-50 to-emerald-50 p-6 rounded-xl card-hover border-2 border-transparent hover:border-green-200">
                    <div class="w-10 h-10 bg-green-600 rounded-lg flex items-center justify-center mb-3">
                        <i class="fas fa-user-injured text-white"></i>
                    </div>
                    <h3 class="font-semibold text-gray-900 mb-1">Patients</h3>
                    <p class="text-sm text-gray-600">Voir mes patients</p>
                </a>

                <a href="#" class="bg-gradient-to-br from-orange-50 to-red-50 p-6 rounded-xl card-hover border-2 border-transparent hover:border-orange-200">
                    <div class="w-10 h-10 bg-orange-600 rounded-lg flex items-center justify-center mb-3">
                        <i class="fas fa-file-medical text-white"></i>
                    </div>
                    <h3 class="font-semibold text-gray-900 mb-1">Dossiers</h3>
                    <p class="text-sm text-gray-600">Accéder aux dossiers</p>
                </a>
            </div>
        </div>

        <!-- Image Section -->
        <div class="bg-white rounded-2xl shadow-lg p-6 fade-in overflow-hidden relative">
            <div class="absolute inset-0 bg-gradient-to-br from-purple-100 to-indigo-100 opacity-50"></div>
            <div class="relative z-10 h-full flex flex-col">
                <h2 class="text-xl font-bold text-gray-900 mb-4">Votre Journée</h2>
                <img src="https://images.unsplash.com/photo-1638202993928-7267aad84c31?w=400&q=80"
                     alt="Médecin"
                     class="rounded-xl w-full h-48 object-cover shadow-lg mb-4">
                <div class="bg-white/80 backdrop-blur-sm rounded-xl p-4">
                    <p class="text-sm text-gray-700 font-semibold">
                        <i class="fas fa-quote-left text-purple-600 mr-2"></i>
                        Prendre soin de la santé est un art
                    </p>
                </div>
            </div>
        </div>
    </div>

    <!-- Bottom Section -->
    <div class="grid grid-cols-1 lg:grid-cols-2 gap-6">
        <!-- Prochains RDV -->
        <div class="bg-white rounded-2xl shadow-lg p-6 fade-in">
            <h2 class="text-xl font-bold text-gray-900 mb-6">Prochains Rendez-vous</h2>
            <div class="space-y-3">
                <div class="flex items-center justify-between p-4 bg-purple-50 rounded-xl border-l-4 border-purple-600">
                    <div class="flex items-center space-x-4">
                        <div class="w-12 h-12 bg-purple-600 rounded-lg flex items-center justify-center">
                            <span class="text-white font-bold">14:00</span>
                        </div>
                        <div>
                            <p class="font-semibold text-gray-900">Marie Dubois</p>
                            <p class="text-sm text-gray-600">Consultation générale</p>
                        </div>
                    </div>
                    <div class="text-right">
                        <span class="text-xs bg-white px-3 py-1 rounded-lg text-gray-600 font-semibold">
                            Salle 3
                        </span>
                    </div>
                </div>

                <div class="flex items-center justify-between p-4 bg-blue-50 rounded-xl border-l-4 border-blue-600">
                    <div class="flex items-center space-x-4">
                        <div class="w-12 h-12 bg-blue-600 rounded-lg flex items-center justify-center">
                            <span class="text-white font-bold">15:30</span>
                        </div>
                        <div>
                            <p class="font-semibold text-gray-900">Jean Martin</p>
                            <p class="text-sm text-gray-600">Suivi médical</p>
                        </div>
                    </div>
                    <div class="text-right">
                        <span class="text-xs bg-white px-3 py-1 rounded-lg text-gray-600 font-semibold">
                            Salle 3
                        </span>
                    </div>
                </div>

                <div class="flex items-center justify-between p-4 bg-green-50 rounded-xl border-l-4 border-green-600">
                    <div class="flex items-center space-x-4">
                        <div class="w-12 h-12 bg-green-600 rounded-lg flex items-center justify-center">
                            <span class="text-white font-bold">16:00</span>
                        </div>
                        <div>
                            <p class="font-semibold text-gray-900">Sophie Laurent</p>
                            <p class="text-sm text-gray-600">Consultation urgente</p>
                        </div>
                    </div>
                    <div class="text-right">
                        <span class="text-xs bg-white px-3 py-1 rounded-lg text-gray-600 font-semibold">
                            Salle 3
                        </span>
                    </div>
                </div>
            </div>

            <a href="<c:url value='/doctor/rendezVous'/>" class="mt-6 block text-center bg-gradient-to-r from-purple-600 to-indigo-600 text-white px-6 py-3 rounded-xl hover:shadow-lg transition font-semibold">
                <i class="fas fa-calendar-alt mr-2"></i>
                Voir tous les rendez-vous
            </a>
        </div>

        <!-- Statistiques -->
        <div class="bg-white rounded-2xl shadow-lg p-6 fade-in">
            <h2 class="text-xl font-bold text-gray-900 mb-6">Performance de la Semaine</h2>
            <div class="space-y-4">
                <div>
                    <div class="flex justify-between text-sm mb-2">
                        <span class="text-gray-600">Consultations réalisées</span>
                        <span class="font-semibold text-gray-900">94%</span>
                    </div>
                    <div class="w-full bg-gray-200 rounded-full h-2">
                        <div class="bg-gradient-to-r from-purple-600 to-indigo-600 h-2 rounded-full" style="width: 94%"></div>
                    </div>
                </div>

                <div>
                    <div class="flex justify-between text-sm mb-2">
                        <span class="text-gray-600">Ponctualité</span>
                        <span class="font-semibold text-gray-900">98%</span>
                    </div>
                    <div class="w-full bg-gray-200 rounded-full h-2">
                        <div class="bg-gradient-to-r from-green-500 to-emerald-500 h-2 rounded-full" style="width: 98%"></div>
                    </div>
                </div>

                <div>
                    <div class="flex justify-between text-sm mb-2">
                        <span class="text-gray-600">Satisfaction patients</span>
                        <span class="font-semibold text-gray-900">96%</span>
                    </div>
                    <div class="w-full bg-gray-200 rounded-full h-2">
                        <div class="bg-gradient-to-r from-blue-500 to-cyan-500 h-2 rounded-full" style="width: 96%"></div>
                    </div>
                </div>
            </div>

            <div class="mt-6 p-4 bg-gradient-to-r from-purple-50 to-indigo-50 rounded-xl border-2 border-purple-200">
                <div class="flex items-center space-x-3">
                    <div class="w-12 h-12 bg-purple-600 rounded-xl flex items-center justify-center">
                        <i class="fas fa-award text-white text-xl"></i>
                    </div>
                    <div>
                        <p class="font-bold text-gray-900">Excellent travail !</p>
                        <p class="text-sm text-gray-600">Vos patients apprécient votre dévouement</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>