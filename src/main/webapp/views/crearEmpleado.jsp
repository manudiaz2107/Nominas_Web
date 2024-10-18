<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Crear Nuevo Empleado</title>
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

        div {
            margin-bottom: 20px;
            font-size: 1.1em;
        }

        form {
            background-color: #ffffff;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 500px;
            display: flex;
            flex-direction: column;
        }

        label {
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="number"],
        select {
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
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
            h1 {
                font-size: 2em;
            }

            form {
                width: 95%;
            }
        }
    </style>
</head>
<body>
    <h1>Crear Nuevo Empleado</h1>
    
    <c:if test="${not empty error}">
        <div style="color: red;">${error}</div>
    </c:if>
    
    <form action="${pageContext.request.contextPath}/crearEmpleado" method="post">
        <label>DNI:</label>
        <input type="text" name="dni" required /><br />
        
        <label>Nombre:</label>
        <input type="text" name="nombre" required /><br />
        
        <label>Sexo:</label>
        <select name="sexo" required>
            <option value="M">Masculino</option>
            <option value="F">Femenino</option>
        </select><br />
        
        <label>Categoría:</label>
        <select name="categoria" required>
            <option value="A">A</option>
            <option value="B">B</option>
            <option value="C">C</option>
            <option value="D">D</option>
        </select><br />
        
        <label>Años Trabajados:</label>
        <input type="number" name="anos_trabajados" required /><br />
        
        <input type="submit" value="Crear Empleado" />
    </form>

    <br>
    <form action="../index.jsp" method="get">
        <input type="submit" value="Volver al Menú Principal">
    </form>
</body>
</html>
