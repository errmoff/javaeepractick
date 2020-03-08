<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Subjects list</h1>
        <p>${info}</p>
        <p>Current user: ${user.login}</p>
        <ul>
            <c:forEach var="subject" items="${listSubjects}">
                <li>
                    Subject: ${subject.name}. Teacher: ${subject.teacher}. 
                    <a href="editSubject?id=${subject.id}">Edit</a>
                </li>
            </c:forEach>
        </ul>
        <a href="index.jsp">Main page</a><br>
    </body>
</html>
