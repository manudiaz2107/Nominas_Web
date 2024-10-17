package empresa.controllers;

import empresa.models.Empleado;
import empresa.dao.EmpleadoDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/modificar")
public class ModificarEmpleServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String dni = request.getParameter("dni");
		EmpleadoDAO empleadoDAO = new EmpleadoDAO();
		Empleado empleado = empleadoDAO.obtenerEmpleadoPorDNI(dni);

		if (empleado != null) {
			request.setAttribute("empleado", empleado);
			request.getRequestDispatcher("views/modificar.jsp").forward(request, response);
		} else {
			// Maneja el caso en que no se encuentre el empleado
			response.sendError(HttpServletResponse.SC_NOT_FOUND, "Empleado no encontrado");
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
		empleadoDAO.actualizarEmpleado(empleado);

		response.sendRedirect("empleados"); // Redirige a la lista de empleados
	}
}
