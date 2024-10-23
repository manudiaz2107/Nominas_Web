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

@WebServlet("/eliminarEmpleServlet")
public class EliminarEmpleServlet extends HttpServlet {
    private EmpleadoDAO empleadoDAO;

    @Override
    public void init() throws ServletException {
        empleadoDAO = new EmpleadoDAO(); // Inicializar DAO
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String dni = request.getParameter("dni");
        
        // Eliminar el empleado de la base de datos
        empleadoDAO.eliminarEmpleado(dni); // Asegúrate de que este método esté implementado en EmpleadoDAO

        // Obtener la lista actualizada de empleados después de la eliminación
        List<Empleado> listaEmpleados = empleadoDAO.listarEmpleados();

        // Establecer la lista de empleados y un mensaje de éxito en la solicitud
        request.setAttribute("empleados", listaEmpleados);
        request.setAttribute("mensaje", "Empleado eliminado correctamente.");

        // Redirigir a la página empleados.jsp con la lista actualizada
        request.getRequestDispatcher("views/empleados.jsp").forward(request, response);
    }
}
