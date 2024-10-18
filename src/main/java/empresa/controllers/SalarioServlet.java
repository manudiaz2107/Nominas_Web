package empresa.controllers;

import empresa.dao.NominaDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/salario")
public class SalarioServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String dni = request.getParameter("dni");
	    NominaDAO nominaDAO = new NominaDAO();
	    double salario = nominaDAO.obtenerSalarioPorDni(dni);

	    if (salario > 0) {
	        request.setAttribute("dni", dni);
	        request.setAttribute("salario", salario);
	        request.getRequestDispatcher("views/mostrarSalario.jsp").forward(request, response);
	    } else {
	        request.setAttribute("error", "No se encontró el salario para el DNI: " + dni);
	        request.getRequestDispatcher("views/mostrarSalario.jsp").forward(request, response);
	    }
	}
	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // En lugar de permitir un GET en esta URL, puedes redirigir al formulario
        response.sendRedirect("views/consultarSalario.jsp");
    }
}