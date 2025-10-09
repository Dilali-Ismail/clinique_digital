<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Inscription</title>
</head>
<body>
<h2>Créer un compte</h2>

<%-- Affiche le message d'erreur s'il existe --%>
<c:if test="${not empty errorMessage}">
    <p style="color:red;">${errorMessage}</p>
</c:if>

<form action="register" method="post">
    Nom: <input type="text" name="nom" required><br/>
    Email: <input type="email" name="email" required><br/>
    Mot de passe: <input type="password" name="password" required><br/>
    <button type="submit">S'inscrire</button>
</form>
</body>
</html>
