package com.recruitment.team.controller;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.recruitment.team.model.entity.Township;
import com.recruitment.team.model.service.TownshipService;

@WebServlet({"/township","/township-add","/township-edit","/township-delete"})
public class TownshipController extends HttpServlet{
	
	private TownshipService townshipService;
	
	private static final long serialVersionUID = 1L;
	
	
public void init(ServletConfig config) throws ServletException {
	
		
		super.init(config);
		EntityManagerFactory EMF=null;
		Object obj=getServletContext().getAttribute("emf");//application scope
		
		if(obj==null)
		{
			EMF=Persistence.createEntityManagerFactory("jsp-jpa-recruiter");
			getServletContext().setAttribute("emf", EMF);
		}
		else
		{
			EMF=(EntityManagerFactory) obj;
		}
		
		
	
	}
	
	@Override
	public void destroy() {
		EntityManagerFactory emf=(EntityManagerFactory) getServletContext().getAttribute("emf");
		if(emf!=null && emf.isOpen())
			emf.close();
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path=req.getServletPath();
		if("/township-add".equals(path)) {
			
			String id=req.getParameter("id");
			String name=req.getParameter("name");
			
			//create object
			
			Township t=(id==null || id.equals("") ? new Township():townshipService.findById(Integer.parseInt(id)));
			t.setName(name);
			
			//add to db
			
			townshipService.save(t);
			//set to request
			req.setAttribute("township",t);
			//redirect page
			
			resp.sendRedirect(req.getContextPath().concat("/township"));
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path=req.getServletPath();
		if("/township".equals(path)) {
			List<Township> list=townshipService.findAll();
			//set to request
			
			req.setAttribute("townships",list);
			//forward
			getServletContext().getRequestDispatcher("/township.jsp").forward(req,resp);
		
		}else if("/township-add".equals(path)||"/student-edit".equals(path)) {
			//get data from db
			
			List<Township> list=townshipService.findAll();
			
			//set data to req
			req.setAttribute("townships",list);
			
		 if("/township-edit".equals(path)) {
			//get id from request 
			String id=req.getParameter("id");
			
			//get data from db
			
			Township t=townshipService.findById(Integer.parseInt(id));
			
			//set data to req
			
			req.setAttribute("townships", t);
			
		 }
		//forward page
			
			getServletContext().getRequestDispatcher("/township-add.jsp").forward(req, resp);
			
		}else if("/township-delete".equals(path)){
			String id=req.getParameter("id");
			
			townshipService.delete(Integer.parseInt(id));
			resp.sendRedirect(req.getContextPath().concat("/township"));
			
	
	}
	}
	
	

}
