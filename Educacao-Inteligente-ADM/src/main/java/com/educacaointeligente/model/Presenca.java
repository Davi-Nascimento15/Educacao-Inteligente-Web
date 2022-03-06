package com.educacaointeligente.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import com.sun.istack.NotNull;

@Entity
public class Presenca {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int idPresenca;
	@NotNull
	boolean falta;
	@NotNull
	String Data;
	@ManyToOne
	Aluno aluno;
	public Presenca() {
		super();
	}
	public Presenca(int idPresenca, boolean falta, String data, Aluno aluno) {
		super();
		this.idPresenca = idPresenca;
		this.falta = falta;
		Data = data;
		this.aluno = aluno;
	}
	public int getIdPresenca() {
		return idPresenca;
	}
	public void setIdPresenca(int idPresenca) {
		this.idPresenca = idPresenca;
	}
	public boolean isFalta() {
		return falta;
	}
	public void setFalta(boolean falta) {
		this.falta = falta;
	}
	public String getData() {
		return Data;
	}
	public void setData(String data) {
		Data = data;
	}
	public Aluno getAluno() {
		return aluno;
	}
	public void setAluno(Aluno aluno) {
		this.aluno = aluno;
	}
}
