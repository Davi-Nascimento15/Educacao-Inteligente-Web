package com.educacaointeligente.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import com.sun.istack.NotNull;

@Entity
public class Disciplina {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    int iddisciplina;
	@NotNull
    String nome;
    @NotNull
    String descricao;

	public Disciplina() {
		super();
	}
	
	
	public Disciplina(int iddisciplina, String nome, String descricao) {
		super();
		this.iddisciplina = iddisciplina;
		this.nome = nome;
		this.descricao = descricao;
	}


	public int getIddisciplina() {
		return iddisciplina;
	}

	public void setIddisciplina(int iddisciplina) {
		this.iddisciplina = iddisciplina;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	} 
}
