package com.educacaointeligente.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import com.sun.istack.NotNull;

@Entity
public class Sugestao {
    @Id
    String idSugestao;
    @NotNull
    String titulo;
    @NotNull
    String descricao;
    @NotNull
    int curtidas;
    @ManyToOne
    Usuario usuario; 
    
	public Sugestao() {
		super();
	}

	public Sugestao(String idSugestao, String titulo, String descricao, int curtidas, Usuario usuario) {
		super();
		this.idSugestao = idSugestao;
		this.titulo = titulo;
		this.descricao = descricao;
		this.curtidas = curtidas;
		this.usuario = usuario;
	}

	public String getIdSugestao() {
		return idSugestao;
	}

	public void setIdSugestao(String idSugestao) {
		this.idSugestao = idSugestao;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public int getCurtidas() {
		return curtidas;
	}

	public void setCurtidas(int curtidas) {
		this.curtidas = curtidas;
	}
	
	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
}

