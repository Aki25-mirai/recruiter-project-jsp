package com.recruitment.team.model.service;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

import com.recruitment.team.model.entity.Recruiter;

public class RecruiterService {
	private static EntityManager em;
	
	public RecruiterService(EntityManager em) {
		this.em=em;
	}

	public Recruiter findById(int id) {
		
		return em.find(Recruiter.class, id);
	}

	public static void save(Recruiter recruiter) {
		em.getTransaction().begin();
		if(recruiter.getId()==0)
			em.persist(recruiter);
		else
			em.merge(recruiter);
		
		em.getTransaction().commit();
		
	}

	public List<Recruiter> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	public Recruiter login(String email, String pass)throws NoResultException{
		TypedQuery<Recruiter> query=em.createQuery("SELECT r FROM Recruiter r WHERE r.email = :email AND r.password = :pass",Recruiter.class);
		query.setParameter("email", email);
		query.setParameter("pass", pass);
		return query.getSingleResult();
	}

}
