package com.educacaointeligente.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import com.sun.istack.NotNull;

@Entity
public class MensagemChat {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    int idchat;
	@NotNull
    @ManyToOne
    Usuario destinatario;
	@NotNull
	@ManyToOne
    Usuario remetente;
	@NotNull
	String data;
	@NotNull
    String hora;
	@NotNull
    String conteudo;
	@NotNull
    String visualizada;
	
	public MensagemChat(int idchat, Usuario destinatario, Usuario remetente, String data, String hora, String conteudo,
			String visualizada) {
		super();
		this.idchat = idchat;
		this.destinatario = destinatario;
		this.remetente = remetente;
		this.data = data;
		this.hora = hora;
		this.conteudo = conteudo;
		this.visualizada = visualizada;
	}
	
	public MensagemChat() {
		super();
	}

	public int getIdchat() {
		return idchat;
	}

	public void setIdchat(int idchat) {
		this.idchat = idchat;
	}

	public Usuario getDestinatario() {
		return destinatario;
	}

	public void setDestinatario(Usuario destinatario) {
		this.destinatario = destinatario;
	}

	public Usuario getRemetente() {
		return remetente;
	}

	public void setRemetente(Usuario remetente) {
		this.remetente = remetente;
	}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

	public String getHora() {
		return hora;
	}

	public void setHora(String hora) {
		this.hora = hora;
	}

	public String getConteudo() {
		return conteudo;
	}

	public void setConteudo(String conteudo) {
		this.conteudo = conteudo;
	}

	public String getVisualizada() {
		return visualizada;
	}

	public void setVisualizada(String visualizada) {
		this.visualizada = visualizada;
	}
}
