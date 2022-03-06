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
    @ManyToOne
    private Escola escola;
    @OneToMany(mappedBy="turma")
    private List<Avisos> aviso;
    @OneToMany(mappedBy = "turma")
    private List<Aluno> aluno;
    	
	public Turma() {
		super();
	}

	public Turma(int idTurma, String nome, int ano, List<Disciplina> listadisciplina, Escola escola,
			List<Aluno> aluno) {
		super();
		this.idTurma = idTurma;
		this.nome = nome;
		Ano = ano;
		this.listadisciplina = listadisciplina;
		this.escola = escola;
		this.aluno = aluno;
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
	
	public List<Disciplina> getListadisciplina() {
		return listadisciplina;
	}

	public void setListadisciplina(List<Disciplina> listadisciplina) {
		this.listadisciplina = listadisciplina;
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

	public List<Avisos> getAviso() {
		return aviso;
	}

	public void setAviso(List<Avisos> aviso) {
		this.aviso = aviso;
	}
}
