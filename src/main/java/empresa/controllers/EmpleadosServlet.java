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

@WebServlet("/empleados")
public class EmpleadosServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		EmpleadoDAO empleadoDAO = new EmpleadoDAO();
		List<Empleado> empleados = empleadoDAO.listarEmpleados();

		request.setAttribute("empleados", empleados);
		request.getRequestDispatcher("views/empleados.jsp").forward(request, response);
	}
}
