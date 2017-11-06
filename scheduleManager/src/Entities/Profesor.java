package Entities;

public class Profesor {
    private String cedula;
    private String nombre;

    public Profesor(String cedula, String nombre) {
        this.cedula = cedula;
        this.nombre = nombre;
    }

    public void setCedula(String cedula) {
        this.cedula = cedula;
    }

    public String getCedula() {
        return cedula;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getNombre() {
        return nombre;
    }
    
    
}
