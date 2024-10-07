package br.com.biblioteca.services;

import br.com.biblioteca.entities.Projeto;
import br.com.biblioteca.enums.StatusProjeto;
import br.com.biblioteca.repositories.ProjetoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ProjetoService {

  @Autowired
  public ProjetoRepository projetoRepository;

  public List<Projeto> findAll() {
    return projetoRepository.findAll();
  }

  public Optional<Projeto> findById(Long id) {
    return projetoRepository.findById(id);
  }

  public Projeto save(Projeto projeto) {
    return projetoRepository.save(projeto);
  }

  public void delete(Long id) {
    Projeto projeto = projetoRepository.findById(id)
        .orElseThrow(() -> new IllegalArgumentException("Projeto não encontrado com o ID: " + id));

    if (projeto.getStatus() == StatusProjeto.INICIADO ||
        projeto.getStatus() == StatusProjeto.EM_ANDAMENTO ||
        projeto.getStatus() == StatusProjeto.ENCERRADO) {
      throw new IllegalStateException("Não é possível excluir um projeto com status: " + projeto.getStatus());
    }
    projetoRepository.deleteById(id);
  }
}
