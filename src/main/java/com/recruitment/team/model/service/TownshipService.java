package com.recruitment.team.model.service;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import com.recruitment.team.model.entity.Township;

public class TownshipService {
	
	private static EntityManager em;
	
	public TownshipService(EntityManager em) {
		
		this.em=em;
	}
	public List<Township> findAll() {
		
		TypedQuery<Township> query=em.createNamedQuery("Township.getAll",Township.class);
		List<Township> list=query.getResultList();
		return list;
	}

	public Township findById(int id) {
		
		return em.find(Township.class, id);
	}

	public void save(Township t) {
		
		em.getTransaction().begin();
		if(t.getId()==0)
			em.persist(t);
		else
			em.merge(t);
		
		em.getTransaction().commit();
		
		
	}

	public void delete(int id) {
		
		em.getTransaction().begin();
		
		Township c=em.find(Township.class,id);
		
		em.remove(c);
		
		em.getTransaction().commit();
		
	}

}
