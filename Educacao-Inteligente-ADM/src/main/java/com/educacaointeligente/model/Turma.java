package com.educacaointeligente.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import com.sun.istack.NotNull;

@Entity
public class Turma {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	int idTurma;
    @NotNull
    String nome;
    @NotNull
    int Ano;
    @OneToMany(mappedBy = "turma")
    private List<Disciplina> disciplina;
	
	public Turma() {
		super();
	}

	public Turma(int idTurma, String nome, int ano, List<Disciplina> disciplina) {
		super();
		this.idTurma = idTurma;
		this.nome = nome;
		Ano = ano;
		this.disciplina = disciplina;
	}

	public int getIdTurma() {
		return idTurma;
	}

	public void setIdTurma(int idTurma) {
		this.idTurma = idTurma;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public int getAno() {
		return Ano;
	}

	public void setAno(int ano) {
		Ano = ano;
	}

	public List<Disciplina> getDisciplina() {
		return disciplina;
	}

	public void setDisciplina(List<Disciplina> disciplina) {
		this.disciplina = disciplina;
	}
}
