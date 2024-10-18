<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
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
input[type="text"] {
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
</style>
<head>
    <title>Consultar Salario</title>
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
