<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Log in</title>
    </head>
    <body>
        <h1>Authentification</h1>
        <p>${info}</p>
        <p>Current user: ${user.login}</p>
        <form action="login" method="POST">
            Login: <input type="text" name="login">
            <br>
            Password: <input type="password" name="password">
            <br>
            <input type="submit" value="Log in">
        </form>
        Do you not have an account? <a href="newPerson">register now</a><br>
        <a href="index.jsp">Main page</a><br>
    </body>
</html>
