package ec.edu.espe.datos.repository;

import ec.edu.espe.datos.model.Estudiante;
import java.util.ArrayList;
import java.util.List;

// CAMBIO CLAVE: "implements IEstudianteRepository"
public class EstudianteRepository implements IEstudianteRepository {

    private final List<Estudiante> estudiantes = new ArrayList<>();

    @Override
    public void agregar(Estudiante e) {
        estudiantes.add(e);
    }

    @Override
    public void editar(Estudiante e) {
        for (int i = 0; i < estudiantes.size(); i++) {
            if (estudiantes.get(i).getId() == e.getId()) {
                estudiantes.set(i, e);
                return;
            }
        }
    }

    @Override
    public void eliminar(int id) {
        estudiantes.removeIf(e -> e.getId() == id);
    }

    @Override
    public List<Estudiante> listar() {
        return estudiantes;
    }
}