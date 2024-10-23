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
	           
	           // Ejecutar la inserción del empleado
	           preparedStatement.executeUpdate();
	           
	           // Calcular el salario y agregarlo a la tabla de nóminas
	           NominaDAO nominaDAO = new NominaDAO();
	           double nuevoSalario = nominaDAO.calcularNuevoSalario(empleado.getCategoria(), empleado.getAnosTrabajados());
	           nominaDAO.agregarSalario(empleado.getDni(), nuevoSalario); // Cambiado aquí
	           
	       } catch (SQLException e) {
	           e.printStackTrace(); // Manejo de errores
	       }
	}
	public List<Empleado> filtrarEmpleados(String dni, String nombre, String sexo, String categoria, String anosTrabajados) {
	    List<Empleado> empleados = new ArrayList<>();
	    StringBuilder sql = new StringBuilder("SELECT dni, nombre, sexo, categoria, anos_trabajados FROM empleados WHERE 1=1");
	    
	    if (dni != null && !dni.trim().isEmpty()) {
	        sql.append(" AND dni = ?");
	    }
	    if (nombre != null && !nombre.trim().isEmpty()) {
	        sql.append(" AND nombre LIKE ?");
	    }
	    if (sexo != null && !sexo.trim().isEmpty()) {
	        sql.append(" AND sexo = ?");
	    }
	    if (categoria != null && !categoria.trim().isEmpty()) {
	        sql.append(" AND categoria = ?");
	    }
	    if (anosTrabajados != null && !anosTrabajados.trim().isEmpty()) {
	        sql.append(" AND anos_trabajados = ?");
	    }

	    try (Connection connection = DatabaseConnection.getConnection();
	         PreparedStatement preparedStatement = connection.prepareStatement(sql.toString())) {

	        int index = 1;

	        if (dni != null && !dni.trim().isEmpty()) {
	            preparedStatement.setString(index++, dni);
	        }
	        if (nombre != null && !nombre.trim().isEmpty()) {
	            preparedStatement.setString(index++, "%" + nombre + "%"); // Para búsqueda parcial
	        }
	        if (sexo != null && !sexo.trim().isEmpty()) {
	            preparedStatement.setString(index++, sexo);
	        }
	        if (categoria != null && !categoria.trim().isEmpty()) {
	            preparedStatement.setString(index++, categoria);
	        }
	        if (anosTrabajados != null && !anosTrabajados.trim().isEmpty()) {
	            preparedStatement.setInt(index++, Integer.parseInt(anosTrabajados)); // Asegúrate de convertir a int
	        }

	        ResultSet resultSet = preparedStatement.executeQuery();
	        while (resultSet.next()) {
	            Empleado empleado = new Empleado(
	                resultSet.getString("dni"),
	                resultSet.getString("nombre"),
	                resultSet.getString("sexo"),
	                resultSet.getString("categoria"),
	                resultSet.getInt("anos_trabajados")
	            );
	            empleados.add(empleado);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return empleados;
	}
	
	public List<Empleado> obtenerTodosEmpleados() {
	    return listarEmpleados(); // O puedes copiar la lógica directamente aquí
	}


}
