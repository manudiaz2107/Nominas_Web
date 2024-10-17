package empresa.models;

public class Empleado {
	private String dni;
	private String nombre;
	private String sexo;
	private String categoria;
	private int anosTrabajados;

	public Empleado(String dni, String nombre, String sexo, String categoria, int anosTrabajados) {
		this.dni = dni;
		this.nombre = nombre;
		this.sexo = sexo;
		this.categoria = categoria;
		this.anosTrabajados = anosTrabajados;
	}

	// Getters y setters
	public String getDni() {
		return dni;
	}

	public String getNombre() {
		return nombre;
	}

	public String getSexo() {
		return sexo;
	}

	public String getCategoria() {
		return categoria;
	}

	public int getAnosTrabajados() {
		return anosTrabajados;
	}
}
