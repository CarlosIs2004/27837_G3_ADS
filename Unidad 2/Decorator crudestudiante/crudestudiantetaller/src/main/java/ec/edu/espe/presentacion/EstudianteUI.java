package ec.edu.espe.presentacion;

import ec.edu.espe.logica_negocio.IEstudianteService;
import ec.edu.espe.datos.model.Estudiante;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;

// La UI depende de la Interfaz, no del Servicio concreto
public class EstudianteUI extends JFrame {

    private final IEstudianteService service; 

    private JTextField txtId;
    private JTextField txtNombres;
    private JTextField txtEdad;
    private JTable table;

    public EstudianteUI(IEstudianteService service) {
        this.service = service;
        setTitle("CRUD Estudiantes - 3 Capas (Decorator)");
        setSize(550, 400);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);
        initComponents();
        llenarTabla();
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
        String idTexto = txtId.getText();
        String nombres = txtNombres.getText();
        String edadTexto = txtEdad.getText();
        
        try {
            int edad = Integer.parseInt(edadTexto);
            service.guardar(idTexto, nombres, edad); 
            llenarTabla();
        } catch (NumberFormatException e) {
            JOptionPane.showMessageDialog(this, "La Edad debe ser un número entero.", "Error de Formato", JOptionPane.ERROR_MESSAGE);
        } catch (IllegalArgumentException ex) {
            JOptionPane.showMessageDialog(this, ex.getMessage(), "Error de Validación", JOptionPane.ERROR_MESSAGE);
        }
    }

    private void editar() {
        String idTexto = txtId.getText();
        String nombres = txtNombres.getText();
        String edadTexto = txtEdad.getText();
        
        try {
            int edad = Integer.parseInt(edadTexto);
            service.editar(idTexto, nombres, edad);
            llenarTabla();
        } catch (NumberFormatException e) {
            JOptionPane.showMessageDialog(this, "La Edad debe ser un número entero.", "Error de Formato", JOptionPane.ERROR_MESSAGE);
        } catch (IllegalArgumentException ex) {
            JOptionPane.showMessageDialog(this, ex.getMessage(), "Error de Validación", JOptionPane.ERROR_MESSAGE);
        }
    }

    private void eliminar() {
        String idTexto = txtId.getText();
        service.eliminar(idTexto);
        llenarTabla();
    }

    private void llenarTabla() {
        DefaultTableModel model = (DefaultTableModel) table.getModel();
        model.setRowCount(0);

        for (Estudiante e : service.listar()) {
            model.addRow(new Object[]{e.getId(), e.getNombres(), e.getEdad()});
        }
    }
}