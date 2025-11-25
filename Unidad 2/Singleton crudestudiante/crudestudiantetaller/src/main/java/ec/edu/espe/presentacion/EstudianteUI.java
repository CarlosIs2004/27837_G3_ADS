package ec.edu.espe.presentacion;

import ec.edu.espe.control.EstudianteController;
import ec.edu.espe.datos.model.Estudiante;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;

public class EstudianteUI extends JFrame {

    private EstudianteController controller = new EstudianteController();

    private JTextField txtId;
    private JTextField txtNombres;
    private JTextField txtEdad;
    private JTable table;

    public EstudianteUI() {
        setTitle("CRUD Estudiantes - NVC");
        setSize(550, 400);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);
        initComponents();
    }

    private void initComponents() {
        JLabel lblId = new JLabel("ID:");
        JLabel lblNombres = new JLabel("Nombres:");
        JLabel lblEdad = new JLabel("Edad:");

        txtId = new JTextField();
        txtNombres = new JTextField();
        txtEdad = new JTextField();

        JButton btnGuardar = new JButton("Guardar");
        JButton btnEditar = new JButton("Editar");
        JButton btnEliminar = new JButton("Eliminar");

        btnGuardar.addActionListener(e -> guardar());
        btnEditar.addActionListener(e -> editar());
        btnEliminar.addActionListener(e -> eliminar());

        table = new JTable();
        table.setModel(new DefaultTableModel(new Object[]{"ID", "Nombres", "Edad"}, 0));

        JScrollPane scroll = new JScrollPane(table);

        setLayout(null);

        lblId.setBounds(20, 20, 100, 30);
        txtId.setBounds(120, 20, 150, 30);

        lblNombres.setBounds(20, 60, 100, 30);
        txtNombres.setBounds(120, 60, 150, 30);

        lblEdad.setBounds(20, 100, 100, 30);
        txtEdad.setBounds(120, 100, 150, 30);

        btnGuardar.setBounds(300, 20, 100, 30);
        btnEditar.setBounds(300, 60, 100, 30);
        btnEliminar.setBounds(300, 100, 100, 30);

        scroll.setBounds(20, 150, 500, 180);

        add(lblId); add(txtId);
        add(lblNombres); add(txtNombres);
        add(lblEdad); add(txtEdad);
        add(btnGuardar); add(btnEditar); add(btnEliminar);
        add(scroll);
    }

    private void guardar() {
        try {
            controller.registrarEstudiante(txtId.getText(), txtNombres.getText(), txtEdad.getText());
            llenarTabla();
            limpiarCampos();
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(this, ex.getMessage());
        }
    }

    private void editar() {
        try {
            controller.editarEstudiante(txtId.getText(), txtNombres.getText(), txtEdad.getText());
            llenarTabla();
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(this, ex.getMessage());
        }
    }

    private void eliminar() {
        try {
            controller.eliminarEstudiante(txtId.getText());;
            llenarTabla();
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(this, ex.getMessage());
        }
    }
    private void limpiarCampos() {
        txtId.setText("");
        txtNombres.setText("");
        txtEdad.setText("");
        txtId.requestFocus(); 
    }

    private void llenarTabla() {
        DefaultTableModel model = (DefaultTableModel) table.getModel();
        model.setRowCount(0);

        for (Estudiante e : controller.obtenerEstudiantes()) {
            model.addRow(new Object[]{e.getId(), e.getNombres(), e.getEdad()});
        }
    }
}
