package ec.edu.espe.datos.repository;

import ec.edu.espe.datos.model.Estudiante;

import java.util.ArrayList;
import java.util.List;

public class EstudianteRepository {

    private final List<Estudiante> estudiantes = new ArrayList<>();

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
