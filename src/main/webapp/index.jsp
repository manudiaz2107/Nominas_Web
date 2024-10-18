<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<style>
body {
    font-family: 'Arial', sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 20px;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    flex-direction: column;
}

h1 {
    color: #2C3E50;
    font-size: 2.5em;
    margin-bottom: 10px;
    text-align: center;
}

h2 {
    color: #34495E;
    font-size: 1.5em;
    margin-bottom: 20px;
}

/* Menu Styles */
ul {
    list-style-type: none;
    padding: 0;
    text-align: center;
}

ul li {
    display: inline-block;
    margin: 0 15px;
}

ul li a {
    text-decoration: none;
    padding: 15px 25px;
    background-color: #2980B9;
    color: white;
    border-radius: 25px;
    transition: background-color 0.3s ease, transform 0.3s ease;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

ul li a:hover {
    background-color: #1A6A91;
    transform: translateY(-2px);
}

/* Responsive Design */
@media (max-width: 600px) {
    h1 {
        font-size: 2em;
    }

    h2 {
        font-size: 1.2em;
    }

    ul li {
        margin: 0 5px;
    }

    ul li a {
        padding: 10px 15px;
    }
}
</style>
<head>
    <title>Aplicación de Nóminas</title>
</head>
<body>
    <h1>Bienvenido a la Aplicación de Nóminas</h1>
    <h2>Menú</h2>
    <ul>
        <li><a href="empleados">Mostrar todos los empleados</a></li>
        <li><a href="salario">Mostrar salario de un empleado</a></li>
    </ul>
</body>
</html>
