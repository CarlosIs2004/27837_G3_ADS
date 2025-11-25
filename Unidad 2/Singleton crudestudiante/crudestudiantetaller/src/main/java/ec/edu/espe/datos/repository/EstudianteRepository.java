package ec.edu.espe.datos.repository;

import ec.edu.espe.datos.model.Estudiante;

import java.util.ArrayList;
import java.util.List;
// Repository para gestionar operaciones CRUD de Estudiante aplicado Singleton
public class EstudianteRepository {
    // VAriable estática privada
    private static EstudianteRepository instance;
    private List<Estudiante> estudiantes;

    private EstudianteRepository(){
        estudiantes = new ArrayList<>();
        System.out.println("--> Se ha creado el Repositorio (Singleton) <--");
    }

    public static EstudianteRepository getInstance(){
        if(instance == null){
            instance = new EstudianteRepository();
        }
        return instance;
    }
// Métodos crud
    public void agregar(Estudiante e) {
        estudiantes.add(e);
    }

    public void editar(Estudiante e) {
        for (int i = 0; i < estudiantes.size(); i++) {
            if (estudiantes.get(i).getId() == e.getId()) {
                estudiantes.set(i, e);
                return;
            }
        }
    }

    public void eliminar(int id) {
        estudiantes.removeIf(e -> e.getId() == id);
    }

    public List<Estudiante> listar() {
        return estudiantes;
    }
}
