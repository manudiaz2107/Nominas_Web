package empresa.dao;

import empresa.models.Empleado;
import com.empresa.database.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmpleadoDAO {
	public List<Empleado> listarEmpleados() {
		List<Empleado> empleados = new ArrayList<>();
		String sql = "SELECT dni, nombre, sexo, categoria, anos_trabajados FROM empleados";

		try (Connection connection = DatabaseConnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(sql);
				ResultSet resultSet = preparedStatement.executeQuery()) {

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
		}

		return empleados;
	}

	public Empleado obtenerEmpleadoPorDNI(String dni) {
		Empleado empleado = null;
		String sql = "SELECT dni, nombre, sexo, categoria, anos_trabajados FROM empleados WHERE dni = ?";

		try (Connection connection = DatabaseConnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

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
		}

		return empleado;
	}

	public void actualizarEmpleado(Empleado empleado) {
		String sql = "UPDATE empleados SET nombre = ?, sexo = ?, categoria = ?, anos_trabajados = ? WHERE dni = ?";

		try (Connection connection = DatabaseConnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

			preparedStatement.setString(1, empleado.getNombre());
			preparedStatement.setString(2, empleado.getSexo());
			preparedStatement.setString(3, empleado.getCategoria());
			preparedStatement.setInt(4, empleado.getAnosTrabajados());
			preparedStatement.setString(5, empleado.getDni());

			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void eliminarEmpleado(String dni) {
		String sql = "DELETE FROM empleados WHERE dni = ?";
		try (Connection connection = DatabaseConnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

			preparedStatement.setString(1, dni);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void agregarEmpleado(Empleado empleado) {
	    String sql = "INSERT INTO empleados (dni, nombre, sexo, categoria, anos_trabajados) VALUES (?, ?, ?, ?, ?)";
	    
	    try (Connection connection = DatabaseConnection.getConnection();
	         PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
	        preparedStatement.setString(1, empleado.getDni());
	        preparedStatement.setString(2, empleado.getNombre());
	        preparedStatement.setString(3, empleado.getSexo());
	        preparedStatement.setString(4, empleado.getCategoria());
	        preparedStatement.setInt(5, empleado.getAnosTrabajados());
	        
	        preparedStatement.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace(); // Manejo de errores
	    }
	}

}
