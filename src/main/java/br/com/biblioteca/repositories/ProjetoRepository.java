package br.com.biblioteca.repositories;

import br.com.biblioteca.entities.Projeto;
import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.JpaRepository;

@Repository
public interface ProjetoRepository extends JpaRepository<Projeto, Long> {
}
