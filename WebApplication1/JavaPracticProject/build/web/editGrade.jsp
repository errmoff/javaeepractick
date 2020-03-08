<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Edit grade attributes</h1>
        <p>${info}</p>
        <p>Current user: ${user.login}</p>
        <form action="changeGrade" method="POST">
            <input type="hidden" name="id" value="${grade.id}">
            Grade: <input type="text" name="name" value="${grade.name}"><br>
            Desc: <input type="text" name="text" value="${grade.text}"><br>
            <input type="submit" value="Save">
        </form>
            <a href="index.jsp">Main page</a><br>
    </body>
</html>
