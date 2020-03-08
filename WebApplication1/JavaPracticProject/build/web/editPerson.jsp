<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Edit person attributes</h1>
        <p>${info}</p>
        <p>Current user: ${user.login}</p>
        <form action="changePerson" method="POST">
            <input type="hidden" name="id" value="${person.id}">
            <input type="hidden" name="userId" value="${userId.id}">
            Name and lastname: <input type="text" name="name" value="${person.name}"><br>
            Status: <input type="text" name="status" value="${userId.status}"><br>
            Login: <input type="text" name="login" value="${userId.login}"><br>
            Password: <input type="password" name="password1"><br>
            Repeat password: <input type="password" name="password2"><br>
            <input type="submit" value="Save">
        </form>
            <a href="index.jsp">Main page</a><br>
    </body>
</html>
