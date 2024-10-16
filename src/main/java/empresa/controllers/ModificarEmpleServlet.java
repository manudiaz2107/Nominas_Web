package empresa.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.empresa.database.DatabaseConnection;

import empresa.models.Empleado;

/**
 * Servlet implementation class ModificarEmpleServlet
 */
@WebServlet("/modificar")
public class ModificarEmpleServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String dni = request.getParameter("dni");
	    String nombre = request.getParameter("nombre");
	    String sexo = request.getParameter("sexo");
	    String categoria = request.getParameter("categoria");
	    int anosTrabajados = Integer.parseInt(request.getParameter("anos_trabajados"));
	    
	    try (Connection connection = DatabaseConnection.getConnection()) {
	        String sql = "UPDATE empleados SET nombre = ?, sexo = ?, categoria = ?, anos_trabajados = ? WHERE dni = ?";
	        PreparedStatement preparedStatement = connection.prepareStatement(sql);
	        preparedStatement.setString(1, nombre);
	        preparedStatement.setString(2, sexo);
	        preparedStatement.setString(3, categoria);
	        preparedStatement.setInt(4, anosTrabajados);
	        preparedStatement.setString(5, dni);
	        
	        preparedStatement.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	        throw new ServletException("Error al acceder a la base de datos.", e);
	    }
	    
	    response.sendRedirect("empleados"); // Redirigir después de actualizar
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String dni = request.getParameter("dni"); // Suponiendo que pasas el DNI para buscar
	    Empleado empleado = null;
	    
	    try (Connection connection = DatabaseConnection.getConnection()) {
	        String sql = "SELECT dni, nombre, sexo, categoria, anos_trabajados FROM empleados WHERE dni = ?";
	        PreparedStatement preparedStatement = connection.prepareStatement(sql);
	        preparedStatement.setString(1, dni);
	        ResultSet resultSet = preparedStatement.executeQuery();

	        if (resultSet.next()) {
	            String nombre = resultSet.getString("nombre");
	            String sexo = resultSet.getString("sexo");
	            String categoria = resultSet.getString("categoria");
	            int anosTrabajados = resultSet.getInt("anos_trabajados");
	            
	            empleado = new Empleado(dni, nombre, sexo, categoria, anosTrabajados);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        throw new ServletException("Error al acceder a la base de datos.", e);
	    }
	    
	    request.setAttribute("empleado", empleado);
	    request.getRequestDispatcher("views/modificar.jsp").forward(request, response);
	}

}