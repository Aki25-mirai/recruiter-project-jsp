package com.recruitment.team.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.recruitment.team.model.entity.Company;
import com.recruitment.team.model.entity.Township;
import com.recruitment.team.model.service.CompanyService;
import com.recruitment.team.model.service.RecruiterService;
import com.recruitment.team.model.service.TownshipService;

@WebServlet({"/company","/company-add","/company-edit","/company-delete","/companylist"})
public class CompanyController extends HttpServlet{

	private CompanyService companyService;
	private TownshipService townshipService;
	private RecruiterService recruiterService;
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
		companyService =new CompanyService(EMF.createEntityManager());
		townshipService =new TownshipService(EMF.createEntityManager());
		recruiterService =new RecruiterService(EMF.createEntityManager());
	}
	
	@Override
	public void destroy() {
		EntityManagerFactory emf=(EntityManagerFactory) getServletContext().getAttribute("emf");
		if(emf!=null && emf.isOpen())
			emf.close();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String path=req.getServletPath();
		if("/company-edit".equals(path)) {
			//get student list from db
			
			List<Township> townshiplist=townshipService.findAll();
			//add list to request
			req.setAttribute("township", townshiplist);
			
			if("/company-edit".equals(path)) {
				//get reg id from req
				String id=req.getParameter("id");
				
				//find registration to req
				Company obj=companyService.findById(Integer.parseInt(id));
				//add registration to req
				
				req.setAttribute("companies", obj);
				
				
			}
			
			//forward page
			getServletContext().getRequestDispatcher("/company-add.jsp").forward(req,resp);
		
		}
		else if("/company".equals(path))
		{
			//get items from db
			List<Company> list=companyService.findAll();
			//add items to req
			req.setAttribute("companies", list);
			//forward page
			getServletContext().getRequestDispatcher("/company.jsp").forward(req, resp);
		}
		else if("/company-delete".equals(path))
		{
			//get id from req data
			String id=req.getParameter("id");
			
			//remove from db
			companyService.delete(Integer.parseInt(id));
			
			//redirect page
			resp.sendRedirect(req.getContextPath().concat("/company"));
		}
		else if("/companylist".equals(path))
		{
			
			//List<Recruiter> recruiterlist=recruiterService.findAll();
			List<Township> townshiplist=townshipService.findAll();
			
			//add list to request
			
			//req.setAttribute("recruiter", recruiterlist);
			req.setAttribute("township", townshiplist);
			//forward page
			getServletContext().getRequestDispatcher("/company-add.jsp").forward(req,resp);
		
		}
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action=req.getServletPath();
		if("/company-add".equals(action)) {
			//get data from request
			String id=req.getParameter("id");
			String name=req.getParameter("name");
			String phone1=req.getParameter("phone1");
			String phone2=req.getParameter("phone2");
			String email=req.getParameter("email");
			String website=req.getParameter("website");
			String ownername=req.getParameter("ownername");
			String address=req.getParameter("address");
			String township=req.getParameter("townshipid");
			String entryBy=req.getParameter("entryby");
			String entryDate=req.getParameter("entrydate");
			String modifyBy=req.getParameter("modifyby");
			String modifyDate=req.getParameter("modifydate");
			String remark=req.getParameter("remark");
			
			//create registration  obj
			
			Company com=(id==null || id.equals("") ? new Company():companyService.findById(Integer.parseInt(id)));
			com.setName(name);
			com.setPhone1(phone1);
			com.setPhone2(phone2);
			com.setEmail(email);
			com.setWebsite(website);
			com.setOwnerName(ownername);
			com.setAddress(address);
			com.setTownship(townshipService.findById(Integer.parseInt(township)));
			com.setEntryBy(recruiterService.findById(Integer.parseInt(entryBy)));
			com.setEntryDate(LocalDate.parse(entryDate));
			com.setModifyBy(recruiterService.findById(Integer.parseInt(modifyBy)));
			com.setModifyDate(LocalDate.parse(modifyDate));
			com.setRemark(remark);
			
			//insert to db
			companyService.save(com);
			//redirect page
			resp.sendRedirect(req.getContextPath().concat("/companies"));
			
		}
	}
}
