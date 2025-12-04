package ec.edu.espe.logica_negocio;

import ec.edu.espe.datos.repository.EstudianteRepository;
import ec.edu.espe.datos.model.Estudiante;

import java.util.List;

public class EstudianteService implements IEstudianteService {

    private final EstudianteRepository repository;

    // Inyección de Dependencias
    public EstudianteService(EstudianteRepository repository) {
        this.repository = repository;
    }

    @Override
    public void guardar(String id, String nombres, int edad) throws IllegalArgumentException {

        if (nombres == null || nombres.trim().isEmpty()) {
            throw new IllegalArgumentException("El campo 'Nombres' no puede estar vacío.");
        }
        if (id == null || id.trim().isEmpty()) {
            throw new IllegalArgumentException("El ID no puede estar vacío.");
        }
        if (edad <= 0) {
            throw new IllegalArgumentException("La edad debe ser mayor que 0.");
        }

        // Validación O(1) de Duplicados
        if (repository.buscarPorId(id).isPresent()) {
            throw new IllegalArgumentException("El ID '" + id + "' ya existe y no puede ser duplicado."); 
        }

        repository.agregar(new Estudiante(id, nombres, edad));
    }

    @Override
    public void editar(String id, String nombres, int edad) throws IllegalArgumentException {
        if (nombres == null || nombres.trim().isEmpty()) {
            throw new IllegalArgumentException("El campo 'Nombres' no puede estar vacío.");
        }
        if (id == null || id.trim().isEmpty()) {
             throw new IllegalArgumentException("El ID no puede estar vacío.");
        }
        if (edad <= 0) {
             throw new IllegalArgumentException("La Edad debe ser un número válido mayor a cero.");
        }
        
        // Se valida que el ID exista antes de editar
        if (repository.buscarPorId(id).isEmpty()) {
            throw new IllegalArgumentException("El estudiante con ID '" + id + "' no existe para editar.");
        }
        
        repository.editar(new Estudiante(id, nombres, edad));
    }

    @Override
    public void eliminar(String id) {
        repository.eliminar(id);
    }

    @Override
    public List<Estudiante> listar() {
        return repository.listar();
    }
}