<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Modificar Empleado</title>
</head>
<body>
    <h1>Modificar Empleado</h1>
    <form action="ModificarEmpleServlet" method="post">
        <input type="hidden" name="dni" value="${empleado.dni}" />
        <label>Nombre:</label>
        <input type="text" name="nombre" value="${empleado.nombre}" required /><br />
        <label>Sexo:</label>
        <select name="sexo" required>
            <option value="M" <c:if test="${empleado.sexo == 'M'}">selected</c:if>>Masculino</option>
            <option value="F" <c:if test="${empleado.sexo == 'F'}">selected</c:if>>Femenino</option>
        </select><br />
        <label>Categoría:</label>
        <input type="text" name="categoria" value="${empleado.categoria}" required /><br />
        <label>Años Trabajados:</label>
        <input type="number" name="anos_trabajados" value="${empleado.anosTrabajados}" required /><br />
        <input type="submit" value="Modificar" />
    </form>
</body>
</html>
