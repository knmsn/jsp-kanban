package br.com.biblioteca.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import javax.persistence.GenerationType;
import java.time.LocalDate;
import java.util.List;

@Entity
@Table(name = "pessoa")
@Data
@AllArgsConstructor
@NoArgsConstructor
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
  @JsonIgnore
  private List<Projeto> projetosGerenciados;
}
