<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="empresa.models.Empleado" %>
<html>
<style>
body {
    font-family: 'Arial', sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 20px;
    display: flex;
    flex-direction: column;
    align-items: center;
}

h2 {
    color: #2C3E50;
    font-size: 2em;
    margin-bottom: 20px;
}

/* Table Styles */
table {
    width: 80%;
    border-collapse: collapse;
    margin-bottom: 20px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

th, td {
    padding: 10px;
    text-align: center;
    border: 1px solid #ddd;
}

th {
    background-color: #2980B9;
    color: white;
}

tr:nth-child(even) {
    background-color: #ecf0f1;
}

tr:hover {
    background-color: #d1e8ff; /* Color de fondo al pasar el ratón */
}

/* Button Styles */
input[type="submit"] {
    padding: 8px 12px;
    background-color: #2980B9;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease, transform 0.3s ease;
}

input[type="submit"]:hover {
    background-color: #1A6A91;
    transform: translateY(-2px);
}

/* Responsive Design */
@media (max-width: 600px) {
    h2 {
        font-size: 1.5em;
    }

    table {
        width: 100%;
    }
}
</style>
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
    <form action="views/crearEmpleado.jsp" method="get">
        <input type="submit" value="Agregar Nuevo Empleado">
    </form>

    <br>
    <form action="index.jsp" method="get">
        <input type="submit" value="Volver al Menú Principal">
    </form>
</body>
</html>
