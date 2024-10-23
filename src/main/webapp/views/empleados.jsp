<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="empresa.models.Empleado" %>
<html>
<style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #e0f7fa, #87cefa); /* Degradado suave */
            color: #333;
            margin: 0;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
            overflow: hidden; /* Para ocultar el desbordamiento del fondo */
        }

        h2 {
            color: #444;
            font-size: 2.5em;
            text-align: center;
            margin-bottom: 20px;
            font-weight: 300;
        }

        .error {
            color: red;
            margin-bottom: 20px;
        }

        .message {
            color: green;
            margin-bottom: 20px;
        }

        table {
            width: 80%;
            border-collapse: collapse;
            margin-bottom: 20px;
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ccc;
        }

        th {
            background-color: #87cefa;
            color: white;
        }

        tr:hover {
            background-color: #f1f1f1; /* Color de fondo al pasar el mouse */
        }

        input[type="submit"] {
            background-color: #87cefa;
            color: white;
            border: none;
            padding: 10px 15px;
            cursor: pointer;
            border-radius: 8px;
            transition: background-color 0.3s;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        input[type="submit"]:hover {
            background-color: #71b8e6;
        }

        @media (max-width: 600px) {
            table {
                width: 100%;
            }
        }
    </style>
<head>
    <title>Lista de Empleados</title>
</head>
<body>
<c:if test="${not empty error}">
        <div class="error">${error}</div>
    </c:if>
    <c:if test="${not empty mensaje}">
        <div class="message">${mensaje}</div>
    </c:if>
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
