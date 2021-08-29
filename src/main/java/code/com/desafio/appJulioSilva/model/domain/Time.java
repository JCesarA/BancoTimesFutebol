package code.com.desafio.appJulioSilva.model.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Time {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) // Gera valores para a Id
	private Integer id;				// Chave primária
	private String nome;        	// Nome do time
	private int anoFundacao;    	// Ano da fundação do time
	private float valor;			// Valor de mercado do time
	private String siglaNacao;		// Sigla do país de origem do time
	private boolean clubeEmpresa;	// Identifica se é clube empresa (true) ou não (false)
	
	// CONSTRUTOR
	public Time() {
		this.valor = 999;
		this.siglaNacao = "BR";
		this.clubeEmpresa = true;
	}
	
	// CONSTRUTOR
	public Time(String nome, int anoFundacao) {
		this();				// Chama CONSTRUTOR sem parâmetro -> Time()
		this.nome = nome;
		this.anoFundacao = anoFundacao;
	}	
	
	@Override
	public String toString() {		
		return "("+ id +") Sou " + nome + ", fundado em " + anoFundacao+".";
	}
			
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public int getAnoFundacao() {
		return anoFundacao;
	}
	public void setAnoFundacao(int anoFundacao) {
		this.anoFundacao = anoFundacao;
	}
	public float getValor() {
		return valor;
	}
	public void setValor(float valor) {
		this.valor = valor;
	}
	public String getSiglaNacao() {
		return siglaNacao;
	}
	public void setSiglaNacao(String siglaNacao) {
		this.siglaNacao = siglaNacao;
	}
	public boolean isClubeEmpresa() {
		return clubeEmpresa;
	}
	public void setClubeEmpresa(boolean clubeEmpresa) {
		this.clubeEmpresa = clubeEmpresa;
	}
}