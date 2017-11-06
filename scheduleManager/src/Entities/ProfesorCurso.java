package Entities;

public class ProfesorCurso {
    private String id;
    private String cedula;

    public ProfesorCurso(String id, String cedula) {
        this.id = id;
        this.cedula = cedula;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getId() {
        return id;
    }

    public void setCedula(String cedula) {
        this.cedula = cedula;
    }

    public String getCedula() {
        return cedula;
    }
    
}
