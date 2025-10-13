
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>

</head>
<body>

<h1>
    <c:if test="${empty departement}">Ajouter un Département</c:if>
    <c:if test="${not empty departement}">Modifier le Département</c:if>
</h1>

<form action="<c:url value='/admin/departments'/>" method="post">
    <!-- Champ caché pour l'ID en mode édition -->
    <c:if test="${not empty departement}">
        <input type="hidden" name="id" value="${departement.id}">
    </c:if>

    <label for="nom">Nom:</label><br>
    <input type="text" id="nom" name="nom" value="<c:out value='${departement.nom}'/>" required><br><br>

    <label for="description">Description:</label><br>
    <textarea id="description" name="description" rows="4" cols="50"><c:out value='${departement.description}'/></textarea><br><br>

    <button type="submit">Enregistrer</button>
</form>

<a href="<c:url value='/admin/departments'/>">Retour à la liste</a>

</body>
</html>
