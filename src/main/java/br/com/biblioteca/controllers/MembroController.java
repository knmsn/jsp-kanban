package br.com.biblioteca.controllers;

import br.com.biblioteca.entities.Membro;
import br.com.biblioteca.services.MembroService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/membros")
public class MembroController {

  @Autowired
  private MembroService membroService;

  @GetMapping
  public List<Membro> getAllMembros() {
    return membroService.findAll();
  }

  @GetMapping("/{id}")
  public ResponseEntity<Membro> getMembroById(@PathVariable Long id) {
    Optional<Membro> membro = membroService.findById(id);
    return membro.map(ResponseEntity::ok)
        .orElseGet(() -> ResponseEntity.status(HttpStatus.NOT_FOUND).build());
  }

  @PostMapping
  public ResponseEntity<Membro> createMembro(@RequestBody Membro membro) {
    if (membro.getPapel() == null || membro.getPapel().isEmpty()) {
      return ResponseEntity.badRequest().build();
    }
    Membro createdMembro = membroService.save(membro);
    return ResponseEntity.status(HttpStatus.CREATED).body(createdMembro);
  }

  @PutMapping("/{id}")
  public ResponseEntity<Membro> updateMembro(@PathVariable Long id, @RequestBody Membro membro) {
    membro.setId(id);
    Membro updatedMembro = membroService.save(membro);
    return ResponseEntity.ok(updatedMembro);
  }

  @DeleteMapping("/{id}")
  public ResponseEntity<Void> deleteMembro(@PathVariable Long id) {
    try {
      membroService.delete(id);
      return ResponseEntity.noContent().build();
    } catch (IllegalArgumentException e) {
      return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
    }
  }
}
