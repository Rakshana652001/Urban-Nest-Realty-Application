package com.chainsys.urbannestrealty.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chainsys.urbannestrealty.dao.UserDAO;
import com.chainsys.urbannestrealty.model.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController
{
	@Autowired 
	UserDAO userDAO;
	
	@RequestMapping("/")
	public String home()
	{        
		return "home.jsp";
	}
	
	@PostMapping("/UserRegistration")
	public String saveUserDetails(@RequestParam("generatedUserID") String generatedUserID ,@RequestParam ("name") String name ,@RequestParam("phoneNumber") long phoneNumber ,@RequestParam ("designation") String designation, @RequestParam ("emailID") String emailID, @RequestParam ("password") String password, @RequestParam("district") String district, @RequestParam("state") String state, @RequestParam("address") String address)
	{
		User user = new User();
		
		user.setGeneratedUserID(generatedUserID);
		user.setName(name);
		user.setPhoneNumber(phoneNumber);
		user.setDesignation(designation);
		user.setEmailID(emailID);
		user.setPassword(password);
		user.setDistrict(district);
		user.setState(state);
		user.setAddress(address);
		
		userDAO.saveUserDetails(user);
		
		return "AfterRegister.jsp";
	}
	
	@PostMapping("/Login")
	public String login(@RequestParam("generatedUserID") String generatedUserID, @RequestParam("password") String password, HttpSession httpSession)
	{
		try
		{
			if(generatedUserID.equals("UNR_Admin_1"))
			{
				if(password.equals(userDAO.getAdminpassword(generatedUserID)))
				{					
					httpSession.setAttribute("UNR_Admin_1", generatedUserID);
					return "AdminWelcomePage.jsp";
				}
				else
				{
					return "AdminLogin.jsp";
				}
			}
			else if(generatedUserID.equals(userDAO.getGeneratedId(generatedUserID)))
			{
				if(password.equals(userDAO.getsellerPassword(generatedUserID)))
				{
					httpSession.setAttribute("sellerId", generatedUserID);
					return "SellerWelcomePage.jsp";
				}
				else if(password.equals(userDAO.getCustomerPassword(generatedUserID)))
				{
					httpSession.setAttribute("customerId", generatedUserID);
					return "CustomerWelcomePage.jsp";
				}
			}			
		}
		
		catch (Exception e) 
		{
			System.out.println(e);
		}
		return "AdminLogin.jsp";
	}
	
	@GetMapping("/AdminProfile")
	public String adminProfile(Model model)
	{
		List<User> list = userDAO.retriveAdminDetails();
		model.addAttribute("list", list);
		return "AdminProfile.jsp";
	}
	
	@PostMapping("/UpdateAdminDetails")
	public String updateAdmin(@RequestParam("phoneNumber") long phoneNumber, @RequestParam("password") String password, @RequestParam("address") String address, @RequestParam("name") String name, Model model)
	{
		User user = new User();
		
		user.setPhoneNumber(phoneNumber);
		user.setPassword(password);
		user.setAddress(address);
		user.setName(name);
		userDAO.updateAdmindetails(user);
		
		List<User> list = userDAO.retriveAdminDetails();
		model.addAttribute("list", list);
		return "AdminProfile.jsp";
		
	}
	
	
	@PostMapping("/UpdateSeller")
	public String updateSeller(@RequestParam("phoneNumber") long phoneNumber, @RequestParam("password") String password, @RequestParam("address") String address, @RequestParam("name") String name, Model model,HttpSession httpSession)
	{
		User user = new User();
		
		user.setPhoneNumber(phoneNumber);
		user.setPassword(password);
		user.setAddress(address);
		user.setName(name);
		userDAO.updateSellerdetails(user);
		
		String id = (String)httpSession.getAttribute("sellerId");
		
		List<User> list = userDAO.retriveSellerProfile(id);
		model.addAttribute("list", list);
		return "SellerProfile.jsp";
		
	}

	@GetMapping("/SellerCustomerDetails")
	public String SellerCustomerDetails(Model model)
	{
		List<User> list = userDAO.sellerCustomerDetails();
		model.addAttribute("list",list);
		return "UsersTable.jsp";
	}
	
	@GetMapping("/CustomerDetails")
	public String CustomerDetails(Model model)
	{
		List<User> list = userDAO.customerDetails();
		model.addAttribute("list",list);
		return "UsersTable.jsp";
	}
	
	@GetMapping("/Search")
	public String Search(@RequestParam("id") String id, Model model)
	{
		List<User> list = userDAO.search(id);
		model.addAttribute("list",list);
		return "UsersTable.jsp";
	}
	
	@GetMapping("/SellerProfile")
	public String sellerProfile(Model model, HttpSession httpSession)
	{
		String id = (String) httpSession.getAttribute("sellerId");
		List<User> list = userDAO.retriveSellerProfile(id);
		model.addAttribute("list", list);
		return "SellerProfile.jsp";
	}
	
	
}