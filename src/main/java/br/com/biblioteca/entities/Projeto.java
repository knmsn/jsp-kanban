package br.com.biblioteca.entities;

import br.com.biblioteca.enums.StatusProjeto;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import javax.persistence.*;
import java.time.LocalDate;
import java.util.List;

@Entity
@Table(name = "projeto")
@Data
public class Projeto {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  @Column(nullable = false, length = 200)
  private String nome;

  @Column(name = "data_inicio")
  private LocalDate dataInicio;

  @Column(name = "data_previsao_fim")
  private LocalDate dataPrevisaoFim;

  @Column(name = "data_fim")
  private LocalDate dataFim;

  @Column(length = 5000)
  private String descricao;

  @Enumerated(EnumType.STRING)
  @Column(length = 45)
  private StatusProjeto status;

  @Column
  private Float orcamento;

  @Column(length = 45)
  private String risco;

  @ManyToOne
  @JoinColumn(name = "idgerente", nullable = false)
  private Pessoa gerente;

  @OneToMany(mappedBy = "projeto")
  @JsonIgnore
  private List<Membro> membros;
}
