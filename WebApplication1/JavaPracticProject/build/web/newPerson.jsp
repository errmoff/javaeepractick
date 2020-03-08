<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New user</title>
    </head>
    <body>
        <h1>Add new user</h1>
        <p>${info}</p>
        <p>Current user: ${user.login}</p>
        <form action="addPerson" method="POST">
            Name: <input type="text" name="name"><br>
            Login: <input type="text" name="login"><br>
            Status: <input type="text" name="status"><br>
            Password: <input type="password" name="password1"><br>
            Password x2: <input type="password" name="password2"><br>
            <input type="submit" value="Add">
        </form>
        <a href="index.jsp">Main page</a><br>
    </body>
</html>
