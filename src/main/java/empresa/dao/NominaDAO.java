package empresa.dao;

import com.empresa.database.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class NominaDAO {

	public double obtenerSalarioPorDni(String dni) {
		double salario = 0.0;
		try (Connection connection = DatabaseConnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(
						"SELECT n.salario FROM nominas n JOIN empleados e ON n.empleado_id = e.id WHERE e.dni = ?")) {
			preparedStatement.setString(1, dni);
			ResultSet resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				salario = resultSet.getDouble("salario");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return salario;
	}
}