package br.com.biblioteca.services;

import br.com.biblioteca.entities.Membro;
import br.com.biblioteca.repositories.MembroRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class MembroService {

  @Autowired
  private MembroRepository membroRepository;

  public List<Membro> findAll() {
    return membroRepository.findAll();
  }

  public Optional<Membro> findById(Long id) {
    return membroRepository.findById(id);
  }

  public Membro save(Membro membro) {
    return membroRepository.save(membro);
  }

  public void delete(Long id) {
    membroRepository.deleteById(id);
  }
}
