package code.com.desafio.appJulioSilva.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import code.com.desafio.appJulioSilva.model.domain.Usuario;
import code.com.desafio.appJulioSilva.model.repository.UsuarioRepository;

@Service
public class UsuarioService {
	
	@Autowired
	private UsuarioRepository usuarioRepository;
	
	// MÉTODO para obter a lista de usuários e fazer ordenação
	public List<Usuario> obterLista(String campo){			
		return (List<Usuario>) usuarioRepository.findAll(Sort.by(Sort.Direction.ASC, campo));
	}			

	// MÉTODO para retornar o email do usuario por meio da Id
	public List<Usuario> obterLista(){			
		return (List<Usuario>) usuarioRepository.findAll(Sort.by(Sort.Direction.ASC, "nomeUsuario"));
	}
	
	// MÉTODO para incluir usuário
	public void incluirUsuario(Usuario usuario) {		
		usuarioRepository.save(usuario);				
	}			
	
	// MÉTODO para excluir
	public void excluir(Integer id) {		
		usuarioRepository.deleteById(id);				
	}
	
	// MÉTODO para retornar o nome do usuário por meio da Id
	public Usuario obterPorId(Integer id) {		
		return usuarioRepository.findById(id).orElse(null);		
	}		
}