package empresa.controllers;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import empresa.dao.EmpleadoDAO;
import empresa.models.Empleado;

import java.io.IOException;

@WebServlet("/crearEmpleado")
public class CrearEmpleadoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Redirigir al formulario de creación de empleado
        request.getRequestDispatcher("views/crearEmpleado.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String dni = request.getParameter("dni");
        String nombre = request.getParameter("nombre");
        String sexo = request.getParameter("sexo");
        String categoria = request.getParameter("categoria");
        int anosTrabajados;

        // Validar el campo de años trabajados
        try {
            anosTrabajados = Integer.parseInt(request.getParameter("anos_trabajados"));
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Los años trabajados deben ser un número válido.");
            request.getRequestDispatcher("views/crearEmpleado.jsp").forward(request, response);
            return;
        }

        // Validar categoría
        if (!categoria.matches("[A-C]")) {
            request.setAttribute("error", "Categoría inválida. Debe ser A, B o C.");
            request.getRequestDispatcher("views/crearEmpleado.jsp").forward(request, response);
            return;
        }

        // Crear un objeto Empleado
        Empleado nuevoEmpleado = new Empleado(dni, nombre, sexo, categoria, anosTrabajados);
        
        // Guardar el nuevo empleado en la base de datos
        EmpleadoDAO empleadoDAO = new EmpleadoDAO();
        empleadoDAO.agregarEmpleado(nuevoEmpleado);

        // Redirigir a la lista de empleados tras la creación
        response.sendRedirect("empleados");
    }
}
