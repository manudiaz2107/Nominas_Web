<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="empresa.models.Empleado" %>

<html>
<head>
    <title>Modificar Empleado</title>
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

        h1 {
            color: #2C3E50;
            font-size: 2.5em;
            margin-bottom: 20px;
        }

        .error {
            color: red;
            font-weight: bold;
            margin-bottom: 20px;
        }

        form {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            width: 300px;
            display: flex;
            flex-direction: column;
        }

        label {
            margin-top: 10px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="number"],
        select {
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1em;
        }

        input[type="submit"] {
            padding: 10px 15px;
            background-color: #2980B9;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 15px;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #1A6A91;
            transform: translateY(-2px);
        }

        /* Estilo para los formularios de los botones */
        .button-form {
            margin-top: 10px; /* Ajusta el espacio entre los botones */
        }

        @media (max-width: 600px) {
            h1 {
                font-size: 2em;
            }

            form {
                width: 90%;
            }
        }
    </style>
</head>
<body>
    <h1>Modificar Empleado</h1>

    <c:if test="${not empty error}">
        <div class="error">${error}</div>
    </c:if>
    <c:if test="${not empty mensaje}">
        <div class="message">${mensaje}</div>
    </c:if>

    <c:if test="${not empty empleado}">
        <form action="modificar" method="post"> 
            <input type="hidden" name="dni" value="${empleado.dni}" />
            <label>Nombre:</label>
            <input type="text" name="nombre" value="${empleado.nombre}" required /><br />
            <label>Sexo:</label>
            <select name="sexo" required>
                <option value="M" <c:if test="${empleado.sexo == 'M'}">selected</c:if>>Masculino</option>
                <option value="F" <c:if test="${empleado.sexo == 'F'}">selected</c:if>>Femenino</option>
            </select><br />
            <label>Categoría:</label>
            <select name="categoria" required>
                <option value="A" <c:if test="${empleado.categoria == 'A'}">selected</c:if>>A</option>
                <option value="B" <c:if test="${empleado.categoria == 'B'}">selected</c:if>>B</option>
                <option value="C" <c:if test="${empleado.categoria == 'C'}">selected</c:if>>C</option>
            </select><br />
            <label>Años Trabajados:</label>
            <input type="number" name="anos_trabajados" value="${empleado.anosTrabajados}" required /><br />
            <input type="submit" value="Modificar" />
        </form>
    </c:if>

    <br>
    <form action="views/buscarModificarEmpleado.jsp" method="get">
        <input type="submit" value="Volver a modificar">
    </form>
    <form action="index.jsp" method="get">
        <input type="submit" value="Volver al Menú Principal">
    </form>
</body>
</html>
