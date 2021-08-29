package code.com.desafio.appJulioSilva.controller;

import java.time.LocalTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import code.com.desafio.appJulioSilva.model.domain.Usuario;
import code.com.desafio.appJulioSilva.model.service.UsuarioService;

@Controller
public class UsuarioController {
	
	@Autowired
	private UsuarioService usuarioService;
	
	Usuario usuario = new Usuario();
	
	// MÉTODO para exibir a tela inicial
	@GetMapping(value = "/")
	public String telaInicial(Model model) {
		return "index";
	}	
	
	// MÉTODO para exibir a tela de lista de usuários
	@GetMapping(value = "/usuario/lista")
	public String telaUsuarioLista(Model model) {
		model.addAttribute("usuarios", usuarioService.obterLista());
		return "usuario/usuarioLista";
	}
	
	// MÉTODO para exibir a tela de login
	@GetMapping(value = "/login")
	public String telaLogin(Model model) {
		return "usuario/login";
	}
	
	// MÉTODO para exibir a tela de cadastro de usuário sem estar logado
	@PostMapping(value = "/cadastrarUsuario")
	public String telaCadastrarUsuario() {
		return "usuario/cadastrarUsuario";
	}

	// MÉTODO para exibir a tela de cadastro de usuário que já está logado
	@GetMapping(value = "/cadastrarUsuarioLista")
	public String telaCadastrarUsuario(Model model) {
		model.addAttribute("consultaUsuarioLista",usuario);			
		return "usuario/cadastrarUsuario";
	}
		
	// MÉTODO para fazer login do usuário
	@PostMapping(value = "/fazerLogin")
	public String obterLista(Model model, Usuario login) {
		List<Usuario> listaEmail = usuarioService.obterLista();		
		String emailRecebido=login.getEmail();
		String senhaRecebida=login.getSenha();		
		String emailBD = "";
		String senhaBD = "";	
		for (Usuario usuario : listaEmail) {
			emailBD  = usuario.getEmail();
			senhaBD = usuario.getSenha();	   
		    if (emailRecebido.equals(emailBD)) {		    					
		    	if (senhaRecebida.equals(senhaBD)) {				
					String saudacao=null;
					Integer hora;
					hora = LocalTime.now().getHour();
					if (hora < 6) {saudacao = "Boa madrugada!";}
					if (hora >= 6 && hora < 12) {saudacao = "Bom dia!";}
					if (hora >= 12 && hora < 18) {saudacao = "Boa tarde!";}
					if (hora >= 18) {saudacao = "Boa noite!";}					
					model.addAttribute("mensagem",saudacao + " Login efetuado com sucesso!");
					model.addAttribute("acesso","sim");
					usuario.setCadastro(true);
				    return telaInicial(model);							   
		    	}   				
			}
		}
		model.addAttribute("mensagem","ACESSO NEGADO! E-mail e/ou senha não conferem.");
		model.addAttribute("acesso","nao");
		usuario.setCadastro(false);
		return telaLogin(model);		
	}
  	
	// MÉTODO para INCLUIR usuário
    @PostMapping(value = "/incluirUsuario")  
	public String incluirUsuario(Model model, Usuario usuario) {
    	usuarioService.incluirUsuario(usuario);    	
    	model.addAttribute("mensagem",usuario.getEmail()+" foi cadastrado com sucesso! Agora você pode entrar com seu e-mail e senha.");
    	model.addAttribute("acesso","sim");
    	usuario.setCadastro(true);
    	return "usuario/login";
	}
    
	// MÉTODO para INCLUIR usuário e continuar na página de lista de usuários
    @PostMapping(value = "/incluirUsuarioLista")  
	public String incluirUsuarioLista(Model model, Usuario usuario) {
    	usuarioService.incluirUsuario(usuario);    	
    	model.addAttribute("mensagem",usuario.getNomeUsuario()+" foi incluído com sucesso!");    	
    	usuario.setCadastro(true);
    	return telaUsuarioLista(model);
	}   
	
	// MÉTODO ORDENAR
	@PostMapping(value="/usuario/ordenar")
	public String ordenar(Model model, @RequestParam String sortBy) {		
		model.addAttribute("usuarios", usuarioService.obterLista(sortBy));		
		return "usuario/usuarioLista";
	}	
	
	// MÉTODO para CONSULTAR usuário
	@GetMapping(value = "/usuario/{id}/consultar")
	public String consultar(Model model, @PathVariable Integer id) {
		Usuario usuario = usuarioService.obterPorId(id);		
		model.addAttribute("consultaUsuario",usuario);
		model.addAttribute("confirma","usuarioEncontrado");	
		return "usuario/cadastrarUsuario";
	}			

	// MÉTODO VOLTAR
	@GetMapping(value = "/voltarLista")
	public String voltar(){
		return "redirect:/usuario/lista";
	}
	
	// MÉTODO para EXCLUIR usuário
	@GetMapping(value = "/usuario/{id}/excluir")
	public String excluir(Model model, @PathVariable Integer id) {		
		Usuario usuarioExcluido = usuarioService.obterPorId(id);		
		usuarioService.excluir(id);		
		model.addAttribute("mensagem","O usuário " + usuarioExcluido.getNomeUsuario() + " foi excluído com sucesso!");
		return telaUsuarioLista(model);
	}	
}