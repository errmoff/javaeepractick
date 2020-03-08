<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Новая оценка</title>
    </head>
    <body>
        <h1>Add grade</h1>
        <p>${info}</p>
        <p>Current user: ${user.login}</p>
        <form action="addGrade" method="POST">
            Grade: <input type="text" name="name"><br>
            Desc: <input type="text" name="text"><br>
            <input type="submit" value="Add">
        </form>
        <a href="index.jsp">Main page</a><br>
    </body>
</html>
