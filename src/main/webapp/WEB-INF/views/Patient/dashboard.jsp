<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Tableau de Bord Patient</title>
</head>
<body>
<h1>Bienvenue sur votre Espace Patient, <c:out value="${sessionScope.user.nom}"/> !</h1>
<p>Votre rôle : <strong>${sessionScope.user.role}</strong></p>

<a href="<c:url value='/logout'/>">Se déconnecter</a>
</body>
</html>