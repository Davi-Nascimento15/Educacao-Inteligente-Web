package com.educacaointeligente.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.function.Consumer;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

import com.educacaointeligente.model.Aluno;
import com.educacaointeligente.model.Disciplina;
import com.educacaointeligente.model.Turma;

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
		return em.createQuery("From Aluno Order By nome ASC",Aluno.class).getResultList();
	}
	
	public List<Aluno> getAllEscola(int id) {
		return em.createQuery("From Aluno where escola_idEscola="+id,Aluno.class).getResultList();
	}
	
	@Override
	public List<Aluno> getAllWhere(int id) {
		return em.createQuery("From Aluno Where idAluno="+id,Aluno.class).getResultList();
	}
	
	public List<Aluno> getAllWhereTurma(List<Disciplina>disciplina,int Escola,int Professor){
		TurmaDao turmadao = new TurmaDao();
		List<Turma> turma = turmadao.getAllEscola(Escola);
		List<Aluno> turmaaux = new ArrayList<Aluno>();
		for(Turma T: turma) {
		  for(Disciplina D:disciplina){
			  for(Disciplina DT:T.getListadisciplina()) {
				  if(D.getIddisciplina()==DT.getIddisciplina()) {
					  int c=0;
					  for(Aluno A:T.getAluno()){
						 for(Aluno aux:turmaaux) {
						    if(aux.getIdaluno()==A.getIdaluno())
						    	c++;
						 }if(c==0){
							 turmaaux.add(A);
						}
					  }
					  break;
				  }
			  }
		  }  
		}
		return turmaaux;
	}
	
	@Override
	public List<Aluno> getAllNome(String A) {
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

	@Override
	public Aluno getString(String id) {
		// TODO Auto-generated method stub
		return null;
	}


}