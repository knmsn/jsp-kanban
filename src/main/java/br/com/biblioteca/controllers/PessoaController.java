package br.com.biblioteca.controllers;

import br.com.biblioteca.entities.Pessoa;
import br.com.biblioteca.services.PessoaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/pessoas")
public class PessoaController {

  @Autowired
  private PessoaService pessoaService;

  @GetMapping
  public List<Pessoa> getAllPessoas() {
    return pessoaService.findAll();
  }

  @GetMapping("/{id}")
  public ResponseEntity<Pessoa> getPessoaById(@PathVariable Long id) {
    Optional<Pessoa> pessoa = pessoaService.findById(id);
    return pessoa.map(ResponseEntity::ok)
        .orElseGet(() -> ResponseEntity.status(HttpStatus.NOT_FOUND).build());
  }

  @PostMapping
  public ResponseEntity<Pessoa> createPessoa(@RequestBody Pessoa pessoa) {
    if (pessoa.getNome() == null || pessoa.getNome().isEmpty()) {
      return ResponseEntity.badRequest().build();
    }
    Pessoa createdPessoa = pessoaService.save(pessoa);
    return ResponseEntity.status(HttpStatus.CREATED).body(createdPessoa);
  }

  @PutMapping("/{id}")
  public ResponseEntity<Pessoa> updatePessoa(@PathVariable Long id, @RequestBody Pessoa pessoa) {
    pessoa.setId(id);
    Pessoa updatedPessoa = pessoaService.save(pessoa);
    return ResponseEntity.ok(updatedPessoa);
  }

  @DeleteMapping("/{id}")
  public ResponseEntity<Void> deletePessoa(@PathVariable Long id) {
    try {
      pessoaService.delete(id);
      return ResponseEntity.noContent().build();
    } catch (IllegalArgumentException e) {
      return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
    }
  }
}

