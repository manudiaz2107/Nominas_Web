<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Buscar y Modificar Empleado</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4; /* Color de fondo */
            margin: 0;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center; /* Centramos los elementos en el cuerpo */
        }

        h2 {
            color: #2C3E50; /* Color del encabezado */
            font-size: 2em;
            margin-bottom: 20px;
        }

        /* Estilos del formulario */
        form {
            background-color: #ffffff; /* Fondo blanco para el formulario */
            border-radius: 8px; /* Esquinas redondeadas */
            padding: 20px; /* Padding interno */
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1); /* Sombra sutil */
            width: 80%; /* Ancho del formulario */
            max-width: 500px; /* Ancho máximo */
            display: flex;
            flex-direction: column; /* Disposición vertical */
        }

        /* Estilos para etiquetas */
        label {
            margin-bottom: 5px; /* Margen inferior de las etiquetas */
        }

        /* Estilo de entradas de texto */
        input[type="text"], input[type="number"], select {
            padding: 10px; /* Padding interno */
            margin-bottom: 15px; /* Margen inferior */
            border: 1px solid #ddd; /* Borde gris claro */
            border-radius: 5px; /* Esquinas redondeadas */
        }

        /* Estilo para botones */
        input[type="submit"] {
            padding: 8px 12px; /* Padding interno */
            background-color: #2980B9; /* Color azul */
            color: white; /* Color de texto blanco */
            border: none; /* Sin borde */
            border-radius: 5px; /* Esquinas redondeadas */
            cursor: pointer; /* Cursor tipo puntero */
            transition: background-color 0.3s ease, transform 0.3s ease; /* Transiciones suaves */
        }

        input[type="submit"]:hover {
            background-color: #1A6A91; /* Color azul oscuro al pasar el ratón */
            transform: translateY(-2px); /* Efecto de elevación */
        }

        /* Diseño responsivo */
        @media (max-width: 600px) {
            h2 {
                font-size: 1.5em; /* Ajustamos el tamaño del encabezado */
            }

            form {
                width: 95%; /* Ancho del formulario en dispositivos pequeños */
            }
        }

        /* Estilo para mensajes de error */
        .error {
            color: red;
            margin-bottom: 15px;
        }

        /* Estilo de la tabla */
        table {
            width: 80%;
            border-collapse: collapse;
            margin-top: 20px;
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
    </style>
</head>
<body>
    <h2>Buscar y Modificar Empleado</h2>

    <c:if test="${not empty error}">
        <div class="error">${error}</div>
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
