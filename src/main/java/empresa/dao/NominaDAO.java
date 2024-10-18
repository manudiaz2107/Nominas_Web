package empresa.dao;

import com.empresa.database.DatabaseConnection;
import empresa.models.Nomina;

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

    public double calcularNuevoSalario(String categoria, int anosTrabajados) {
        double salarioBase = obtenerSalarioBasePorCategoria(categoria); // Obtener el salario base según la categoría
        double incremento = anosTrabajados * 100; // Ejemplo: sumar 100 euros por cada año trabajado
        return salarioBase + incremento;
    }

    public void actualizarSalario(String dni, double nuevoSalario) {
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(
                 "UPDATE nominas SET salario = ? WHERE empleado_id = (SELECT id FROM empleados WHERE dni = ?)")) {
            preparedStatement.setDouble(1, nuevoSalario);
            preparedStatement.setString(2, dni);

            // Imprimir el salario y el DNI antes de la ejecución
            System.out.println("Actualizando salario a: " + nuevoSalario + " para DNI: " + dni);
            
            int rowsAffected = preparedStatement.executeUpdate();
            System.out.println("Filas Afectadas: " + rowsAffected); // Debería ser 1 si se actualizó correctamente
        } catch (SQLException e) {
            e.printStackTrace(); // Imprimir error si ocurre
        }
    }


    private double obtenerSalarioBasePorCategoria(String categoria) {
        // Lógica para obtener el salario base según la categoría
        // Esto puede venir de una tabla de categorías, por ejemplo
        double salarioBase = 1000; // Valor de ejemplo
        switch (categoria) {
            case "A":
                salarioBase = 1200;
                break;
            case "B":
                salarioBase = 1500;
                break;
            case "C":
                salarioBase = 1800;
                break;
            default:
                salarioBase = 1000;
        }
        return salarioBase;
    }
}
