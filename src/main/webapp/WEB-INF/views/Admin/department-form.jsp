<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>
        <c:if test="${empty department}">Ajouter un Département</c:if>
        <c:if test="${not empty department}">Modifier le Département</c:if>
        | eSanté+
    </title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700;800&display=swap');
        * { font-family: 'Inter', sans-serif; }
        .gradient-bg { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); }
        .gradient-text { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); -webkit-background-clip: text; -webkit-text-fill-color: transparent; background-clip: text; }
        .fade-in { animation: fadeIn 0.6s ease-in; }
        @keyframes fadeIn { from { opacity: 0; transform: translateY(20px); } to { opacity: 1; transform: translateY(0); } }
        .nav-link { transition: all 0.2s ease; }
        .nav-link:hover { background: rgba(255, 255, 255, 0.15); transform: translateX(5px); }
        .nav-link.active { background: rgba(255, 255, 255, 0.2); }
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
        <a href="<c:url value='/admin/dashboard'/>" class="nav-link flex items-center space-x-3 px-4 py-3 rounded-xl">
            <i class="fas fa-chart-line w-5"></i>
            <span>Dashboard</span>
        </a>
        <a href="#" class="nav-link flex items-center space-x-3 px-4 py-3 rounded-xl">
            <i class="fas fa-user-injured w-5"></i>
            <span>Patients</span>
        </a>
        <a href="<c:url value='/admin/specialities'/>" class="nav-link flex items-center space-x-3 px-4 py-3 rounded-xl">
            <i class="fas fa-user-injured w-5"></i>
            <span>Specialitees</span>
        </a>
        <a href="<c:url value='/admin/doctors'/>" class="nav-link flex items-center space-x-3 px-4 py-3 rounded-xl">
            <i class="fas fa-user-md w-5"></i>
            <span>Médecins</span>
        </a>
        <a href="<c:url value='/admin/departments'/>" class="nav-link active flex items-center space-x-3 px-4 py-3 rounded-xl">
            <i class="fas fa-hospital w-5"></i>
            <span class="font-semibold">Départements</span>
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
        <div class="flex items-center space-x-3">
            <a href="<c:url value='/admin/departments'/>" class="text-gray-400 hover:text-purple-600 transition">
                <i class="fas fa-arrow-left text-xl"></i>
            </a>
            <div>
                <h1 class="text-3xl font-bold text-gray-900">
                    <c:if test="${empty department}">
                        Ajouter un <span class="gradient-text">Département</span>
                    </c:if>
                    <c:if test="${not empty department}">
                        Modifier le <span class="gradient-text">Département</span>
                    </c:if>
                </h1>
                <p class="text-gray-600 mt-1">Remplissez les informations du département</p>
            </div>
        </div>
    </div>

    <!-- Form -->
    <div class="bg-white rounded-2xl shadow-lg p-8 fade-in max-w-2xl">
        <form action="<c:url value='/admin/departments'/>" method="post" class="space-y-6">
            <!-- Champ caché pour l'ID en mode édition -->
            <c:if test="${not empty department}">
                <input type="hidden" name="id" value="${department.id}">
            </c:if>

            <!-- Nom -->
            <div>
                <label for="nom" class="block text-sm font-semibold text-gray-700 mb-2">
                    <i class="fas fa-hospital text-purple-600 mr-2"></i>
                    Nom du Département
                </label>
                <input type="text"
                       id="nom"
                       name="nom"
                       value="<c:out value='${department.nom}'/>"
                       required
                       class="w-full px-4 py-3 border-2 border-gray-200 rounded-xl focus:outline-none focus:border-purple-400 transition"
                       placeholder="Ex: Cardiologie, Pédiatrie...">
            </div>

            <!-- Description -->
            <div>
                <label for="description" class="block text-sm font-semibold text-gray-700 mb-2">
                    <i class="fas fa-file-alt text-purple-600 mr-2"></i>
                    Description
                </label>
                <textarea id="description"
                          name="description"
                          rows="5"
                          class="w-full px-4 py-3 border-2 border-gray-200 rounded-xl focus:outline-none focus:border-purple-400 transition"
                          placeholder="Décrivez le département..."><c:out value='${department.description}'/></textarea>
            </div>

            <!-- Buttons -->
            <div class="flex items-center space-x-4 pt-4">
                <button type="submit" class="bg-gradient-to-r from-purple-600 to-indigo-600 text-white px-8 py-3 rounded-xl hover:shadow-lg transition font-semibold">
                    <i class="fas fa-save mr-2"></i>
                    Enregistrer
                </button>
                <a href="<c:url value='/admin/departments'/>" class="bg-gray-100 text-gray-700 px-8 py-3 rounded-xl hover:bg-gray-200 transition font-semibold">
                    <i class="fas fa-times mr-2"></i>
                    Annuler
                </a>
            </div>
        </form>
    </div>
</div>

</body>
</html>