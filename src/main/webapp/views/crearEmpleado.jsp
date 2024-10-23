<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Crear Nuevo Empleado</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #e0f7fa, #87cefa);
            color: #333;
            margin: 0;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
            overflow: hidden;
        }

        h1 {
            color: #444;
            font-size: 2.5em;
            text-align: center;
            margin-bottom: 20px;
            font-weight: 300;
        }

        /* Form Styles */
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

        input[type="text"], select {
            background-color: #f9f9f9;
            color: #333;
            border: 1px solid #ccc;
            padding: 8px;
            margin-bottom: 15px;
            font-size: 1em;
            border-radius: 8px;
            transition: border-color 0.3s;
        }

        input[type="text"]:focus, select:focus {
            border-color: #87cefa;
            outline: none;
        }

        button {
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

        button:hover {
            background-color: #71b8e6;
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
            background-color: #87cefa;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #ecf0f1;
        }

        tr:hover {
            background-color: #d1e8ff;
        }

        @media (max-width: 600px) {
            h1 {
                font-size: 2em;
            }

            form, table {
                width: 100%;
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
