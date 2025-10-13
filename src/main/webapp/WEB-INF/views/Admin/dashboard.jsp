<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Tableau de Bord Admin</title>
</head>
<body>
<h1>Bienvenue sur l'Espace Administration, <c:out value="${sessionScope.user.nom}"/> !</h1>
<p>Votre rôle : <strong>${sessionScope.user.role}</strong></p>

<li><a href="<c:url value ='/admin/departments/'/>">Gerer les Departements</a></li>

<li><a href="<c:url value='/logout'/>">Se déconnecter</a></li>

</body>
</html>
