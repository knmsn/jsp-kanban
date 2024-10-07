package br.com.biblioteca.entities;

import lombok.Data;
import javax.persistence.*;
import javax.persistence.GenerationType;
import java.time.LocalDate;
import java.util.List;

@Entity
@Table(name = "pessoa")
@Data
public class Pessoa {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  @Column(nullable = false, length = 100)
  private String nome;

  @Column(name = "datanascimento")
  private LocalDate dataNascimento;

  @Column(length = 14)
  private String cpf;

  @Column
  private Boolean funcionario;

  @Column
  private Boolean gerente;

  @OneToMany(mappedBy = "gerente")
  private List<Projeto> projetosGerenciados;
}
