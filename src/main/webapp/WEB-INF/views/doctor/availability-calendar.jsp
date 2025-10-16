<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Les imports de classes Java ne sont plus nécessaires car nous utilisons JSTL
  et l'Expression Language (EL) qui gèrent les types automatiquement.
--%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Gérer mes Disponibilités</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .calendar-grid { display: grid; grid-template-columns: repeat(7, minmax(0, 1fr)); }
        .day-cell { min-height: 120px; }
    </style>
</head>
<body class="bg-gray-100 p-8">

<div class="max-w-7xl mx-auto">
    <h1 class="text-3xl font-bold text-gray-800 mb-6">Mes Disponibilités</h1>

    <%-- Formulaire d'ajout --%>
    <div class="bg-white p-6 rounded-lg shadow-md mb-8">
        <h2 class="text-xl font-semibold mb-4">Ajouter un bloc de temps</h2>

        <c:if test="${not empty sessionScope.errorMessage}">
            <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative mb-4" role="alert">
                <strong class="font-bold">Erreur:</strong>
                <span class="block sm:inline">${sessionScope.errorMessage}</span>
            </div>
            <%-- Vider le message d'erreur de la session après l'avoir affiché --%>
            <c:remove var="errorMessage" scope="session"/>
        </c:if>

        <form action="<c:url value='/doctor/availability'/>" method="post" class="grid grid-cols-1 md:grid-cols-5 gap-4 items-end">
            <div>
                <label for="jour" class="block text-sm font-medium text-gray-700">Jour</label>
                <input type="date" id="jour" name="jour" required class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50">
            </div>
            <div>
                <label for="heureDebut" class="block text-sm font-medium text-gray-700">De</label>
                <input type="time" id="heureDebut" name="heureDebut" required class="mt-1 block w-full rounded-md border-gray-300 shadow-sm">
            </div>
            <div>
                <label for="heureFin" class="block text-sm font-medium text-gray-700">À</label>
                <input type="time" id="heureFin" name="heureFin" required class="mt-1 block w-full rounded-md border-gray-300 shadow-sm">
            </div>
            <div>
                <label for="statut" class="block text-sm font-medium text-gray-700">Statut</label>
                <select id="statut" name="statut" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm">
                    <option value="AVAILABLE">Disponible</option>
                    <option value="UNAVAILABLE">Indisponible</option>
                    <option value="ON_LEAVE">En Congé</option>
                </select>
            </div>
            <button type="submit" class="bg-indigo-600 text-white font-bold py-2 px-4 rounded-md hover:bg-indigo-700">Ajouter</button>
        </form>
    </div>

    <%-- Le calendrier --%>
    <div class="bg-white rounded-lg shadow-md">
        <%-- Header du calendrier (Navigation entre les mois) --%>
        <div class="flex justify-between items-center p-4 border-b">
            <c:set var="prevMonth" value="${currentMonth.minusMonths(1)}"/>
            <a href="?year=${prevMonth.year}&month=${prevMonth.monthValue}" class="text-indigo-600 hover:text-indigo-800">
                <i class="fas fa-chevron-left"></i> Précédent
            </a>

            <h2 class="text-xl font-bold">
                <fmt:setLocale value="fr_FR"/>

                <%-- ======================================================= --%>
                <%--                 LA CORRECTION EST ICI                   --%>
                <%-- On utilise la variable "firstDayAsDate" que la servlet a préparée --%>
                <%-- ======================================================= --%>
                <fmt:formatDate value="${firstDayAsDate}" type="date" pattern="MMMM yyyy" />
            </h2>

            <c:set var="nextMonth" value="${currentMonth.plusMonths(1)}"/>
            <a href="?year=${nextMonth.year}&month=${nextMonth.monthValue}" class="text-indigo-600 hover:text-indigo-800">
                Suivant <i class="fas fa-chevron-right"></i>
            </a>
        </div>

        <%-- Grille du calendrier --%>
        <div class="calendar-grid border-l border-t">
            <%-- Jours de la semaine --%>
            <div class="text-center font-bold p-2 border-r border-b bg-gray-50">Lun</div>
            <div class="text-center font-bold p-2 border-r border-b bg-gray-50">Mar</div>
            <div class="text-center font-bold p-2 border-r border-b bg-gray-50">Mer</div>
            <div class="text-center font-bold p-2 border-r border-b bg-gray-50">Jeu</div>
            <div class="text-center font-bold p-2 border-r border-b bg-gray-50">Ven</div>
            <div class="text-center font-bold p-2 border-r border-b bg-gray-50">Sam</div>
            <div class="text-center font-bold p-2 border-r border-b bg-gray-50">Dim</div>

            <%-- Cases vides pour le début du mois --%>
            <c:forEach begin="1" end="${firstDayOfWeek - 1}">
                <div class="border-r border-b bg-gray-50"></div>
            </c:forEach>

            <%-- Cases pour chaque jour du mois --%>
            <c:forEach begin="1" end="${daysInMonth}" var="day">
                <c:set var="currentDate" value="${currentMonth.atDay(day)}"/>
                <c:set var="availabilitiesForThisDay" value="${availabilitiesByDay[currentDate]}"/>

                <div class="day-cell p-2 border-r border-b relative">
                    <span class="font-bold">${day}</span>

                    <c:if test="${not empty availabilitiesForThisDay}">
                        <div class="mt-2 space-y-1">
                            <c:forEach var="avail" items="${availabilitiesForThisDay}">
                                <div class="p-1 rounded text-xs text-white flex justify-between items-center
                                    ${avail.statut == 'AVAILABLE' ? 'bg-green-500' : ''}
                                    ${avail.statut == 'UNAVAILABLE' ? 'bg-gray-400' : ''}
                                    ${avail.statut == 'ON_LEAVE' ? 'bg-orange-500' : ''}">

                                    <span><c:out value="${avail.heureDebut} - ${avail.heureFin}"/></span>

                                    <form action="<c:url value='/doctor/availability'/>" method="post" onsubmit="return confirm('Êtes-vous sûr ?')">
                                        <input type="hidden" name="action" value="delete">
                                        <input type="hidden" name="id" value="${avail.id}">
                                        <button type="submit" class="bg-transparent border-none text-white hover:text-red-200">
                                            <i class="fas fa-times"></i>
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