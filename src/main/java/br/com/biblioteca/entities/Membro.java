package br.com.biblioteca.entities;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import javax.persistence.GenerationType;

@Entity
@Table(name = "membros")
@Data
@AllArgsConstructor
@NoArgsConstructor
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
