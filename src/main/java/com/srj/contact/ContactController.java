package com.srj.contact;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


@Controller
@Component
@RequestMapping("/contact")
public class ContactController 
{
	
		@Autowired
		ContactDAO contactDAO;
		

		@RequestMapping("/addContact")
		public ModelAndView add_Contact(Model model)
		{	 
			return new ModelAndView("ContactNew");
		}
		
		
		@RequestMapping(value="/contactList")
		public ModelAndView contactList(Model model)
		{
			Map<String, Object> map = new HashMap<String, Object>();
			
			List legacyDataList=contactDAO.getListContact();
			model.addAttribute("legacyDataList",legacyDataList);   
		    return new ModelAndView("contactList");
		}
		
		

		@RequestMapping(value="/saveContact" , method=RequestMethod.POST)
		public @ResponseBody ContactModel saveContact(@RequestBody ContactModel developerData ,Model model,HttpServletResponse response) throws IOException
		{
				String saveResult = contactDAO.saveDetailsForContact(developerData);
				System.out.println("in save---"+saveResult);
				String msg=saveResult.substring(0,4);
				developerData.setFname(msg);
				return developerData;
		}
		

		@RequestMapping(value = "/editContact")
		public ModelAndView editContact(@RequestParam("id") String id,HttpServletRequest request,Model mod) {
		    int contactId = Integer.parseInt(request.getParameter("id"));
		    ContactModel contact = contactDAO.get(contactId);
		    ModelAndView model = new ModelAndView("ContactNew");
		    mod.addAttribute("contact",contact);
		   
		    return model;
		}

		@RequestMapping(value = "/deleteContact", method = RequestMethod.GET)
		public ModelAndView deleteContact(HttpServletRequest request,Model model) {
		    int contactId = Integer.parseInt(request.getParameter("id"));
		    contactDAO.delete(contactId);
		    List legacyDataList=contactDAO.getListContact();

			model.addAttribute("legacyDataList",legacyDataList);   
		    return new ModelAndView("contactList");
		}
		
}
