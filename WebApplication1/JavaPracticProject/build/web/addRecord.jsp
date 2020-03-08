<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Set grade for student</h1>
        <p>${info}</p>
        <p>Current user: ${user.login}</p>
        <form action="makeRecord" method="POST">
            Student:
            <select name="personId">
                <c:forEach var="person" items="${listPersons}">
                    <option value="${person.id}">${person.name}</option>
                </c:forEach>
            </select>
            <br>
            Subject: 
            <select name="subjectId">
                <c:forEach var="subject" items="${listSubjects}">
                    <option value="${subject.id}">${subject.name}</option>
                </c:forEach>
            </select>
            <br>
            Grade: 
            <select name="gradeId">
                <c:forEach var="grade" items="${listGrades}">
                    <option value="${grade.id}">${grade.name} (${grade.text})</option>
                </c:forEach>
            </select>
            <br>
            <input type="submit" value="Set">
        </form>
        <a href="index.jsp">Main page</a><br>
    </body>
</html>
