<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Mostrar Salario</title>
</head>
<body>
    <h2>Consultar Salario</h2>

    <c:if test="${not empty error}">
        <p style="color:red;">${error}</p>
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
