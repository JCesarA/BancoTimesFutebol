package code.com.desafio.appJulioSilva.model.repository;

import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import code.com.desafio.appJulioSilva.model.domain.Usuario;

@Repository
public interface UsuarioRepository extends CrudRepository<Usuario, Integer>{
	public List<Usuario> findAll(Sort sort);
}