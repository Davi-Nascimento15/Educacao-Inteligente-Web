package com.educacaointeligente.dao;

import java.util.List;
import java.util.function.Consumer;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import com.educacaointeligente.model.Noticia;

public class NoticiaDao implements Dao<Noticia> {
	private EntityManager em;
	
	public NoticiaDao(){
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
	public Noticia get(int id) {	
		return em.find(Noticia.class,id);
	}
	
	@Override
	public List<Noticia> getAll() {
		return em.createQuery("From Noticia Order By idNoticia DESC",Noticia.class).getResultList();
	}
	
	@Override
	public List<Noticia> getAllWhere(int id) {
		
		return em.createQuery("From Noticia Where idNoticia="+id,Noticia.class).getResultList();
	}
	
	@Override
	public void save (Noticia objeto) {
		ExecuteInsideTrasaction(em->em.persist(objeto));
	}

	@Override
	public void update(Noticia objeto) {
		ExecuteInsideTrasaction(em->em.merge(objeto));
	}

	@Override
	public void delete(Noticia objeto) {
		ExecuteInsideTrasaction(em->em.remove(objeto));
	}
	
	@Override
	public List<Noticia> getNome(String objeto) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<Noticia> getAllNome(String objeto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Noticia getString(String id) {
		// TODO Auto-generated method stub
		return null;
	}
}
