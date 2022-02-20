package com.educacaointeligente.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
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
    @ManyToMany
    @JoinTable(name="turma_disciplina", joinColumns=
    @JoinColumn(name="disciplina_id"), inverseJoinColumns=
    @JoinColumn(name="turma_id"))
    private List<Disciplina> listadisciplina;
	
	public Turma() {
		super();
	}

	public Turma(int idTurma, String nome, int ano, List<Disciplina> disciplina) {
		super();
		this.idTurma = idTurma;
		this.nome = nome;
		Ano = ano;
		this.listadisciplina = disciplina;
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

	public List<Disciplina> getListaDisciplina() {
		return listadisciplina;
	}

	public void setListaDisciplina(List<Disciplina> disciplina) {
		this.listadisciplina = disciplina;
	}
}
