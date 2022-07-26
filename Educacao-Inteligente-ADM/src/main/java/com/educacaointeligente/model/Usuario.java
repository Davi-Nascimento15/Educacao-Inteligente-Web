package com.educacaointeligente.model;
import javax.persistence.Entity;
import java.util.List;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;

import com.educacaointeligente.Enum.TipoUsuario;
import com.sun.istack.NotNull;

@Entity
public class Usuario {
	   @Id
       int idmatricula;
	   @NotNull
       String nome;
       @NotNull
	   TipoUsuario tipo;
       @NotNull
       String senha;
       @OneToMany(mappedBy="usuario")
       @OrderBy("nome DESC")
       private List<Aluno> aluno;
       @OneToMany(mappedBy="usuario")
       private List<Sugestao> sugestao ;
       @OneToMany(mappedBy = "destinatario")
       private List<MensagemChat> destinatario;
       @OneToMany(mappedBy = "remetente")
       private List<MensagemChat> remetente;
       
	public Usuario() {
		super();
	}
	
	public Usuario(int idmatricula, String nome, TipoUsuario tipo, String senha, List<Aluno> aluno, List<Sugestao> sugestao
			) {
		super();
		this.idmatricula = idmatricula;
		this.nome = nome;
		this.tipo = tipo;
		this.senha = senha;
		this.aluno = aluno;
		this.sugestao = sugestao;
	}
	
	public List<Aluno> getAluno() {
		return aluno;
	}

	public void setAluno(List<Aluno> aluno) {
		this.aluno = aluno;
	}

	public List<Sugestao> getSugestao() {
		return sugestao;
	}

	public void setSugestao(List<Sugestao> sugestao) {
		this.sugestao = sugestao;
	}

	public int getIdmatricula() {
		return idmatricula;
	}

	public void setIdmatricula(int idmatricula) {
		this.idmatricula = idmatricula;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public TipoUsuario getTipo() {
		return tipo;
	}

	public void setTipo(TipoUsuario tipo) {
		this.tipo = tipo;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}
}
