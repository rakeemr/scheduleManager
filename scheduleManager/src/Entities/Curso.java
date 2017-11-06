package Entities;

public class Curso {
    private String id;
    private String nombre;
    private char tipoAula;
    private int creditos;
    private int semestre;

    public Curso(String id, String nombre, char tipoAula, int creditos, int semestre) {
        this.id = id;
        this.nombre = nombre;
        this.tipoAula = tipoAula;
        this.creditos = creditos;
        this.semestre = semestre;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public char getTipoAula() {
        return tipoAula;
    }

    public void setTipoAula(char tipoAula) {
        this.tipoAula = tipoAula;
    }

    public int getCreditos() {
        return creditos;
    }

    public void setCreditos(int creditos) {
        this.creditos = creditos;
    }

    public int getSemestre() {
        return semestre;
    }

    public void setSemestre(int semestre) {
        this.semestre = semestre;
    }
    
}
