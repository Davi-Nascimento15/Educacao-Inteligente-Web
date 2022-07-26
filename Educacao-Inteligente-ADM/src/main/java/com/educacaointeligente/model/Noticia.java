package com.educacaointeligente.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import com.sun.istack.NotNull;

@Entity
public class Noticia {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	int idNoticia;
	@NotNull
    String titulo;
	@NotNull
    String descricao;
	@NotNull
	String dataGeracao;
	
	public Noticia() {
		super();
	}

	public Noticia(int idNoticia, String titulo, String descricao, String dataGeracao) {
		super();
		this.idNoticia = idNoticia;
		this.titulo = titulo;
		this.descricao = descricao;
		this.dataGeracao = dataGeracao;
	}

	public int getIdNoticia() {
		return idNoticia;
	}

	public void setIdNoticia(int idNoticia) {
		this.idNoticia = idNoticia;
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

	public String getDataGeracao() {
		return dataGeracao;
	}

	public void setDataGeracao(String dataGeracao) {
		this.dataGeracao = dataGeracao;
	}
}
