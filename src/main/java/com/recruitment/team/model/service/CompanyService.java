package com.recruitment.team.model.service;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import com.recruitment.team.model.entity.Company;

public class CompanyService {

	private static EntityManager em;
	public CompanyService(EntityManager em) {
		
		this.em=em;
	}
	
	public Company findById(int id) {
		
		return em.find(Company.class,id);
	}
	
	public List<Company> findAll() {
		TypedQuery<Company> query=em.createNamedQuery("Company.getAll",Company.class);
		List<Company> list=query.getResultList();
		return list;
	}
	
	public void delete(int id) {
		
		em.getTransaction().begin();
		
		Company c=em.find(Company.class,id);
		
		em.remove(c);
		
		em.getTransaction().commit();
	}

	public void save(Company com) {
		
		em.getTransaction().begin();
		
		if(com.getId()==0) em.persist(com);
		else em.merge(com);
		em.getTransaction().commit();
		
	}

}
