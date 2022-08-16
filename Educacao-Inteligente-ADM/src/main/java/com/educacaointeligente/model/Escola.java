package com.educacaointeligente.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import com.sun.istack.NotNull;

@Entity
public class Escola {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	int idEscola;
	@NotNull
    String cnpj;
	@NotNull
	String nome;
	@NotNull
	String telefone;
	@NotNull
	String email;
	@NotNull
	String endereco;
    @OneToMany(mappedBy = "escola")
    List<Usuario> usuario;
	@OneToMany(mappedBy = "escola")
	List<Turma> turma;
    @OneToMany(mappedBy = "escola")
    List<Aluno> aluno;
    @OneToMany(mappedBy = "escola")
    List<Noticia> noticia;
    @OneToMany(mappedBy = "escola")
    List<Sugestao> sugestao;
    @OneToMany(mappedBy = "escola")
    List<DiaLetivo> diaLetivo;
    @OneToMany(mappedBy = "escola")
    List<Professor> professor;
    @OneToMany(mappedBy = "escola")
    List<Disciplina> disciplina;
	
	public Escola() {
		super();
	}

	public Escola(int idEscola, String cnpj, String nome, String telefone, String email, String endereco,
			List<Turma> turma, List<Aluno> aluno, List<Usuario> usuario, List<Noticia> noticia, List<Sugestao> sugestao, List<DiaLetivo> dialetivo, List<Professor> professor,List<Disciplina> disciplina) {
		super();
		this.idEscola = idEscola;
		this.cnpj = cnpj;
		this.nome = nome;
		this.telefone = telefone;
		this.email = email;
		this.endereco = endereco;
		this.usuario = usuario;
		this.turma = turma;
		this.aluno = aluno;
		this.noticia = noticia;
		this.sugestao = sugestao;
		this.diaLetivo= dialetivo;
		this.professor = professor;
		this.disciplina = disciplina;
	}

	public Escola(int idEscola, String cnpj, String nome, String telefone, String email, String endereco) {
		super();
		this.idEscola = idEscola;
		this.cnpj = cnpj;
		this.nome = nome;
		this.telefone = telefone;
		this.email = email;
		this.endereco = endereco;
	}

	public int getIdEscola() {
		return idEscola;
	}

	public void setIdEscola(int idEscola) {
		this.idEscola = idEscola;
	}

	public String getCnpj() {
		return cnpj;
	}

	public void setCnpj(String cnpj) {
		this.cnpj = cnpj;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEndereco() {
		return endereco;
	}

	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}
	
	public List<Usuario> getUsuario() {
		return usuario;
	}

	public void setUsuario(List<Usuario> usuario) {
		this.usuario = usuario;
	}

	public List<Turma> getTurma() {
		return turma;
	}

	public void setTurma(List<Turma> turma) {
		this.turma = turma;
	}

	public List<Aluno> getAluno() {
		return aluno;
	}

	public void setAluno(List<Aluno> aluno) {
		this.aluno = aluno;
	}
	
	public List<Noticia> getNoticia() {
		return noticia;
	}

	public void setNoticia(List<Noticia> noticia) {
		this.noticia = noticia;
	}
	
	public List<Sugestao> getSugestao() {
		return sugestao;
	}

	public void setSugestao(List<Sugestao> sugestao) {
		this.sugestao = sugestao;
	}

	public List<DiaLetivo> getDiaLetivo() {
		return diaLetivo;
	}

	public void setDiaLetivo(List<DiaLetivo> diaLetivo) {
		this.diaLetivo = diaLetivo;
	}

	public List<Professor> getProfessor() {
		return professor;
	}

	public void setProfessor(List<Professor> professor) {
		this.professor = professor;
	}

	public List<Disciplina> getDisciplina() {
		return disciplina;
	}

	public void setDisciplina(List<Disciplina> disciplina) {
		this.disciplina = disciplina;
	}
	
}