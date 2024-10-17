<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Consultar Salario</title>
</head>
<body>
    <h2>Consultar Salario de un Empleado</h2>

    <form action="salario" method="post">
        <label for="dni">DNI del Empleado:</label>
        <input type="text" id="dni" name="dni" required>
        <input type="submit" value="Buscar Salario">
    </form>

    <br>
    <form action="index.jsp" method="get">
        <input type="submit" value="Volver al Menú Principal">
    </form>
</body>
</html>
