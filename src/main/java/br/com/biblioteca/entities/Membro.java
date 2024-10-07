package br.com.biblioteca.entities;

import lombok.Data;
import javax.persistence.*;
import javax.persistence.GenerationType;
import java.time.LocalDate;
import java.util.List;

@Entity
@Table(name = "membros")
@Data
public class Membro {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  @ManyToOne
  @JoinColumn(name = "idprojeto", nullable = false)
  private Projeto projeto;

  @ManyToOne
  @JoinColumn(name = "idpessoa", nullable = false)
  private Pessoa pessoa;

  @Column(length = 100)
  private String papel;
}
