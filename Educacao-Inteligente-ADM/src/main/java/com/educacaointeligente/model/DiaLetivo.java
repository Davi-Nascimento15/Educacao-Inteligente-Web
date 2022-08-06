package com.educacaointeligente.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;

import com.educacaointeligente.Enum.TipoData;
import com.sun.istack.NotNull;

@Entity
public class DiaLetivo {
   @Id
   @GeneratedValue(strategy = GenerationType.IDENTITY)
   int id;
   @NotNull
   String data;
   @NotNull
   TipoData tipo;
   @NotNull
   int ano;
   @ManyToOne
   Escola escola;
   
public DiaLetivo() {
	super();
}
public DiaLetivo(String data, TipoData tipo, int ano, Escola escola) {
	super();
	this.data = data;
	this.tipo = tipo;
	this.ano = ano;
	this.escola =escola;
}

public int getId() {
	return id;
}

public void setId(int id) {
	this.id = id;
}

public String getData() {
	return data;
}

public void setData(String data) {
	this.data = data;
}

public TipoData getTipo() {
	return tipo;
}

public void setTipo(TipoData tipo) {
	this.tipo = tipo;
}

public int getAno() {
	return ano;
}

public void setAno(int ano) {
	this.ano = ano;
}
public Escola getEscola() {
	return escola;
}
public void setEscola(Escola escola) {
	this.escola = escola;
}
}
