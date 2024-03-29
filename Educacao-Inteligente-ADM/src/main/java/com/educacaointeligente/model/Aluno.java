package com.educacaointeligente.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;

import com.educacaointeligente.Enum.*;
import com.sun.istack.NotNull;

@NamedQuery(name="Aluno.buscaporNome", 
query="select u from Aluno u where u.nome LIKE :variavel")

@Entity
public class Aluno {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    int idaluno;
	@NotNull
	String matricula;
	@NotNull
	@OrderBy("nome DESC")
    String nome;
    @NotNull
	String nomeMae;
    @NotNull
    String endereco;
    @NotNull
    String telefone;
    @NotNull
    Turno turno;
    @NotNull
    Ano ano;
    @ManyToOne
    Usuario usuario;
    @ManyToOne
    Turma turma;
    @ManyToOne
    Escola escola;
    @OneToMany(mappedBy="aluno")
    private List<Presenca> presenca ;
    @OneToMany(mappedBy="aluno")
    private List<Nota> nota ;
    
    
	public Aluno() {
		super();
	}

	public Aluno(int idaluno, String matricula, String nome, String nomeMae, String endereco, String telefone, Turno turno,
			Ano ano, Usuario usuario, Turma turma, Escola escola, List<Presenca> presenca, List<Nota> nota) {
		super();
		this.idaluno = idaluno;
		this.matricula = matricula;
		this.nome = nome;
		this.nomeMae = nomeMae;
		this.endereco = endereco;
		this.telefone = telefone;
		this.turno = turno;
		this.ano = ano;
		this.usuario = usuario;
		this.turma = turma;
		this.escola = escola;
		this.presenca = presenca;
		this.nota = nota;
	}

	public int getIdaluno() {
		return idaluno;
	}


	public void setIdaluno(int idaluno) {
		this.idaluno = idaluno;
	}


	public String getMatricula() {
		return matricula;
	}


	public void setMatricula(String matricula) {
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


	public Turma getTurma() {
		return turma;
	}


	public void setTurma(Turma turma) {
		this.turma = turma;
	}


	public Escola getEscola() {
		return escola;
	}


	public void setEscola(Escola escola) {
		this.escola = escola;
	}


	public List<Presenca> getPresenca() {
		return presenca;
	}


	public void setPresenca(List<Presenca> presenca) {
		this.presenca = presenca;
	}


	public List<Nota> getNota() {
		return nota;
	}


	public void setNota(List<Nota> nota) {
		this.nota = nota;
	}
}
