<%--
  Created by IntelliJ IDEA.
  User: Youcode
  Date: 10/13/2025
  Time: 9:53 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

</head>
<body>

<h1>
    <c:if test="${empty department}">Ajouter un Département</c:if>
    <c:if test="${not empty department}">Modifier le Département</c:if>
</h1>

<form action="<c:url value='/admin/departments'/>" method="post">
    <!-- Champ caché pour l'ID en mode édition -->
    <c:if test="${not empty department}">
        <input type="hidden" name="id" value="${department.id}">
    </c:if>

    <label for="nom">Nom:</label><br>
    <input type="text" id="nom" name="nom" value="<c:out value='${department.nom}'/>" required><br><br>

    <label for="description">Description:</label><br>
    <textarea id="description" name="description" rows="4" cols="50"><c:out value='${department.description}'/></textarea><br><br>

    <button type="submit">Enregistrer</button>
</form>

<a href="<c:url value='/admin/departments'/>">Retour à la liste</a>

</body>
</html>
