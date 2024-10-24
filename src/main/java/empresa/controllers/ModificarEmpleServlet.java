package empresa.controllers;

import empresa.models.Empleado;
import empresa.dao.EmpleadoDAO;
import empresa.dao.NominaDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/modificar")
public class ModificarEmpleServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String dni = request.getParameter("dni");
        EmpleadoDAO empleadoDAO = new EmpleadoDAO();
        Empleado empleado = empleadoDAO.obtenerEmpleadoPorDNI(dni);

        if (empleado != null) {
            request.setAttribute("empleado", empleado);
            request.getRequestDispatcher("views/buscarModificarEmpleado.jsp").forward(request, response);
        } else {
            // Maneja el caso en que no se encuentre el empleado
            request.setAttribute("error", "Empleado no encontrado.");
            request.getRequestDispatcher("views/buscarModificarEmpleado.jsp").forward(request, response); // Redirige a buscarModificarEmpleado.jsp
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String dni = request.getParameter("dni");
        String nombre = request.getParameter("nombre");
        String sexo = request.getParameter("sexo");
        String categoria = request.getParameter("categoria");
        int anosTrabajados = Integer.parseInt(request.getParameter("anos_trabajados"));

        Empleado empleado = new Empleado(dni, nombre, sexo, categoria, anosTrabajados);
        EmpleadoDAO empleadoDAO = new EmpleadoDAO();

        // Actualizar los datos del empleado en la base de datos
        empleadoDAO.actualizarEmpleado(empleado);

        // Recalcular el salario basándose en los años trabajados y la categoría
        NominaDAO nominaDAO = new NominaDAO();
        double nuevoSalario = nominaDAO.calcularNuevoSalario(categoria, anosTrabajados);

        // Actualizar el salario en la tabla de nóminas
        nominaDAO.actualizarSalario(dni, nuevoSalario);
        
        // Establecer mensaje de éxito
        request.setAttribute("mensaje", "Empleado modificado correctamente.");
        request.getRequestDispatcher("views/buscarModificarEmpleado.jsp").forward(request, response);
    }
}

