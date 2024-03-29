package com.educacaointeligente.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.function.Consumer;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

import com.educacaointeligente.model.Disciplina;
import com.educacaointeligente.model.Nota;
import com.educacaointeligente.model.Turma;

public class NotaDao implements Dao<Nota> {
	private EntityManager em;
    
    public NotaDao(){
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
	public Nota get(int id) {	
		return em.find(Nota.class,id);
	}

	@Override
	public List<Nota> getAll() {
		return em.createQuery("From Nota Order By bimestre ASC",Nota.class).getResultList();
	}
	
	@Override
	public List<Nota> getAllWhere(int id) {
		
		return em.createQuery("From Nota Where nota_id="+id,Nota.class).getResultList();
	}
	
	public List<Nota> getAllWhereNota(List<Disciplina>disciplina) {
        List<Nota> nota= new ArrayList<Nota>();
        for(Disciplina D:disciplina) {
        	List<Nota> aux = new ArrayList<Nota>(); 
        	aux= em.createQuery("From Nota  Where disciplina_idDisciplina="+D.getIddisciplina(),Nota.class).getResultList();
            nota.addAll(aux);
        }
		return nota;
	}
	
	@Override
	public void save (Nota objeto) {
		ExecuteInsideTrasaction(em->em.persist(objeto));
	}

	@Override
	public void update(Nota objeto) {
		ExecuteInsideTrasaction(em->em.merge(objeto));
	}

	@Override
	public void delete(Nota objeto) {
		ExecuteInsideTrasaction(em->em.remove(objeto));
	}

	@Override
	public List<Nota> getNome(String objeto) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<Nota> getAllNome(String objeto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Nota getString(String id) {
		// TODO Auto-generated method stub
		return null;
	}
}

