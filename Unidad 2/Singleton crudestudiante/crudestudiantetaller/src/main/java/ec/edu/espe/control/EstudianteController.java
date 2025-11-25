package ec.edu.espe.control;
import java.util.List;

import ec.edu.espe.datos.model.Estudiante;
import ec.edu.espe.logica_negocio.EstudianteService;

public class EstudianteController {
    private final EstudianteService service;

    public EstudianteController() {
        this.service = new EstudianteService();

    }

    public void registrarEstudiante(String idTexto, String nombre, String edadTexto) throws Exception {
        String[] datosParaConvertir = { idTexto, edadTexto };
        int[] resultados = parsearTextos(datosParaConvertir);
        int id = resultados[0];
        int edad= resultados[1];
        service.guardar(id, nombre, edad);
    }

    public List<Estudiante> obtenerEstudiantes() {
        return service.listar();
    }

    public void editarEstudiante(String idTexto, String nombre, String edadTexto) throws Exception {
        String[] datosParaConvertir = { idTexto, edadTexto };
        int[] resultados = parsearTextos(datosParaConvertir);
        int id = resultados[0];
        int edad= resultados[1];
        service.editar(id, nombre, edad);
    }

    public void eliminarEstudiante(String idTexto) throws Exception {
        String[] datosParaConvertir = { idTexto};
        int[] resultados = parsearTextos(datosParaConvertir);
        int id = resultados[0];
        service.eliminar(id);
    }

    private int[] parsearTextos(String[] listaTextos) throws Exception {

        int[] conversiones = new int[listaTextos.length];
        for (int i = 0; listaTextos.length > i; i++) {
            try {
                conversiones[i] = Integer.parseInt(listaTextos[i]);
            } catch (NumberFormatException e) {
                throw new Exception("El dato ingresado no es un numero");
            }
        }
        return conversiones;
    }

}
