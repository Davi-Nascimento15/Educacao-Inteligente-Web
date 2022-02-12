package com.educacaointeligente.model;

import javax.persistence.Entity;
import java.util.List;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import com.educacaointeligente.Enum.TipoUsuario;
import com.sun.istack.NotNull;

@Entity
public class Usuario {
	   @Id
	   @GeneratedValue(strategy = GenerationType.IDENTITY)
       int idusuario;
	   @NotNull
       String nome;
       @NotNull
	   TipoUsuario tipo;
       @NotNull
       String senha;
       @OneToMany(mappedBy = "usuario")
       private List<Aluno> aluno;
       
	public Usuario() {
		super();
	}
	
	public Usuario(int idusuario, String nome, TipoUsuario tipo, String senha) {
		super();
		this.idusuario = idusuario;
		this.nome = nome;
		this.tipo = tipo;
		this.senha = senha;
	}

	public int getIdusuario() {
		return idusuario;
	}

	public void setIdusuario(int idusuario) {
		this.idusuario = idusuario;
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
