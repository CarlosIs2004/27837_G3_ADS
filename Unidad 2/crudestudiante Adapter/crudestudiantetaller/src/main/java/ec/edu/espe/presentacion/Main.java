package ec.edu.espe.presentacion;

import javax.swing.*;

import ec.edu.espe.datos.repository.EstudianteRepository;
import ec.edu.espe.datos.repository.IEstudianteRepository;
import ec.edu.espe.logica_negocio.EstudianteService;

public class Main {

    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> {
            IEstudianteRepository repositorio = new EstudianteRepository();
            EstudianteService service = new EstudianteService(repositorio);
            new EstudianteUI(service).setVisible(true);
        });
    }
}
