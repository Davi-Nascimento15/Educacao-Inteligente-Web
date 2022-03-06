package com.educacaointeligente.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
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
    @ManyToMany (mappedBy = "listadisciplina")
    List<Turma> listadisciplina;
    @OneToMany(mappedBy="disciplina")
    private List<Avisos> aviso;
    @OneToMany(mappedBy="disciplina")
    private List<Nota> nota ;
    
	public Disciplina() {
		super();
	}

	public Disciplina(int iddisciplina, String nome, String descricao, Professor professor,
			List<Turma> listadisciplina) {
		super();
		this.iddisciplina = iddisciplina;
		this.nome = nome;
		this.descricao = descricao;
		this.professor = professor;
		this.listadisciplina = listadisciplina;
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

	public List<Turma> getListadisciplina() {
		return listadisciplina;
	}

	public void setListadisciplina(List<Turma> listadisciplina) {
		this.listadisciplina = listadisciplina;
	}

	public List<Avisos> getAviso() {
		return aviso;
	}

	public void setAviso(List<Avisos> aviso) {
		this.aviso = aviso;
	}

	public List<Nota> getNota() {
		return nota;
	}

	public void setNota(List<Nota> nota) {
		this.nota = nota;
	}
	
}
