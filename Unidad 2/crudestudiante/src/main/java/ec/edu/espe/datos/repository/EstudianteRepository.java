package ec.edu.espe.datos.repository;

import ec.edu.espe.datos.model.Estudiante;
import io.quarkus.hibernate.orm.panache.PanacheRepositoryBase;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.transaction.Transactional;

@ApplicationScoped
@Transactional // Interactua con la base de datos
public class EstudianteRepository implements PanacheRepositoryBase<Estudiante,Integer>{
}
