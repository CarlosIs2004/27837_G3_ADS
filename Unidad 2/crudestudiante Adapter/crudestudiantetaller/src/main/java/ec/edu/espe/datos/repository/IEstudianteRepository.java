package ec.edu.espe.datos.repository;

import java.util.List;

import ec.edu.espe.datos.model.Estudiante;

public interface IEstudianteRepository {
    void agregar(Estudiante e);
    void editar(Estudiante e);
    void eliminar(int id);
    List<Estudiante> listar();
}
