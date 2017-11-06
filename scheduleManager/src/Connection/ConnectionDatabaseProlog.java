package Connection;
import org.jpl7.Query;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import Entities.*;

public class ConnectionDatabaseProlog {
    public static Connection conn;
    public static ArrayList<Profesor> profesores = new ArrayList<>();
    public static ArrayList<Curso> cursos = new ArrayList<>();
    public static ArrayList<Aula> aulas  = new ArrayList<>();
    public static ArrayList<ProfesorCurso> profesCursos = new ArrayList<>();
    public static ArrayList<HorarioDisponible> horariosDisponibles = new ArrayList<>();
    public static String ordenSemestre;
    public static boolean estado;
    
    public static void postgresConnection()
    {
        try{
            conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/schedulemanagerdb",
                                                "postgres", "12345");
            executeQuery();
        }catch(SQLException e){ }
    }
    
    public static void executeQuery() throws SQLException
    {
        Statement st1 = conn.createStatement();
        
        ResultSet rs1 = st1.executeQuery(Queries.Profesor);
        while (rs1.next()) {
            Profesor profesor = new Profesor(
                rs1.getString("cedula"), 
                rs1.getString("nombre")
            );
            profesores.add(profesor);
        }
        
        ResultSet rs2 = st1.executeQuery(Queries.Aula);
        while (rs2.next()) {
            Aula aula = new Aula(
                Integer.parseInt(rs2.getString("numero")), 
                rs2.getString("nombre"), 
                Integer.parseInt(rs2.getString("capacidad"))
            );
            aulas.add(aula);
        }
        
        ResultSet rs3 = st1.executeQuery(Queries.Curso);
        while (rs3.next()) {
            Curso curso = new Curso(
                rs3.getString("id"), 
                rs3.getString("nombre"), 
                rs3.getString("tipoAula").charAt(0), 
                Integer.parseInt(rs3.getString("creditos")), 
                Integer.parseInt(rs3.getString("semestre"))
            );
            cursos.add(curso);
        }
                   
        ResultSet rs4 = st1.executeQuery(Queries.HorarioDisponible);
        while (rs4.next()) {
            HorarioDisponible horarioDisponible = new HorarioDisponible(
                rs4.getString("cedula"), 
                rs4.getString("dia")
            );
            horariosDisponibles.add(horarioDisponible);
        }        
        
        ResultSet rs5 = st1.executeQuery(Queries.ProfeCurso);
        while (rs5.next()) {
            ProfesorCurso profeCurso = new ProfesorCurso(
                rs5.getString("id"), 
                rs5.getString("cedula")
            );
            profesCursos.add(profeCurso);
        }
        conn.close();
    }
    
    public static void inssertToProlog(){
        try {
            String consulta = "consult('facts.pl')";
            Query q = new Query(consulta);
            System.out.println(consulta + " " + (q.hasSolution() ? "True" : "False"));
            
            profesores.stream().map((prof) -> new Query("assert(profesor(" +
                    prof.getCedula() + "," + prof.getNombre() + "))."
            )).forEach((query) -> { System.out.println(query.hasSolution()); });
            prologSaving("profesor", "append");

            cursos.stream().map((cur) -> new Query("assert(curso(" +
                        cur.getId() + "," + cur.getNombre() + "," + cur.getTipoAula() +
                        "," + cur.getCreditos() + "," + cur.getSemestre() + "))."
            )).forEach((query) -> { System.out.println(query.hasSolution()); });
            prologSaving("curso", "append");

            aulas.stream().map((a) -> new Query("assert(aula(" +
                    a.getNumero() + "," + a.getNombre() + "," + a.getCapacidad() + "))."
            )).forEach((query) -> { System.out.println(query.hasSolution()); });
            prologSaving("aula", "append");

            profesCursos.stream().map((pc) -> new Query("assert(profe_curso(" +
                    pc.getId() + "," + pc.getCedula() + "))."
            )).forEach((query) -> { System.out.println(query.hasSolution()); });
            prologSaving("profe_curso","append");

            horariosDisponibles.stream().map((hd) -> new Query("assert(horario_disponible(" +
                    hd.getCedula() + "," + hd.getDia() + "))."
            )).forEach((query) -> { System.out.println(query.hasSolution()); });
            prologSaving("horario_disponible","append");

        } catch (Exception e){ }
    }
    
    public static void prologSaving(String hecho, String estado){
        Query allAsserts = new Query(estado + "('facts.pl'),listing(" + hecho + "),told."); 
        System.out.println(allAsserts.hasSolution());
    }
}
