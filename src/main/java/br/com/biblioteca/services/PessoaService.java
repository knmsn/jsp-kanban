package br.com.biblioteca.services;


import br.com.biblioteca.entities.Pessoa;
import br.com.biblioteca.repositories.PessoaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class PessoaService {

  @Autowired
  private PessoaRepository pessoaRepository;

  public List<Pessoa> findAll() {
    return pessoaRepository.findAll();
  }

  public Optional<Pessoa> findById(Long id) {
    return pessoaRepository.findById(id);
  }

  public Pessoa save(Pessoa pessoa) {
    return pessoaRepository.save(pessoa);
  }

  public void delete(Long id) {
    pessoaRepository.deleteById(id);
  }
}
