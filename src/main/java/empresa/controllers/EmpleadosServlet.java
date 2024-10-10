package empresa.controllers;

import com.empresa.database.DatabaseConnection;
import empresa.models.Empleado;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/empleados")
public class EmpleadosServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Empleado> empleados = new ArrayList<>();
        try (Connection connection = DatabaseConnection.getConnection()) {
            String sql = "SELECT dni, nombre, sexo, categoria, anos_trabajados FROM Empleados";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                String dni = resultSet.getString("dni");
                String nombre = resultSet.getString("nombre");
                String sexo = resultSet.getString("sexo");
                String categoria = resultSet.getString("categoria");
                int anosTrabajados = resultSet.getInt("anos_trabajados");
                
                Empleado empleado = new Empleado(dni, nombre, sexo, categoria, anosTrabajados);
                empleados.add(empleado);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException("Error al acceder a la base de datos.", e);
        }
        request.setAttribute("empleados", empleados);
        request.getRequestDispatcher("empleados.jsp").forward(request, response);
    }
}
