<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Gestion des Départements</title>
</head>
<body>
<h1>Liste des Départements</h1>
<a href="<%= request.getContextPath() %>/admin/departments/add">Ajouter un département</a>
<hr/>
<table border="1">
    <thead>
    <tr>
        <th>Nom</th>
        <th>Description</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="dept" items="${departements}">
        <tr>
            <td><c:out value="${dept.nom}"/></td>
            <td><c:out value="${dept.description}"/></td>
            <td>
                <a href="<c:url value='/admin/departments/edit?id=${dept.id}'/>">Modifier</a> |
                <a href="<c:url value='/admin/departments/delete?id=${dept.id}'/>" onclick="return confirm('Êtes-vous sûr ?')">Supprimer</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

</body>
</html>
