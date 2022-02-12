package com.educacaointeligente.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import com.educacaointeligente.Enum.*;
import com.sun.istack.NotNull;

@Entity
public class Aluno {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    int idaluno;
	@NotNull
	int matricula;
	@NotNull
    String nome;
    @NotNull
	String nomeMae;
    @NotNull
    String endereco;
    @NotNull
    String telefone;
	@NotNull
    String turma;
    @NotNull
    Turno turno;
    @NotNull
    Ano ano;
    @ManyToOne
    Usuario usuario;

	public Aluno() {
		super();
	}

	public Aluno(int idaluno, int matricula, String nome, String nomeMae, String endereco, String telefone,
			String turma, Turno turno, Ano ano) {
		super();
		this.idaluno = idaluno;
		this.matricula = matricula;
		this.nome = nome;
		this.nomeMae = nomeMae;
		this.endereco = endereco;
		this.telefone = telefone;
		this.turma = turma;
		this.turno = turno;
		this.ano = ano;
	}

	public int getIdaluno() {
		return idaluno;
	}

	public void setIdaluno(int idaluno) {
		this.idaluno = idaluno;
	}

	public int getMatricula() {
		return matricula;
	}

	public void setMatricula(int matricula) {
		this.matricula = matricula;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getNomeMae() {
		return nomeMae;
	}

	public void setNomeMae(String nomeMae) {
		this.nomeMae = nomeMae;
	}

	public String getEndereco() {
		return endereco;
	}

	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getTurma() {
		return turma;
	}

	public void setTurma(String turma) {
		this.turma = turma;
	}

	public Turno getTurno() {
		return turno;
	}

	public void setTurno(Turno turno) {
		this.turno = turno;
	}

	public Ano getAno() {
		return ano;
	}

	public void setAno(Ano ano) {
		this.ano = ano;
	}
	
	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
}
