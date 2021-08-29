package code.com.desafio.appJulioSilva.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import code.com.desafio.appJulioSilva.model.domain.Time;
import code.com.desafio.appJulioSilva.model.service.TimeService;

@Controller
public class TimeController {

	@Autowired
	private TimeService timeService;
	
	// MÉTODO para a tela de inclusão de times
	@GetMapping(value = "/time")
	public String telaCadastro() {
		return "time/cadastro";
	}
	
	// INCLUIR
    @PostMapping(value = "/time/incluir") 
	public String incluir(Model model, Time time) {    	  	
    	timeService.incluir(time);    	
    	model.addAttribute("mensagem","O time " +time.getNome()+" foi cadastrado com sucesso!");    	
    	return obterLista(model);
	}
	
	// MÉTODO para excluir time
	@GetMapping(value = "/time/{id}/excluir")
	public String excluir(Model model, @PathVariable Integer id) {				
		Time timeExcluido = timeService.obterPorId(id);		
		timeService.excluir(id);		
		model.addAttribute("mensagem","O time " + timeExcluido.getNome() + " foi excluído com sucesso!");
		return obterLista(model);
	}	
	
	// CONSULTAR
	@GetMapping(value = "/time/{id}/consultar")
	public String consultar(Model model, @PathVariable Integer id) {		
		Time time = timeService.obterPorId(id);		
		model.addAttribute("meuTime",time);		
		return telaCadastro();
	}		
	
	// MÉTODO para a tela de lista dos times
	@GetMapping(value = "/time/lista")
	public String obterLista(Model model) {			
		model.addAttribute("times", timeService.obterLista());		
		return "time/lista";
	}
	
	// VOLTAR
	@GetMapping(value = "/voltar")
	public String voltar(){
		return "redirect:/time/lista";
	}
	
	// ORDENAR
	@PostMapping(value="/time/ordenar")
	public String ordenar(Model model, @RequestParam String sortBy) {		
		model.addAttribute("times", timeService.obterLista(sortBy));		
		return "time/lista";
	}			
}