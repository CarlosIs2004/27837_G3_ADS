package ec.edu.espe.logica_negocio;

import ec.edu.espe.datos.model.Estudiante;

import java.util.List;

public class EstudianteFacade {

    private final EstudianteService service = new EstudianteService();

    public void crear(int id, String nombres, int edad) throws Exception {
        service.guardar(id, nombres, edad);
    }

    public void actualizar(int id, String nombres, int edad) throws Exception {
        service.editar(id, nombres, edad);
    }

    public void borrar(int id) {
        service.eliminar(id);
    }

    public List<Estudiante> obtenerTodos() {
        return service.listar();
    }
}
