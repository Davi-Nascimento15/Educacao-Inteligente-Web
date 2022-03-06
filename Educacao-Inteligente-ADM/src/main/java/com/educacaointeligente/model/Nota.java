package com.educacaointeligente.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import com.educacaointeligente.Enum.Bimestre;
import com.sun.istack.NotNull;

@Entity
public class Nota {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	int idNota;
    @NotNull
    float nota;
    @NotNull
    int anoLetivo;
    @NotNull
    Bimestre bimestre;
    @ManyToOne
    Aluno aluno; //Navegação
    @ManyToOne
    Disciplina disciplina; //Navegação
    
    public Nota(){
    	
    }
    
	public Nota(int idNota, float nota, int anoLetivo, Bimestre bimestre, Turma turma, Aluno aluno,
			Disciplina disciplina) {
		super();
		this.idNota = idNota;
		this.nota = nota;
		this.anoLetivo = anoLetivo;
		this.bimestre = bimestre;
		this.aluno = aluno;
		this.disciplina = disciplina;
	}

	public int getIdNota() {
		return idNota;
	}

	public void setIdNota(int idNota) {
		this.idNota = idNota;
	}

	public float getNota() {
		return nota;
	}

	public void setNota(float nota) {
		this.nota = nota;
	}

	public int getAnoLetivo() {
		return anoLetivo;
	}

	public void setAnoLetivo(int anoLetivo) {
		this.anoLetivo = anoLetivo;
	}

	public Bimestre getBimestre() {
		return bimestre;
	}

	public void setBimestre(Bimestre bimestre) {
		this.bimestre = bimestre;
	}

	public Aluno getAluno() {
		return aluno;
	}

	public void setAluno(Aluno aluno) {
		this.aluno = aluno;
	}

	public Disciplina getDisciplina() {
		return disciplina;
	}

	public void setDisciplina(Disciplina disciplina) {
		this.disciplina = disciplina;
	}  
}
