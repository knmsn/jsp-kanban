package br.com.biblioteca.controllers;

import br.com.biblioteca.entities.Projeto;
import br.com.biblioteca.services.ProjetoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/projetos")
public class ProjetoController {

  @Autowired
  private ProjetoService projetoService;

  @GetMapping
  public List<Projeto> getAllProjetos() {
    return projetoService.findAll();
  }

  @GetMapping("/{id}")
  public ResponseEntity<Projeto> getProjetoById(@PathVariable Long id) {
    Optional<Projeto> projeto = projetoService.findById(id);
    return projeto.map(ResponseEntity::ok)
        .orElseGet(() -> ResponseEntity.status(HttpStatus.NOT_FOUND).build());
  }

  @PostMapping
  public ResponseEntity<Projeto> createProjeto(@RequestBody Projeto projeto) {
    Projeto createdProjeto = projetoService.save(projeto);
    return ResponseEntity.status(HttpStatus.CREATED).body(createdProjeto);
  }

  @PutMapping("/{id}")
  public ResponseEntity<Projeto> updateProjeto(@PathVariable Long id, @RequestBody Projeto projeto) {
    projeto.setId(id);
    Projeto updatedProjeto = projetoService.save(projeto);
    return ResponseEntity.ok(updatedProjeto);
  }

  @DeleteMapping("/{id}")
  public ResponseEntity<Void> deleteProjeto(@PathVariable Long id) {
    projetoService.delete(id);
    return ResponseEntity.noContent().build();
  }
}
