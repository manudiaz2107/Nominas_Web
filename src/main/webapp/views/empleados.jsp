<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Lista de Empleados</title>
</head>
<body>
    <h1>Lista de Empleados</h1>
    <table border="1">
        <tr>
            <th>DNI</th>
            <th>Nombre</th>
            <th>Sexo</th>
            <th>Categoría</th>
            <th>Años Trabajados</th>
        </tr>
        <c:forEach var="empleado" items="${empleados}">
            <tr>
                <td>${empleado.dni}</td>
                <td>${empleado.nombre}</td>
                <td>${empleado.sexo}</td>
                <td>${empleado.categoria}</td>
                <td>${empleado.anosTrabajados}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
