package Entities;

public class HorarioDisponible {
    private String cedula;
    private String dia;

    public HorarioDisponible(String cedula, String dia) {
        this.cedula = cedula;
        this.dia = dia;
    }

    public void setCedula(String cedula) {
        this.cedula = cedula;
    }

    public String getCedula() {
        return cedula;
    }

    public void setDia(String dia) {
        this.dia = dia;
    }

    public String getDia() {
        return dia;
    }
    
}
