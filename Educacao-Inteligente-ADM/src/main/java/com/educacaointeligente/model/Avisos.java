package com.educacaointeligente.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import com.educacaointeligente.Enum.TipoAviso;
import com.sun.istack.NotNull;

@Entity
public class Avisos {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int idAvisos;
	@NotNull
	String descricao;
	@NotNull
	String dataGeracao;
	@NotNull
	String dataEntrega;
	@NotNull
	TipoAviso tipoaviso;
	@ManyToOne
	Turma turma;
    @ManyToOne	
	Professor professor;
	@ManyToOne
	Disciplina disciplina;
	@ManyToOne
	Escola escola;
	
	public Avisos() {
		super();
	}
	
	public Avisos(int idAvisos, String descricao, String dataGeracao, String dataEntrega, TipoAviso tipoaviso,
			Turma turma, Professor professor, Disciplina disciplina, Escola escola) {
		super();
		this.idAvisos = idAvisos;
		this.descricao = descricao;
		this.dataGeracao = dataGeracao;
		this.dataEntrega = dataEntrega;
		this.tipoaviso = tipoaviso;
		this.turma = turma;
		this.professor = professor;
		this.disciplina = disciplina;
		this.escola = escola;
	}
	
	public TipoAviso getTipoaviso() {
		return tipoaviso;
	}

	public void setTipoaviso(TipoAviso tipoaviso) {
		this.tipoaviso = tipoaviso;
	}

	public int getIdAvisos() {
		return idAvisos;
	}
	public void setIdAvisos(int idAvisos) {
		this.idAvisos = idAvisos;
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
	public String getDataEntrega() {
		return dataEntrega;
	}
	public void setDataEntrega(String dataEntrega) {
		this.dataEntrega = dataEntrega;
	}
	public Turma getTurma() {
		return turma;
	}
	public void setTurma(Turma turma) {
		this.turma = turma;
	}
	public Professor getProfessor() {
		return professor;
	}
	public void setProfessor(Professor professor) {
		this.professor = professor;
	}
	public Disciplina getDisciplina() {
		return disciplina;
	}
	public void setDisciplina(Disciplina disciplina) {
		this.disciplina = disciplina;
	}
	public Escola getEscola() {
		return escola;
	}
	public void setEscola(Escola escola) {
		this.escola = escola;
	}
}
