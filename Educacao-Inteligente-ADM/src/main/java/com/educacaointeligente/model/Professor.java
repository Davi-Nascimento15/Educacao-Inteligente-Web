package com.educacaointeligente.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import com.sun.istack.NotNull;

@Entity
public class Professor {
	   @Id
	   @GeneratedValue(strategy = GenerationType.IDENTITY)
       int idprofessor;	   
	   @NotNull
       String nome;	   
       @NotNull
       String endereco;      
       @NotNull
       String formacao;    
       @NotNull
       String telefone;
       @NotNull
       String email;
       @OneToOne
       Disciplina disciplina;
       @OneToMany(mappedBy="professor")
       private List<Avisos> aviso;
       @OneToOne
       Usuario usuario;
       @ManyToOne
       private Escola escola;
       @OneToMany(mappedBy="professor")
       private List<Presenca> presenca;
       
	public Professor() {
		super();
	}
	
	public Professor(int idprofessor, String nome, String endereco, String formacao, String telefone, String email,
			Disciplina disciplina, List<Avisos> aviso, Usuario usuario, Escola escola) {
		super();
		this.idprofessor = idprofessor;
		this.nome = nome;
		this.endereco = endereco;
		this.formacao = formacao;
		this.telefone = telefone;
		this.email = email;
		this.disciplina = disciplina;
		this.aviso = aviso;
		this.usuario=usuario;
		this.escola = escola;
	}
   	     

	public int getIdprofessor() {
		return idprofessor;
	}

	public void setIdprofessor(int idprofessor) {
		this.idprofessor = idprofessor;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getEndereco() {
		return endereco;
	}

	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}

	public String getFormacao() {
		return formacao;
	}

	public void setFormacao(String formacao) {
		this.formacao = formacao;
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

	public Disciplina getDisciplina() {
		return disciplina;
	}

	public void setDisciplina(Disciplina disciplina) {
		this.disciplina = disciplina;
	}

	public List<Avisos> getAviso() {
		return aviso;
	}

	public void setAviso(List<Avisos> aviso) {
		this.aviso = aviso;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public Escola getEscola() {
		return escola;
	}

	public void setEscola(Escola escola) {
		this.escola = escola;
	}
	
	
}
