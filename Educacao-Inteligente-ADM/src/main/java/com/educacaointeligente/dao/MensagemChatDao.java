package com.educacaointeligente.dao;

import java.util.List;
import java.util.function.Consumer;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

import com.educacaointeligente.model.MensagemChat;

public class MensagemChatDao implements Dao<MensagemChat> {
	private EntityManager em;
    
    public MensagemChatDao(){
    	em = JPAUtil.getEntityManagerFactory().createEntityManager();
    }
   
    private void ExecuteInsideTrasaction(Consumer<EntityManager>action) {
        EntityTransaction tx = em.getTransaction();
        try {
        	tx.begin();
        	action.accept(em);
        	tx.commit();
        }catch(RuntimeException e) {
        	tx.rollback();
        	throw e;
        }
    }
    
	@Override
	public MensagemChat get(int id) {	
		return em.find(MensagemChat.class,id);
	}

	@Override
	public List<MensagemChat> getAll() {
		return em.createQuery("From MensagemChat",MensagemChat.class).getResultList();
	}
	
	@Override
	public List<MensagemChat> getAllWhere(int id) {
		
		return em.createQuery("From MensagemChat Where idchat="+id,MensagemChat.class).getResultList();
	}
	
	@Override
	public void save (MensagemChat objeto) {
		ExecuteInsideTrasaction(em->em.persist(objeto));
	}

	@Override
	public void update(MensagemChat objeto) {
		ExecuteInsideTrasaction(em->em.merge(objeto));
	}

	@Override
	public void delete(MensagemChat objeto) {
		ExecuteInsideTrasaction(em->em.remove(objeto));
	}

	@Override
	public List<MensagemChat> getNome(String objeto) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<MensagemChat> getAllNome(String objeto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MensagemChat getString(String id) {
		// TODO Auto-generated method stub
		return null;
	}
}

