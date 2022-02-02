package com.educacaointeligente.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
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

       
   	public Professor() {
		super();
	}
   	     
	public Professor(int idprofessor, String nome, String endereco, String formacao, String telefone) {
		super();
		this.idprofessor = idprofessor;
		this.nome = nome;
		this.endereco = endereco;
		this.formacao = formacao;
		this.telefone = telefone;
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
	
}
