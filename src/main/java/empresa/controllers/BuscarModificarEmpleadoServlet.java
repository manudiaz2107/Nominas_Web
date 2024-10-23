package empresa.controllers;

import empresa.models.Empleado;
import empresa.dao.EmpleadoDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/buscarModificarEmpleado")
public class BuscarModificarEmpleadoServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String dni = request.getParameter("dni");
        
        if (dni == null || dni.isEmpty()) {
            request.setAttribute("error", "Debe proporcionar un DNI para buscar un empleado.");
            request.getRequestDispatcher("views/buscarModificarEmpleado.jsp").forward(request, response);
            return;  // Salir del método para evitar que continúe
        }
        
        EmpleadoDAO empleadoDAO = new EmpleadoDAO();
        Empleado empleado = empleadoDAO.obtenerEmpleadoPorDNI(dni);

        if (empleado != null) {
            request.setAttribute("empleado", empleado);
            request.getRequestDispatcher("views/buscarModificarEmpleado.jsp").forward(request, response);
        } else {
            // Maneja el caso en que no se encuentre el empleado
            request.setAttribute("error", "Empleado no encontrado");
            request.getRequestDispatcher("/webapp/views/buscarModificarEmpleado.jsp").forward(request, response);
        }
    }

    // No se necesita doPost en este caso, ya que la búsqueda se hace con GET
}
