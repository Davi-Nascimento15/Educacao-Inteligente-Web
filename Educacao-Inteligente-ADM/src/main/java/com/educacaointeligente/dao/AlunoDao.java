package com.educacaointeligente.dao;

import java.sql.PreparedStatement;
import java.util.List;
import java.util.function.Consumer;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

import com.educacaointeligente.model.Aluno;

public class AlunoDao implements Dao<Aluno> {
	private EntityManager em;
    
    public AlunoDao(){
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
	public Aluno get(int id) {	
		return em.find(Aluno.class,id);
	}

	@Override
	public List<Aluno> getAll() {
		return em.createQuery("From Aluno",Aluno.class).getResultList();
	}
	
	@Override
	public List<Aluno> getAllWhere(String A) {
		return em.createNamedQuery("Aluno.buscaporNome", Aluno.class)
		        .setParameter("variavel","%"+A+"%")
		        .getResultList();
	}
	
	@Override
	public void save (Aluno objeto) {
		ExecuteInsideTrasaction(em->em.persist(objeto));
	}

	@Override
	public void update(Aluno objeto) {
		ExecuteInsideTrasaction(em->em.merge(objeto));
	}

	@Override
	public void delete(Aluno objeto) {
		ExecuteInsideTrasaction(em->em.remove(objeto));
	}

	@Override
	public List<Aluno> getNome(String objeto) {
		// TODO Auto-generated method stub
		return null;
	}


}