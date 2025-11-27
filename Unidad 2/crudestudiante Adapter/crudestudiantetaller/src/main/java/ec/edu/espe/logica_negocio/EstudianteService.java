package ec.edu.espe.logica_negocio;


import ec.edu.espe.datos.repository.IEstudianteRepository;
import ec.edu.espe.datos.model.Estudiante;

import java.util.List;

public class EstudianteService {

    private IEstudianteRepository repository; // Usas la Interfaz

    public EstudianteService(IEstudianteRepository repo) { // Pides la Interfaz
        this.repository = repo;
    }
    public void guardar(int id, String nombres, int edad) throws Exception {

        if (edad <= 0)
            throw new Exception("La edad debe ser mayor que 0");

        for (Estudiante e : repository.listar()) {
            if (e.getId() == id)
                throw new Exception("El ID ya existe");
        }

        repository.agregar(new Estudiante(id, nombres, edad));
    }

    public void editar(int id, String nombres, int edad) throws Exception {

        if (edad <= 0)
            throw new Exception("La edad debe ser mayor que 0");

        repository.editar(new Estudiante(id, nombres, edad));
    }

    public void eliminar(int id) {
        repository.eliminar(id);
    }

    public List<Estudiante> listar() {
        return repository.listar();
    }
}
