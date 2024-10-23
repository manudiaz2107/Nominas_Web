<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Consultar Salario</title>
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

        input[type="text"] {
            background-color: #f9f9f9;
            color: #333;
            border: 1px solid #ccc;
            padding: 8px;
            margin-bottom: 15px;
            font-size: 1em;
            border-radius: 8px;
            transition: border-color 0.3s;
        }

        input[type="text"]:focus {
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

        @media (max-width: 600px) {
            form {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <h2>Consultar Salario de un Empleado</h2>

    <form action="${pageContext.request.contextPath}/salario" method="post">
        <label for="dni">DNI del Empleado:</label>
        <input type="text" id="dni" name="dni" required>
        <input type="submit" value="Buscar Salario">
    </form>

    <br>
    <form action="../index.jsp" method="get">
        <input type="submit" value="Volver al Menú Principal">
    </form>
</body>
</html>
