package br.biblioteca.services;

import br.com.biblioteca.entities.Pessoa;
import br.com.biblioteca.entities.Projeto;
import br.com.biblioteca.enums.StatusProjeto;
import br.com.biblioteca.repositories.ProjetoRepository;
import br.com.biblioteca.services.ProjetoService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.time.LocalDate;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

class ProjetoServiceTest {

  private ProjetoRepository projetoRepository;
  private ProjetoService projetoService;

  @BeforeEach
  void setUp() {
    projetoRepository = mock(ProjetoRepository.class);
    projetoService = new ProjetoService();
    projetoService.projetoRepository = projetoRepository;
  }

  @Test
  void testSave() {
    Pessoa gerente = new Pessoa();
    gerente.setId(1L);
    gerente.setNome("Nome do Gerente");

    Projeto projeto = new Projeto(
        1L,
        "Projeto 1",
        LocalDate.now(),
        LocalDate.now().plusDays(30),
        null,
        "Descrição do projeto",
        StatusProjeto.EM_ANDAMENTO,
        1000.00f,
        "Risco baixo",
        gerente,
        null
    );

    when(projetoRepository.save(projeto)).thenReturn(projeto);

    Projeto result = projetoService.save(projeto);

    assertEquals(projeto, result);
    verify(projetoRepository).save(projeto);
  }
}
