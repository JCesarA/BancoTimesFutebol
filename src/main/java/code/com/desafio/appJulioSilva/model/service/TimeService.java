package code.com.desafio.appJulioSilva.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import code.com.desafio.appJulioSilva.model.domain.Time;
import code.com.desafio.appJulioSilva.model.repository.TimeRepository;

@Service
public class TimeService {
	
	@Autowired
	private TimeRepository timeRepository;

	// MÉTODO para obter a lista de times e fazer ordenação
	public List<Time> obterLista(String campo){			
		return (List<Time>) timeRepository.findAll(Sort.by(Sort.Direction.ASC, campo));
	}		
	
	// MÉTODO para obter a lista de times (responsável só por recuperar a coleção)
	public List<Time> obterLista(){			
		return (List<Time>) timeRepository.findAll(Sort.by(Sort.Direction.ASC, "nome"));
	}
	
	// MÉTODO de incluir
	public void incluir(Time time) {		
		timeRepository.save(time);				
	}	
	
	// MÉTODO para excluir
	public void excluir(Integer id) {		
		timeRepository.deleteById(id);				
	}
	
	// MÉTODO para retornar o nome do time por meio da Id
	public Time obterPorId(Integer id) {		
		return timeRepository.findById(id).orElse(null);		
	}		
}