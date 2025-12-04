package ec.edu.espe.logica_negocio;

import ec.edu.espe.datos.model.Estudiante;
import java.util.List;

/**
 *
 * @author David
 */
public interface IEstudianteService {
    void guardar(String id, String nombres, int edad);
    void editar(String id, String nombres, int edad);
    void eliminar(String id);
    List<Estudiante> listar();
}
