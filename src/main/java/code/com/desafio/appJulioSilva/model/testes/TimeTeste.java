package code.com.desafio.appJulioSilva.model.testes;

import code.com.desafio.appJulioSilva.model.domain.Time;

public class TimeTeste {

	public static void main(String[] args) {		
		Time time = new Time("Botafogo", 1904);   // Criação de um objeto (time) por meio de um construtror
		System.out.println("Meu time: " + time);
	}
}