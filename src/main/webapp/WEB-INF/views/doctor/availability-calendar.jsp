<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mes Disponibilités | eSanté+</title>
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
        .calendar-grid { display: grid; grid-template-columns: repeat(7, minmax(0, 1fr)); }
        .day-cell { min-height: 120px; transition: all 0.2s ease; }
        .day-cell:hover { background: rgba(102, 126, 234, 0.05); }
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
        <a href="<c:url value='/doctor/dashboard'/>" class="nav-link flex items-center space-x-3 px-4 py-3 rounded-xl">
            <i class="fas fa-chart-line w-5"></i>
            <span>Dashboard</span>
        </a>
        <a href="<c:url value='/doctor/rendezVous'/>" class="nav-link flex items-center space-x-3 px-4 py-3 rounded-xl">
            <i class="fas fa-calendar-check w-5"></i>
            <span>Mes Rendez-vous</span>
        </a>
        <a href="<c:url value='/doctor/availability'/>" class="nav-link active flex items-center space-x-3 px-4 py-3 rounded-xl">
            <i class="fas fa-clock w-5"></i>
            <span class="font-semibold">Disponibilités</span>
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
        <div class="flex items-center space-x-3">
            <a href="<c:url value='/doctor/dashboard'/>" class="text-gray-400 hover:text-purple-600 transition">
                <i class="fas fa-arrow-left text-xl"></i>
            </a>
            <div>
                <h1 class="text-3xl font-bold text-gray-900">
                    Mes <span class="gradient-text">Disponibilités</span>
                </h1>
                <p class="text-gray-600 mt-1">Gérez votre emploi du temps et vos créneaux</p>
            </div>
        </div>
    </div>

    <!-- Error Message -->
    <c:if test="${not empty sessionScope.errorMessage}">
        <div class="bg-red-50 border-l-4 border-red-500 p-4 mb-8 rounded-xl fade-in">
            <div class="flex items-center">
                <i class="fas fa-exclamation-circle text-red-500 text-xl mr-3"></i>
                <div>
                    <p class="font-bold text-red-700">Erreur</p>
                    <p class="text-red-600">${sessionScope.errorMessage}</p>
                </div>
            </div>
        </div>
        <c:remove var="errorMessage" scope="session"/>
    </c:if>

    <!-- Add Availability Form -->
    <div class="bg-white rounded-2xl shadow-lg p-6 mb-8 fade-in">
        <h2 class="text-xl font-bold text-gray-900 mb-6 flex items-center">
            <i class="fas fa-plus-circle text-purple-600 mr-3"></i>
            Ajouter un bloc de temps
        </h2>

        <form action="<c:url value='/doctor/availability'/>" method="post" class="grid grid-cols-1 md:grid-cols-5 gap-4 items-end">
            <div>
                <label for="jour" class="block text-sm font-semibold text-gray-700 mb-2">
                    <i class="fas fa-calendar text-purple-600 mr-1"></i>
                    Jour
                </label>
                <input type="date"
                       id="jour"
                       name="jour"
                       required
                       class="w-full px-4 py-3 border-2 border-gray-200 rounded-xl focus:outline-none focus:border-purple-400 transition">
            </div>

            <div>
                <label for="heureDebut" class="block text-sm font-semibold text-gray-700 mb-2">
                    <i class="fas fa-clock text-purple-600 mr-1"></i>
                    De
                </label>
                <input type="time"
                       id="heureDebut"
                       name="heureDebut"
                       required
                       class="w-full px-4 py-3 border-2 border-gray-200 rounded-xl focus:outline-none focus:border-purple-400 transition">
            </div>

            <div>
                <label for="heureFin" class="block text-sm font-semibold text-gray-700 mb-2">
                    <i class="fas fa-clock text-purple-600 mr-1"></i>
                    À
                </label>
                <input type="time"
                       id="heureFin"
                       name="heureFin"
                       required
                       class="w-full px-4 py-3 border-2 border-gray-200 rounded-xl focus:outline-none focus:border-purple-400 transition">
            </div>

            <div>
                <label for="statut" class="block text-sm font-semibold text-gray-700 mb-2">
                    <i class="fas fa-info-circle text-purple-600 mr-1"></i>
                    Statut
                </label>
                <select id="statut"
                        name="statut"
                        class="w-full px-4 py-3 border-2 border-gray-200 rounded-xl focus:outline-none focus:border-purple-400 transition bg-white">
                    <option value="AVAILABLE">Disponible</option>
                    <option value="UNAVAILABLE">Indisponible</option>
                    <option value="ON_LEAVE">En Congé</option>
                </select>
            </div>

            <button type="submit" class="bg-gradient-to-r from-purple-600 to-indigo-600 text-white font-bold py-3 px-6 rounded-xl hover:shadow-lg transition">
                <i class="fas fa-plus mr-2"></i>
                Ajouter
            </button>
        </form>
    </div>

    <!-- Legend -->
    <div class="bg-white rounded-2xl shadow-lg p-4 mb-8 fade-in">
        <div class="flex items-center justify-center space-x-6 text-sm">
            <div class="flex items-center space-x-2">
                <div class="w-4 h-4 bg-green-500 rounded"></div>
                <span class="text-gray-700 font-semibold">Disponible</span>
            </div>
            <div class="flex items-center space-x-2">
                <div class="w-4 h-4 bg-gray-400 rounded"></div>
                <span class="text-gray-700 font-semibold">Indisponible</span>
            </div>
            <div class="flex items-center space-x-2">
                <div class="w-4 h-4 bg-orange-500 rounded"></div>
                <span class="text-gray-700 font-semibold">En Congé</span>
            </div>
        </div>
    </div>

    <!-- Calendar -->
    <div class="bg-white rounded-2xl shadow-lg overflow-hidden fade-in">
        <!-- Calendar Header -->
        <div class="gradient-bg p-6">
            <div class="flex justify-between items-center">
                <c:set var="prevMonth" value="${currentMonth.minusMonths(1)}"/>
                <a href="?year=${prevMonth.year}&month=${prevMonth.monthValue}"
                   class="text-white hover:bg-white/20 px-4 py-2 rounded-xl transition font-semibold">
                    <i class="fas fa-chevron-left mr-2"></i>
                    Précédent
                </a>

                <h2 class="text-2xl font-bold text-white">
                    <fmt:setLocale value="fr_FR"/>
                    <fmt:formatDate value="${firstDayAsDate}" type="date" pattern="MMMM yyyy" />
                </h2>

                <c:set var="nextMonth" value="${currentMonth.plusMonths(1)}"/>
                <a href="?year=${nextMonth.year}&month=${nextMonth.monthValue}"
                   class="text-white hover:bg-white/20 px-4 py-2 rounded-xl transition font-semibold">
                    Suivant
                    <i class="fas fa-chevron-right ml-2"></i>
                </a>
            </div>
        </div>

        <!-- Calendar Grid -->
        <div class="calendar-grid border-l border-t">
            <!-- Day Headers -->
            <div class="text-center font-bold p-3 border-r border-b bg-purple-50 text-purple-700">Lun</div>
            <div class="text-center font-bold p-3 border-r border-b bg-purple-50 text-purple-700">Mar</div>
            <div class="text-center font-bold p-3 border-r border-b bg-purple-50 text-purple-700">Mer</div>
            <div class="text-center font-bold p-3 border-r border-b bg-purple-50 text-purple-700">Jeu</div>
            <div class="text-center font-bold p-3 border-r border-b bg-purple-50 text-purple-700">Ven</div>
            <div class="text-center font-bold p-3 border-r border-b bg-purple-50 text-purple-700">Sam</div>
            <div class="text-center font-bold p-3 border-r border-b bg-purple-50 text-purple-700">Dim</div>

            <!-- Empty cells before month starts -->
            <c:forEach begin="1" end="${firstDayOfWeek - 1}">
                <div class="border-r border-b bg-gray-50"></div>
            </c:forEach>

            <!-- Days of the month -->
            <c:forEach begin="1" end="${daysInMonth}" var="day">
                <c:set var="currentDate" value="${currentMonth.atDay(day)}"/>
                <c:set var="availabilitiesForThisDay" value="${availabilitiesByDay[currentDate]}"/>

                <div class="day-cell p-3 border-r border-b relative bg-white">
                    <div class="flex justify-between items-start mb-2">
                        <span class="font-bold text-gray-700 text-lg">${day}</span>
                        <c:if test="${not empty availabilitiesForThisDay}">
                            <span class="bg-purple-100 text-purple-700 text-xs font-semibold px-2 py-1 rounded-full">
                                    ${availabilitiesForThisDay.size()}
                            </span>
                        </c:if>
                    </div>

                    <c:if test="${not empty availabilitiesForThisDay}">
                        <div class="space-y-1">
                            <c:forEach var="avail" items="${availabilitiesForThisDay}">
                                <div class="p-2 rounded-lg text-xs text-white flex justify-between items-center shadow-sm
                                    ${avail.statut == 'AVAILABLE' ? 'bg-green-500' : ''}
                                    ${avail.statut == 'UNAVAILABLE' ? 'bg-gray-400' : ''}
                                    ${avail.statut == 'ON_LEAVE' ? 'bg-orange-500' : ''}">

                                    <span class="font-semibold">
                                        <i class="fas fa-clock mr-1"></i>
                                        <c:out value="${avail.heureDebut}"/> - <c:out value="${avail.heureFin}"/>
                                    </span>

                                    <form action="<c:url value='/doctor/availability'/>" method="post"
                                          onsubmit="return confirm('Êtes-vous sûr de vouloir supprimer ce créneau ?')"
                                          class="inline">
                                        <input type="hidden" name="action" value="delete">
                                        <input type="hidden" name="id" value="${avail.id}">
                                        <button type="submit"
                                                class="bg-white/20 hover:bg-white/40 text-white rounded-full w-5 h-5 flex items-center justify-center transition">
                                            <i class="fas fa-times text-xs"></i>
                                        </button>
                                    </form>
                                </div>
                            </c:forEach>
                        </div>
                    </c:if>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

</body>
</html>