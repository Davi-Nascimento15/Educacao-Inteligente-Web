package com.educacaointeligente.dao;

import java.util.List;
import java.util.function.Consumer;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

import com.educacaointeligente.model.Usuario;

public class UsuarioDao implements Dao<Usuario> {
	private EntityManager em;
    
    public UsuarioDao(){
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
	public Usuario get(int id) {	
		return em.find(Usuario.class,id);
	}

	@Override
	public List<Usuario> getAll() {
		return em.createQuery("From Usuario",Usuario.class).getResultList();
	}
	
	@Override
	public List<Usuario> getAllWhere(int id) {
		
		return em.createQuery("From Usuario Where usuario_id="+id,Usuario.class).getResultList();
	}
	
	@Override
	public void save (Usuario objeto) {
		ExecuteInsideTrasaction(em->em.persist(objeto));
	}

	@Override
	public void update(Usuario objeto) {
		ExecuteInsideTrasaction(em->em.merge(objeto));
	}

	@Override
	public void delete(Usuario objeto) {
		ExecuteInsideTrasaction(em->em.remove(objeto));
	}
}

