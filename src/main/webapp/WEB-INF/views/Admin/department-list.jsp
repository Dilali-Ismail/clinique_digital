<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion des Départements | eSanté+</title>
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
        .table-row { transition: all 0.2s ease; }
        .table-row:hover { background: rgba(102, 126, 234, 0.05); }
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
        <a href="#" class="nav-link flex items-center space-x-3 px-4 py-3 rounded-xl">
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
        <div class="flex justify-between items-center">
            <div>
                <h1 class="text-3xl font-bold text-gray-900">
                    Gestion des <span class="gradient-text">Départements</span>
                </h1>
                <p class="text-gray-600 mt-1">Liste de tous vos départements</p>
            </div>
            <a href="<c:url value='/admin/departments/add'/>" class="bg-gradient-to-r from-purple-600 to-indigo-600 text-white px-6 py-3 rounded-xl hover:shadow-lg transition font-semibold">
                <i class="fas fa-plus mr-2"></i>
                Ajouter un Département
            </a>
        </div>
    </div>

    <!-- Departments Table -->
    <div class="bg-white rounded-2xl shadow-lg overflow-hidden fade-in">
        <table class="w-full">
            <thead class="gradient-bg text-white">
            <tr>
                <th class="px-6 py-4 text-left font-semibold">Nom du Département</th>
                <th class="px-6 py-4 text-left font-semibold">Description</th>
                <th class="px-6 py-4 text-center font-semibold">Actions</th>
            </tr>
            </thead>
            <tbody class="divide-y divide-gray-100">
            <c:forEach var="dept" items="${departments}">
                <tr class="table-row">
                    <td class="px-6 py-4">
                        <p class="font-semibold text-gray-900"><c:out value="${dept.nom}"/></p>
                    </td>
                    <td class="px-6 py-4">
                        <p class="text-gray-700"><c:out value="${not empty dept.description ? dept.description : 'Aucune description'}"/></p>
                    </td>
                    <td class="px-6 py-4">
                        <div class="flex items-center justify-center space-x-2">
                            <a href="<c:url value='/admin/departments/edit?id=${dept.id}'/>" class="bg-blue-100 text-blue-600 px-4 py-2 rounded-lg hover:bg-blue-200 transition font-semibold">
                                Modifier
                            </a>
                            <a href="<c:url value='/admin/departments/delete?id=${dept.id}'/>" onclick="return confirm('Êtes-vous sûr ?')" class="bg-red-100 text-red-600 px-4 py-2 rounded-lg hover:bg-red-200 transition font-semibold">
                                Supprimer
                            </a>
                        </div>
                    </td>
                </tr>
            </c:forEach>

            <c:if test="${empty departments}">
                <tr>
                    <td colspan="3" class="px-6 py-12 text-center">
                        <p class="text-gray-500 mb-4">Aucun département trouvé</p>
                        <a href="<c:url value='/admin/departments/add'/>" class="text-purple-600 font-semibold hover:underline">
                            Ajouter un Département
                        </a>
                    </td>
                </tr>
            </c:if>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>