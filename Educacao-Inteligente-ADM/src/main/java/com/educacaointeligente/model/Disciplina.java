package com.educacaointeligente.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
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
    @OneToOne
    private Professor professor;
    @ManyToOne
    Turma turma;
    
	public Disciplina() {
		super();
	}

	public Disciplina(int iddisciplina, String nome, String descricao, Professor professor, Turma turma) {
		super();
		this.iddisciplina = iddisciplina;
		this.nome = nome;
		this.descricao = descricao;
		this.professor = professor;
		this.turma = turma;
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
	
	public Professor getProfessor() {
		return professor;
	}

	public void setProfessor(Professor professor) {
		this.professor = professor;
	}

	public Turma getTurma() {
		return turma;
	}

	public void setTurma(Turma turma) {
		this.turma = turma;
	}

}
