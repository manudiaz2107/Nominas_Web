<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="empresa.dao.EmpleadoDAO" %>
<%@ page import="empresa.models.Empleado" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Filtrar Empleados</title>
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
            font-size: 2em;
            margin-bottom: 20px;
        }

        /* Form Styles */
        form {
            display: flex;
            flex-direction: column;
            width: 80%;
            margin-bottom: 20px;
        }

        label {
            margin-bottom: 5px;
            font-weight: bold;
        }

        input[type="text"], select {
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        button {
            padding: 8px 12px;
            background-color: #2980B9;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        button:hover {
            background-color: #1A6A91;
            transform: translateY(-2px);
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
            background-color: #2980B9;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #ecf0f1;
        }

        tr:hover {
            background-color: #d1e8ff; /* Color de fondo al pasar el ratón */
        }

        /* Responsive Design */
        @media (max-width: 600px) {
            h1 {
                font-size: 1.5em;
            }

            form, table {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <h1>Filtrar Empleados</h1>
    
    <form action="filtrarEmpleados.jsp" method="post">

        <label for="nombre">Nombre:</label>
        <input type="text" id="nombre" name="nombre">

        <label for="sexo">Sexo:</label>
        <select id="sexo" name="sexo">
            <option value="" selected>Todos</option>
            <option value="M">Masculino</option>
            <option value="F">Femenino</option>
        </select>

        <label for="categoria">Categoría:</label>
		<select id="categoria" name="categoria">
		<option value="" selected>Todos</option>
            <option value="A">A</option>
            <option value="B">B</option>
            <option value="C">C</option>
        </select>
		
        <label for="anosTrabajados">Años Trabajados:</label>
        <input type="text" id="anosTrabajados" name="anosTrabajados">

        <button type="submit">Filtrar</button>
    </form>

    <%
        EmpleadoDAO empleadoDAO = new EmpleadoDAO();
        List<Empleado> empleadosFiltrados;

        // Obtener los parámetros de filtrado
        String dniFiltrar = request.getParameter("dni");
        String nombreFiltrar = request.getParameter("nombre");
        String sexoFiltrar = request.getParameter("sexo");
        String categoriaFiltrar = request.getParameter("categoria");
        String anosTrabajadosFiltrar = request.getParameter("anosTrabajados");

        // Si no hay filtros aplicados, mostrar todos los empleados
        if ((dniFiltrar == null || dniFiltrar.trim().isEmpty()) &&
            (nombreFiltrar == null || nombreFiltrar.trim().isEmpty()) &&
            (sexoFiltrar == null || sexoFiltrar.trim().isEmpty()) &&
            (categoriaFiltrar == null || categoriaFiltrar.trim().isEmpty()) &&
            (anosTrabajadosFiltrar == null || anosTrabajadosFiltrar.trim().isEmpty())) {
            empleadosFiltrados = empleadoDAO.obtenerTodosEmpleados();
        } else {
            // Llama al método de filtrado
            empleadosFiltrados = empleadoDAO.filtrarEmpleados(dniFiltrar, nombreFiltrar,
                sexoFiltrar.isEmpty() ? null : sexoFiltrar, // si es "Todos", pasa null
                categoriaFiltrar, anosTrabajadosFiltrar);
        }
    %>

    <%
        if (empleadosFiltrados != null && !empleadosFiltrados.isEmpty()) {
    %>
        <h2>Resultados:</h2>
        <table border="1">
            <thead>
                <tr>
                    <th>DNI</th>
                    <th>Nombre</th>
                    <th>Sexo</th>
                    <th>Categoría</th>
                    <th>Años Trabajados</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Empleado empleado : empleadosFiltrados) {
                %>
                <tr>
                    <td><%= empleado.getDni() %></td>
                    <td><%= empleado.getNombre() %></td>
                    <td><%= empleado.getSexo() %></td>
                    <td><%= empleado.getCategoria() %></td>
                    <td><%= empleado.getAnosTrabajados() %></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    <%
        } else {
    %>
        <h2>No se encontraron empleados.</h2>
    <%
        }
    %>
    
    <form action="../index.jsp" method="get">
        <button type="submit">Volver al Menú Principal</button>
    </form>
</body>
</html>
