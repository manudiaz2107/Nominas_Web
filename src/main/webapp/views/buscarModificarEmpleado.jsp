<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Buscar y Modificar Empleado</title>
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
        }

        h2 {
            color: #444;
            font-size: 2em;
            text-align: center;
            margin-bottom: 20px;
            font-weight: 300;
        }

        form {
            display: flex;
            flex-direction: column;
            width: 350px;
            background-color: #ffffff;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 12px;
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        label {
            font-weight: 500;
            margin-bottom: 5px;
            color: #555;
        }

        input[type="text"], input[type="number"], select {
            background-color: #f9f9f9;
            color: #333;
            border: 1px solid #ccc;
            padding: 8px;
            margin-bottom: 15px;
            font-size: 1em;
            border-radius: 8px;
            transition: border-color 0.3s;
        }

        input[type="text"]:focus, input[type="number"]:focus, select:focus {
            border-color: #87cefa;
            outline: none;
        }

        input[type="submit"] {
            background-color: #87cefa;
            color: white;
            border: none;
            padding: 10px 0;
            font-size: 1em;
            cursor: pointer;
            border-radius: 8px;
            transition: background-color 0.3s;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        input[type="submit"]:hover {
            background-color: #71b8e6;
        }

        .error, .message {
            color: #ff5c5c;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .menu-bar {
            background-color: #87cefa;
            color: white;
            padding: 10px;
            width: 100%;
            display: flex;
            justify-content: space-around;
            margin-bottom: 20px;
            border-radius: 0 0 12px 12px;
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
        }

        .menu-bar span {
            cursor: pointer;
            font-size: 1em;
        }

        @media (max-width: 600px) {
            form {
                width: 100%;
            }
        }

        /* Efecto de fondo animado */
        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: radial-gradient(circle at 20% 20%, rgba(135, 206, 250, 0.3), transparent 70%),
                        radial-gradient(circle at 80% 80%, rgba(224, 247, 250, 0.3), transparent 60%),
                        radial-gradient(circle at 50% 80%, rgba(144, 238, 144, 0.3), transparent 80%);
            z-index: -1;
            animation: moveBackground 10s linear infinite;
            opacity: 0.5; /* Opacidad del fondo */
        }

        @keyframes moveBackground {
            0% {
                transform: translate(0, 0);
            }
            100% {
                transform: translate(20px, 20px); /* Aumentar el movimiento */
            }
        }
    </style>
</head>
<body>
    <h2>Buscar y Modificar Empleado</h2>

    <c:if test="${not empty error}">
        <div class="error">${error}</div>
    </c:if>
    <c:if test="${not empty mensaje}">
        <div class="message">${mensaje}</div>
    </c:if>

    <form action="${pageContext.request.contextPath}/modificar" method="get">
        <label for="dni">DNI del Empleado:</label>
        <input type="text" id="dni" name="dni" required>
        <input type="submit" value="Buscar Empleado">
    </form>

    <c:if test="${not empty empleado}">
        <form action="${pageContext.request.contextPath}/buscarModificarEmpleado" method="get">
            <input type="hidden" name="dni" value="${empleado.dni}" />
            <label>Nombre:</label>
            <input type="text" name="nombre" value="${empleado.nombre}" required />
            <label>Sexo:</label>
            <select name="sexo" required>
                <option value="M" <c:if test="${empleado.sexo == 'M'}">selected</c:if>>Masculino</option>
                <option value="F" <c:if test="${empleado.sexo == 'F'}">selected</c:if>>Femenino</option>
            </select>
            <label>Categoría:</label>
            <select name="categoria" required>
                <option value="A" <c:if test="${empleado.categoria == 'A'}">selected</c:if>>A</option>
                <option value="B" <c:if test="${empleado.categoria == 'B'}">selected</c:if>>B</option>
                <option value="C" <c:if test="${empleado.categoria == 'C'}">selected</c:if>>C</option>
            </select>
            <label>Años Trabajados:</label>
            <input type="number" name="anos_trabajados" value="${empleado.anosTrabajados}" required />
            <input type="submit" value="Modificar">
        </form>
    </c:if>

    <br>
    <form action="../index.jsp" method="get">
        <input type="submit" value="Volver al Menú Principal">
    </form>
</body>
</html>
