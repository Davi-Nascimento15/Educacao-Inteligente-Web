package com.educacaointeligente.dao;

import java.util.List;
import java.util.function.Consumer;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

import com.educacaointeligente.model.Professor;

public class ProfessorDao implements Dao<Professor> {
	private EntityManager em;
    
    public ProfessorDao(){
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
	public Professor get(int id) {	
		return em.find(Professor.class,id);
	}

	@Override
	public List<Professor> getAll() {
		return em.createQuery("From Professor Order By nome ASC",Professor.class).getResultList();
	}
	
	@Override
	public List<Professor> getAllWhere(int id) {
		
		return em.createQuery("From Professor Where professor_id="+id,Professor.class).getResultList();
	}

	public Professor getAllUsuarioProfessor(int id) {
		
		return em.createQuery("From Professor Where usuario_idmatricula="+id,Professor.class).getSingleResult();
	}

	public List<Professor> getAllWhereEscola(int id) {
		return em.createQuery("From Professor where escola_idEscola="+id+" Order By nome ASC",Professor.class).getResultList();
	}
	
	@Override
	public void save (Professor objeto) {
		ExecuteInsideTrasaction(em->em.persist(objeto));
	}

	@Override
	public void update(Professor objeto) {
		ExecuteInsideTrasaction(em->em.merge(objeto));
	}

	@Override
	public void delete(Professor objeto) {
		ExecuteInsideTrasaction(em->em.remove(objeto));
	}

	@Override
	public List<Professor> getNome(String objeto) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<Professor> getAllNome(String objeto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Professor getString(String id) {
		// TODO Auto-generated method stub
		return null;
	}
}

