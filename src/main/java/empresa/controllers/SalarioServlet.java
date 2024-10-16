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

/**
 * Servlet implementation class SalarioServlet
 */
@WebServlet("/salario")
public class SalarioServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String dni = request.getParameter("dni");
        double salario = 0.0;

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(
                "SELECT n.salario FROM nominas n JOIN empleados e ON n.empleado_id = e.id WHERE e.dni = ?")) {
            preparedStatement.setString(1, dni);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                salario = resultSet.getDouble("salario");
            } else {
                request.setAttribute("error", "No se encontró salario para el DNI: " + dni);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException("Error al acceder a la base de datos.", e);
        }

        request.setAttribute("salario", salario);
        request.getRequestDispatcher("views/salario.jsp").forward(request, response);
    }
}
