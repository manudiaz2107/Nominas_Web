<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="empresa.models.Empleado" %>
<html>
<head>
    <title>Lista de Empleados</title>
</head>
<body>
    <h2>Lista de Empleados</h2>

    <table border="1">
        <thead>
            <tr>
                <th>DNI</th>
                <th>Nombre</th>
                <th>Sexo</th>
                <th>Categoría</th>
                <th>Años Trabajados</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="empleado" items="${empleados}">
                <tr>
                    <td>${empleado.dni}</td>
                    <td>${empleado.nombre}</td>
                    <td>${empleado.sexo}</td>
                    <td>${empleado.categoria}</td>
                    <td>${empleado.anosTrabajados}</td>
                    <td>
                        <form action="modificar" method="get">
                            <input type="hidden" name="dni" value="${empleado.dni}" />
                            <input type="submit" value="Modificar">
                        </form>
                        <form action="eliminarEmpleServlet" method="post" style="display:inline;">
                            <input type="hidden" name="dni" value="${empleado.dni}" />
                            <input type="submit" value="Eliminar" onclick="return confirm('¿Estás seguro de que deseas eliminar este empleado?');">
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <br>
    <form action="crearEmpleado.jsp" method="get">
        <input type="submit" value="Agregar Nuevo Empleado">
    </form>

    <br>
    <form action="index.jsp" method="get">
        <input type="submit" value="Volver al Menú Principal">
    </form>
</body>
</html>
