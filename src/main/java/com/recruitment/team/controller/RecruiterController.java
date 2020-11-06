package com.recruitment.team.controller;

import java.io.IOException;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.recruitment.team.model.entity.Recruiter;
import com.recruitment.team.model.service.RecruiterService;

@WebServlet(urlPatterns= {"/login","/recruiter-add"},loadOnStartup = 1)
public class RecruiterController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private RecruiterService recruiterService;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		super.init(config);
		EntityManagerFactory EMF=null;
		Object obj=getServletContext().getAttribute("emf");
		if(obj==null)
		{
			EMF=Persistence.createEntityManagerFactory("jsp-jpa-recruiter");
			getServletContext().setAttribute("emf", EMF);
			
		}else
		{
			EMF=(EntityManagerFactory) obj;
		}
		recruiterService=new RecruiterService(EMF.createEntityManager());
	}
	
	@Override
	public void destroy() {
		EntityManagerFactory emf=(EntityManagerFactory) getServletContext().getAttribute("emf");
		if(emf!=null && emf.isOpen())
			emf.close();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action=req.getServletPath();
		if("/recuiter-add".equals(action))
		{
			//get data from request
			String id=req.getParameter("recruiterid");
			String name=req.getParameter("name");
			String phone=req.getParameter("phone");
			String email=req.getParameter("email");
			String password=req.getParameter("password");
			
			//create  obj
			Recruiter recruiter=(id==null || id.equals("") ? new Recruiter() : recruiterService.findById(Integer.parseInt(id)));
			
			recruiter.setName(name);
			recruiter.setPhone1(phone);
			recruiter.setEmail(email);
			recruiter.setPassword(password);
			
			//insert to db
			RecruiterService.save(recruiter);
			
			//set to request
			req.setAttribute("recruiters", recruiter);
			
			//redirect page
			resp.sendRedirect(req.getContextPath().concat("/recruiters"));
		}
		else if("/login".equals(action))
		{
			String email=req.getParameter("email");
			String password=req.getParameter("password");
			try
			{
				Recruiter recruiter=recruiterService.login(email,password);
				HttpSession session=req.getSession(true);
				session.setAttribute("loginuser", recruiter);
				
				resp.sendRedirect(req.getContextPath().concat("/dashboard.jsp"));
				
			}catch(NoResultException e)
			{
				req.setAttribute("message", "Invalid Login User");
				getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
			}
		}
	}

}
