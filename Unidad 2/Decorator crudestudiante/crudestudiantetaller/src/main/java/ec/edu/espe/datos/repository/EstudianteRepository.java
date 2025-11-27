package ec.edu.espe.datos.repository;

import ec.edu.espe.datos.model.Estudiante;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

public class EstudianteRepository {

    private final Map<String, Estudiante> estudiantes = new HashMap<>();

    public void agregar(Estudiante e) {
        estudiantes.put(e.getId(), e);
    }

    public Optional<Estudiante> buscarPorId(String id) {
        return Optional.ofNullable(estudiantes.get(id));
    }
    
    public void editar(Estudiante e) {
        estudiantes.replace(e.getId(), e);
    }

    public void eliminar(String id) {
        estudiantes.remove(id);
    }

    public List<Estudiante> listar() {
        return new ArrayList<>(estudiantes.values());
    }
}