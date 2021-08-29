package code.com.desafio.appJulioSilva.model.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Usuario {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) // Gera valores para a Id
	private Integer id;				// Chave primária
	private String email;			// Email
	private String senha;			// Senha
	public String nomeUsuario;		// Nome do usuário
	public String timeUsuario;		// Time do usuário
	public boolean cadastro; 		// Identifica se há cadastro de usuário
	
	
	public Usuario() {}	
	
	public Usuario(String email, String senha, String nomeUsuario, String timeUsuario, boolean cadastro) {		
		this.email = email;
		this.senha = senha;
		this.nomeUsuario = nomeUsuario;
		this.timeUsuario = timeUsuario;
		this.cadastro = cadastro;
	}
	
	public String getNomeUsuario() {
		return nomeUsuario;
	}

	public void setNomeUsuario(String nomeUsuario) {
		this.nomeUsuario = nomeUsuario;
	}

	public String getTimeUsuario() {
		return timeUsuario;
	}

	public void setTimeUsuario(String timeUsuario) {
		this.timeUsuario = timeUsuario;
	}	
			
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}
	public boolean isCadastro() {
		return cadastro;
	}

	public void setCadastro(boolean cadastro) {
		this.cadastro = cadastro;
	}	
}