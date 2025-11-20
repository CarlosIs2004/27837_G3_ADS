package ec.edu.espe.presentacion;

import javax.swing.*;

public class Main {

    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> {
            new EstudianteUI().setVisible(true);
        });
    }
}
