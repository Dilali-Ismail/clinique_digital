<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard Admin | eSanté+</title>
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
        <a href="<c:url value='/admin/dashboard'/>" class="nav-link active flex items-center space-x-3 px-4 py-3 rounded-xl">
            <i class="fas fa-chart-line w-5"></i>
            <span class="font-semibold">Dashboard</span>
        </a>
        <a href="#" class="nav-link flex items-center space-x-3 px-4 py-3 rounded-xl">
            <i class="fas fa-user-injured w-5"></i>
            <span>Patients</span>
        </a>
        <a href="<c:url value='/admin/specialities'/>" class="nav-link flex items-center space-x-3 px-4 py-3 rounded-xl">
            <i class="fas fa-user-injured w-5"></i>
            <span>Specialitees</span>
        </a>
        <a href="#" class="nav-link flex items-center space-x-3 px-4 py-3 rounded-xl">
            <i class="fas fa-user-md w-5"></i>
            <span>Médecins</span>
        </a>
        <a href="<c:url value='/admin/departments'/>" class="nav-link flex items-center space-x-3 px-4 py-3 rounded-xl">
            <i class="fas fa-hospital w-5"></i>
            <span>Départements</span>
        </a>
        <a href="#" class="nav-link flex items-center space-x-3 px-4 py-3 rounded-xl">
            <i class="fas fa-calendar-alt w-5"></i>
            <span>Rendez-vous</span>
        </a>
    </nav>

    <div class="absolute bottom-6 left-6 right-6">
        <div class="bg-white/10 backdrop-blur-lg rounded-xl p-4 mb-4">
            <div class="flex items-center space-x-3">
                <div class="w-10 h-10 bg-white/20 rounded-lg flex items-center justify-center">
                    <i class="fas fa-user-shield text-white"></i>
                </div>
                <div class="flex-1 min-w-0">
                    <p class="text-white font-semibold text-sm truncate">
                        <c:out value="${sessionScope.user.nom}"/>
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
                    Bienvenue, <span class="gradient-text"><c:out value="${sessionScope.user.nom}"/></span> !
                </h1>
                <p class="text-gray-600 mt-1">Voici un aperçu de votre clinique aujourd'hui</p>
            </div>
            <div class="flex items-center space-x-4">
                <button class="bg-purple-100 text-purple-600 px-4 py-2 rounded-xl hover:bg-purple-200 transition">
                    <i class="fas fa-bell mr-2"></i>
                    <span class="font-semibold">3</span>
                </button>
                <button class="bg-gradient-to-r from-purple-600 to-indigo-600 text-white px-6 py-2 rounded-xl hover:shadow-lg transition">
                    <i class="fas fa-plus mr-2"></i>
                    Nouveau
                </button>
            </div>
        </div>
    </div>

    <!-- Stats Cards -->
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
        <!-- Patients Card -->
        <div class="bg-white rounded-2xl shadow-lg p-6 card-hover fade-in">
            <div class="flex justify-between items-start mb-4">
                <div class="w-12 h-12 bg-blue-100 rounded-xl flex items-center justify-center">
                    <i class="fas fa-user-injured text-blue-600 text-xl"></i>
                </div>
                <span class="bg-green-100 text-green-700 text-xs font-semibold px-2 py-1 rounded-lg">
                    +12%
                </span>
            </div>
            <p class="text-gray-600 text-sm mb-1">Total Patients</p>
            <p class="text-3xl font-bold text-gray-900">1,248</p>
            <p class="text-gray-500 text-xs mt-2">
                <i class="fas fa-arrow-up text-green-500 mr-1"></i>
                45 nouveaux ce mois
            </p>
        </div>

        <!-- Médecins Card -->
        <div class="bg-white rounded-2xl shadow-lg p-6 card-hover fade-in" style="animation-delay: 0.1s;">
            <div class="flex justify-between items-start mb-4">
                <div class="w-12 h-12 bg-purple-100 rounded-xl flex items-center justify-center">
                    <i class="fas fa-user-md text-purple-600 text-xl"></i>
                </div>
                <span class="bg-blue-100 text-blue-700 text-xs font-semibold px-2 py-1 rounded-lg">
                    Actifs
                </span>
            </div>
            <p class="text-gray-600 text-sm mb-1">Médecins</p>
            <p class="text-3xl font-bold text-gray-900">87</p>
            <p class="text-gray-500 text-xs mt-2">
                <i class="fas fa-check-circle text-green-500 mr-1"></i>
                82 disponibles aujourd'hui
            </p>
        </div>

        <!-- Rendez-vous Card -->
        <div class="bg-white rounded-2xl shadow-lg p-6 card-hover fade-in" style="animation-delay: 0.2s;">
            <div class="flex justify-between items-start mb-4">
                <div class="w-12 h-12 bg-orange-100 rounded-xl flex items-center justify-center">
                    <i class="fas fa-calendar-check text-orange-600 text-xl"></i>
                </div>
                <span class="bg-purple-100 text-purple-700 text-xs font-semibold px-2 py-1 rounded-lg">
                    Aujourd'hui
                </span>
            </div>
            <p class="text-gray-600 text-sm mb-1">Rendez-vous</p>
            <p class="text-3xl font-bold text-gray-900">156</p>
            <p class="text-gray-500 text-xs mt-2">
                <i class="fas fa-clock text-orange-500 mr-1"></i>
                23 en attente
            </p>
        </div>

        <!-- Départements Card -->
        <div class="bg-white rounded-2xl shadow-lg p-6 card-hover fade-in" style="animation-delay: 0.3s;">
            <div class="flex justify-between items-start mb-4">
                <div class="w-12 h-12 bg-green-100 rounded-xl flex items-center justify-center">
                    <i class="fas fa-hospital text-green-600 text-xl"></i>
                </div>
                <span class="bg-green-100 text-green-700 text-xs font-semibold px-2 py-1 rounded-lg">
                    Actifs
                </span>
            </div>
            <p class="text-gray-600 text-sm mb-1">Départements</p>
            <p class="text-3xl font-bold text-gray-900">12</p>
            <p class="text-gray-500 text-xs mt-2">
                <i class="fas fa-building text-green-500 mr-1"></i>
                Tous opérationnels
            </p>
        </div>
    </div>

    <!-- Quick Actions -->
    <div class="grid grid-cols-1 lg:grid-cols-3 gap-6 mb-8">
        <!-- Gestion Rapide -->
        <div class="lg:col-span-2 bg-white rounded-2xl shadow-lg p-6 fade-in">
            <h2 class="text-xl font-bold text-gray-900 mb-6">Actions Rapides</h2>
            <div class="grid grid-cols-2 gap-4">
                <a href="<c:url value='/admin/departments'/>" class="bg-gradient-to-br from-purple-50 to-indigo-50 p-6 rounded-xl card-hover border-2 border-transparent hover:border-purple-200">
                    <div class="w-10 h-10 bg-purple-600 rounded-lg flex items-center justify-center mb-3">
                        <i class="fas fa-hospital text-white"></i>
                    </div>
                    <h3 class="font-semibold text-gray-900 mb-1">Départements</h3>
                    <p class="text-sm text-gray-600">Gérer les départements</p>
                </a>

                <a href="#" class="bg-gradient-to-br from-blue-50 to-cyan-50 p-6 rounded-xl card-hover border-2 border-transparent hover:border-blue-200">
                    <div class="w-10 h-10 bg-blue-600 rounded-lg flex items-center justify-center mb-3">
                        <i class="fas fa-user-injured text-white"></i>
                    </div>
                    <h3 class="font-semibold text-gray-900 mb-1">Patients</h3>
                    <p class="text-sm text-gray-600">Voir tous les patients</p>
                </a>

                <a href="#" class="bg-gradient-to-br from-green-50 to-emerald-50 p-6 rounded-xl card-hover border-2 border-transparent hover:border-green-200">
                    <div class="w-10 h-10 bg-green-600 rounded-lg flex items-center justify-center mb-3">
                        <i class="fas fa-user-md text-white"></i>
                    </div>
                    <h3 class="font-semibold text-gray-900 mb-1">Médecins</h3>
                    <p class="text-sm text-gray-600">Gérer les médecins</p>
                </a>

                <a href="#" class="bg-gradient-to-br from-orange-50 to-red-50 p-6 rounded-xl card-hover border-2 border-transparent hover:border-orange-200">
                    <div class="w-10 h-10 bg-orange-600 rounded-lg flex items-center justify-center mb-3">
                        <i class="fas fa-calendar-alt text-white"></i>
                    </div>
                    <h3 class="font-semibold text-gray-900 mb-1">Rendez-vous</h3>
                    <p class="text-sm text-gray-600">Planning des RDV</p>
                </a>
            </div>
        </div>

        <!-- Activité Récente -->
        <div class="bg-white rounded-2xl shadow-lg p-6 fade-in">
            <h2 class="text-xl font-bold text-gray-900 mb-6">Activité Récente</h2>
            <div class="space-y-4">
                <div class="flex items-start space-x-3">
                    <div class="w-8 h-8 bg-green-100 rounded-lg flex items-center justify-center flex-shrink-0">
                        <i class="fas fa-user-plus text-green-600 text-sm"></i>
                    </div>
                    <div class="flex-1 min-w-0">
                        <p class="text-sm font-semibold text-gray-900">Nouveau patient</p>
                        <p class="text-xs text-gray-600 truncate">Marie Dubois inscrite</p>
                        <p class="text-xs text-gray-400 mt-1">Il y a 5 min</p>
                    </div>
                </div>

                <div class="flex items-start space-x-3">
                    <div class="w-8 h-8 bg-blue-100 rounded-lg flex items-center justify-center flex-shrink-0">
                        <i class="fas fa-calendar-check text-blue-600 text-sm"></i>
                    </div>
                    <div class="flex-1 min-w-0">
                        <p class="text-sm font-semibold text-gray-900">RDV confirmé</p>
                        <p class="text-xs text-gray-600 truncate">Dr. Martin - 14h00</p>
                        <p class="text-xs text-gray-400 mt-1">Il y a 12 min</p>
                    </div>
                </div>

                <div class="flex items-start space-x-3">
                    <div class="w-8 h-8 bg-purple-100 rounded-lg flex items-center justify-center flex-shrink-0">
                        <i class="fas fa-hospital text-purple-600 text-sm"></i>
                    </div>
                    <div class="flex-1 min-w-0">
                        <p class="text-sm font-semibold text-gray-900">Département ajouté</p>
                        <p class="text-xs text-gray-600 truncate">Cardiologie créé</p>
                        <p class="text-xs text-gray-400 mt-1">Il y a 1h</p>
                    </div>
                </div>

                <div class="flex items-start space-x-3">
                    <div class="w-8 h-8 bg-orange-100 rounded-lg flex items-center justify-center flex-shrink-0">
                        <i class="fas fa-user-md text-orange-600 text-sm"></i>
                    </div>
                    <div class="flex-1 min-w-0">
                        <p class="text-sm font-semibold text-gray-900">Médecin disponible</p>
                        <p class="text-xs text-gray-600 truncate">Dr. Laurent en ligne</p>
                        <p class="text-xs text-gray-400 mt-1">Il y a 2h</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bottom Section -->
    <div class="grid grid-cols-1 lg:grid-cols-2 gap-6">
        <!-- Statistiques -->
        <div class="bg-white rounded-2xl shadow-lg p-6 fade-in">
            <h2 class="text-xl font-bold text-gray-900 mb-6">Performance de la Semaine</h2>
            <div class="space-y-4">
                <div>
                    <div class="flex justify-between text-sm mb-2">
                        <span class="text-gray-600">Taux d'occupation</span>
                        <span class="font-semibold text-gray-900">87%</span>
                    </div>
                    <div class="w-full bg-gray-200 rounded-full h-2">
                        <div class="bg-gradient-to-r from-purple-600 to-indigo-600 h-2 rounded-full" style="width: 87%"></div>
                    </div>
                </div>

                <div>
                    <div class="flex justify-between text-sm mb-2">
                        <span class="text-gray-600">RDV honorés</span>
                        <span class="font-semibold text-gray-900">92%</span>
                    </div>
                    <div class="w-full bg-gray-200 rounded-full h-2">
                        <div class="bg-gradient-to-r from-green-500 to-emerald-500 h-2 rounded-full" style="width: 92%"></div>
                    </div>
                </div>

                <div>
                    <div class="flex justify-between text-sm mb-2">
                        <span class="text-gray-600">Satisfaction patients</span>
                        <span class="font-semibold text-gray-900">95%</span>
                    </div>
                    <div class="w-full bg-gray-200 rounded-full h-2">
                        <div class="bg-gradient-to-r from-blue-500 to-cyan-500 h-2 rounded-full" style="width: 95%"></div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Prochains RDV -->
        <div class="bg-white rounded-2xl shadow-lg p-6 fade-in">
            <h2 class="text-xl font-bold text-gray-900 mb-6">Prochains Rendez-vous</h2>
            <div class="space-y-3">
                <div class="flex items-center justify-between p-3 bg-purple-50 rounded-xl">
                    <div class="flex items-center space-x-3">
                        <div class="w-10 h-10 bg-purple-600 rounded-lg flex items-center justify-center">
                            <span class="text-white font-bold text-sm">14:00</span>
                        </div>
                        <div>
                            <p class="font-semibold text-gray-900 text-sm">Dr. Martin</p>
                            <p class="text-xs text-gray-600">Consultation générale</p>
                        </div>
                    </div>
                    <span class="text-xs bg-white px-2 py-1 rounded-lg text-gray-600">Salle 3</span>
                </div>

                <div class="flex items-center justify-between p-3 bg-blue-50 rounded-xl">
                    <div class="flex items-center space-x-3">
                        <div class="w-10 h-10 bg-blue-600 rounded-lg flex items-center justify-center">
                            <span class="text-white font-bold text-sm">15:30</span>
                        </div>
                        <div>
                            <p class="font-semibold text-gray-900 text-sm">Dr. Dubois</p>
                            <p class="text-xs text-gray-600">Cardiologie</p>
                        </div>
                    </div>
                    <span class="text-xs bg-white px-2 py-1 rounded-lg text-gray-600">Salle 1</span>
                </div>

                <div class="flex items-center justify-between p-3 bg-green-50 rounded-xl">
                    <div class="flex items-center space-x-3">
                        <div class="w-10 h-10 bg-green-600 rounded-lg flex items-center justify-center">
                            <span class="text-white font-bold text-sm">16:00</span>
                        </div>
                        <div>
                            <p class="font-semibold text-gray-900 text-sm">Dr. Laurent</p>
                            <p class="text-xs text-gray-600">Pédiatrie</p>
                        </div>
                    </div>
                    <span class="text-xs bg-white px-2 py-1 rounded-lg text-gray-600">Salle 5</span>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>