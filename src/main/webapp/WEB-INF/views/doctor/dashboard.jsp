<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Tableau de Bord Patient</title>
</head>
<body>
<h1>Bienvenue sur votre Espace Doctore, <c:out value="${sessionScope.user.nom}"/> !</h1>
<p>Votre rôle : <strong>${sessionScope.user.role}</strong></p>
<a href="<c:url value='/logout'/>">Se déconnecter</a>
<a href="<c:url value='/doctor/availability'/>">avalability</a>












</body>
</html>