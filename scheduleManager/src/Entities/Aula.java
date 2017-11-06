package Entities;

public class Aula {
    private int numero;
    private String nombre;
    private int capacidad;

    public Aula(int numero, String nombre, int capacidad) {
        this.numero = numero;
        this.nombre = nombre;
        this.capacidad = capacidad;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public int getNumero() {
        return numero;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getNombre() {
        return nombre;
    }

    public void setCapacidad(int capacidad) {
        this.capacidad = capacidad;
    }

    public int getCapacidad() {
        return capacidad;
    }
    
}
