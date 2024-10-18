package empresa.models;

import java.util.Date;

public class Nomina {
    private int id;
    private int empleadoId;
    private double salario;
    private Date fechaPago;

    public Nomina(int id, int empleadoId, double salario, Date fechaPago) {
        this.id = id;
        this.empleadoId = empleadoId;
        this.salario = salario;
        this.fechaPago = fechaPago;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getEmpleadoId() {
        return empleadoId;
    }

    public void setEmpleadoId(int empleadoId) {
        this.empleadoId = empleadoId;
    }

    public double getSalario() {
        return salario;
    }

    public void setSalario(double salario) {
        this.salario = salario;
    }

    public Date getFechaPago() {
        return fechaPago;
    }

    public void setFechaPago(Date fechaPago) {
        this.fechaPago = fechaPago;
    }
}
