package empresa.controllers;

import empresa.dao.EmpleadoDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

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
		empleadoDAO.eliminarEmpleado(dni); // Asegúrate de que este método esté implementado en EmpleadoDAO
		response.sendRedirect("empleados"); // Redirigir después de eliminar
	}
}
