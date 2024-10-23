package empresa.controllers;

import empresa.dao.EmpleadoDAO;
import empresa.models.Empleado;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/filtrarEmpleados")
public class FiltrarEmpleadosServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener los parámetros de filtrado
        String dni = request.getParameter("dni");
        String nombre = request.getParameter("nombre");
        String sexo = request.getParameter("sexo");
        String categoria = request.getParameter("categoria");
        String anosTrabajados = request.getParameter("anosTrabajados");

        // Crear una instancia de EmpleadoDAO
        EmpleadoDAO empleadoDAO = new EmpleadoDAO();

        // Filtrar empleados
        List<Empleado> empleadosFiltrados = empleadoDAO.filtrarEmpleados(dni, nombre, sexo, categoria, anosTrabajados);
        
        // Agregar la lista de empleados filtrados al request
        request.setAttribute("empleados", empleadosFiltrados);
        
        // Redirigir a la página JSP para mostrar los resultados
        request.getRequestDispatcher("resultadosFiltrado.jsp").forward(request, response);
    }
}
