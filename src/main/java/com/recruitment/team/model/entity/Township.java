package com.recruitment.team.model.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.*;


/**
 * Entity implementation class for Entity: Township
 *
 */
@Entity
@NamedQuery(name="Township.getAll",query="select t from Township t")
public class Township implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	@OneToMany(mappedBy = "township")
	private List<Company> company;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	private static final long serialVersionUID = 1L;

	public Township() {
		super();
	}
   
}
