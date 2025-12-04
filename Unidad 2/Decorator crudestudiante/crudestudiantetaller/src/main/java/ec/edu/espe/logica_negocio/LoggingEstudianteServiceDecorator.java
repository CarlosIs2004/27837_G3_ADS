package ec.edu.espe.logica_negocio;

import ec.edu.espe.datos.model.Estudiante;
import java.util.List;

public class LoggingEstudianteServiceDecorator implements IEstudianteService {

    private final IEstudianteService wrappedService;

    // El Decorador recibe y envuelve el servicio original
    public LoggingEstudianteServiceDecorator(IEstudianteService serviceToWrap) {
        this.wrappedService = serviceToWrap;
    }

    @Override
    public void guardar(String id, String nombres, int edad) {
        System.out.println(">>> LOG DE AUDITORIA: Iniciando operacion GUARDAR para ID: " + id); 
        wrappedService.guardar(id, nombres, edad); 
        System.out.println("<<< LOG DE AUDITORIA: Guardado de ID " + id + " completado con Exito.");
    }

    @Override
    public void editar(String id, String nombres, int edad) {
        System.out.println(">>> LOG DE AUDITORIA: Iniciando operaciOn EDITAR para ID: " + id);
        wrappedService.editar(id, nombres, edad);
        System.out.println("<<< LOG DE AUDITORIA: Edicion de ID " + id + " finalizada.");
    }

    @Override
    public void eliminar(String id) {
        System.out.println(">>> LOG DE AUDITORIA: Solicitud de ELIMINAR para ID: " + id);
        wrappedService.eliminar(id);
        System.out.println("<<< LOG DE AUDITORIA: Eliminacion de ID " + id + " finalizada.");
    }
    
    @Override
    public List<Estudiante> listar() {
        return wrappedService.listar(); 
    }
}