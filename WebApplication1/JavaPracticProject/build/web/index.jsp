<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Main Page</title>
    </head>
<!--  -->
    <body>
        <p>${info}</p>
        <p>Current user: ${user.login}</p>
        <br>
        <h2>For administrator:</h2>
        <a href="newSubject">Add new subject</a><br>
        <a href="newGrade">Add new grade</a><br>
        <a href="listPersons">Person list</a><br>
        <a href="listGrades">Grade list</a><br>
        <br>
        <h2>Main functions:</h2>
        <a href="showLogin">Log in</a><br>
        <a href="logout">Log out</a><br>
        <a href="newPerson">Registration</a><br>
        <a href="listSubjects">Subject list</a><br>
        <h2>For teachers:</h2>
        <a href="addRecord">Set grade for student</a><br>
        <a href="recPerson">Person grades</a><br>
        <a href="recSubject">Subject grades</a><br>
        <br>
        <a href="index.jsp">Main page</a><br>
    </body>
</html>
