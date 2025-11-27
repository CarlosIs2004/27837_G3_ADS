package ec.edu.espe.presentacion;

import ec.edu.espe.datos.repository.EstudianteRepository;
import ec.edu.espe.logica_negocio.EstudianteService;
import ec.edu.espe.logica_negocio.IEstudianteService;
import ec.edu.espe.logica_negocio.LoggingEstudianteServiceDecorator;
import javax.swing.*;

public class Main {

    public static void main(String[] args) {
        
        // 1. Crear las dependencias de la capa más baja (Repository)
        EstudianteRepository repository = new EstudianteRepository();
        
        // 2. Crear el Servicio Core (Componente)
        EstudianteService coreService = new EstudianteService(repository);
        
        // 3. Crear el Decorador, inyectándole el Servicio Core
        IEstudianteService decoratedService = new LoggingEstudianteServiceDecorator(coreService);
        
        // 4. Inyectar el Servicio DECORADO en la UI (la UI solo ve la interfaz IEstudianteService)
        EstudianteUI ui = new EstudianteUI(decoratedService); 

        SwingUtilities.invokeLater(() -> {
             ui.setVisible(true);
        });
    }
}