<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Mostrar Salario</title>
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
            font-size: 2.5em;
            margin-bottom: 20px;
        }

        p {
            font-size: 1.1em;
            margin-bottom: 15px;
        }

        .error {
            color: red;
            font-weight: bold;
            margin-bottom: 20px;
        }

        form {
            margin-top: 20px;
        }

        input[type="submit"] {
            padding: 10px 15px;
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

        @media (max-width: 600px) {
            h2 {
                font-size: 2em;
            }

            p {
                font-size: 1em;
            }
        }
    </style>
</head>
<body>
    <h2>Consultar Salario</h2>

    <c:if test="${not empty error}">
        <p class="error">${error}</p>
    </c:if>

    <c:if test="${not empty dni}">
        <p>El salario del empleado con DNI <strong>${dni}</strong> es: <strong>${salario}</strong></p>
    </c:if>

    <br>
    <form action="index.jsp" method="get">
        <input type="submit" value="Volver al Menú Principal">
    </form>
</body>
</html>
