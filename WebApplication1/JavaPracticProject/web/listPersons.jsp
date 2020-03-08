<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Person list</h1>
        <p>${info}</p>
        <p>Current user: ${user.login}</p>
        <ul>
            <c:forEach var="person" items="${listPersons}">
                <li>
                    User: ${person.name} 
                    <a href="editPerson?id=${person.id}">Edit</a>
                </li>
            </c:forEach>
        </ul>
        <a href="index.jsp">Main page</a><br>
    </body>
</html>
