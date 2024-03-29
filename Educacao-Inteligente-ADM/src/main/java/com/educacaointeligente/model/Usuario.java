package com.educacaointeligente.model;
import javax.persistence.Entity;
import java.util.List;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
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
       @ManyToOne
       Escola escola;
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

	public Usuario(int idmatricula, String nome, TipoUsuario tipo, String senha, Escola escola, List<Aluno> aluno,
			List<Sugestao> sugestao, List<MensagemChat> destinatario, List<MensagemChat> remetente) {
		super();
		this.idmatricula = idmatricula;
		this.nome = nome;
		this.tipo = tipo;
		this.senha = senha;
		this.escola = escola;
		this.aluno = aluno;
		this.sugestao = sugestao;
		this.destinatario = destinatario;
		this.remetente = remetente;
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

	public Escola getEscola() {
		return escola;
	}

	public void setEscola(Escola escola) {
		this.escola = escola;
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

	public List<MensagemChat> getDestinatario() {
		return destinatario;
	}

	public void setDestinatario(List<MensagemChat> destinatario) {
		this.destinatario = destinatario;
	}

	public List<MensagemChat> getRemetente() {
		return remetente;
	}

	public void setRemetente(List<MensagemChat> remetente) {
		this.remetente = remetente;
	}	
}
