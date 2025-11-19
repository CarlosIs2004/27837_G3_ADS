package ec.edu.espe.datos.model;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
@Table(name = "Estudiante")
public class Estudiante {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_estudiante")
    private Integer idEstudiante;

    @Column(name ="nombre")
    private String nombre;

    @Column(name = "edad")
    private Integer edad;
}
