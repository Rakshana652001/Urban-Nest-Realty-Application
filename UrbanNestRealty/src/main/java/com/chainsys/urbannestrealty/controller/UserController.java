package com.chainsys.urbannestrealty.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chainsys.urbannestrealty.dao.UserDAO;
import com.chainsys.urbannestrealty.model.User;
import com.chainsys.urbannestrealty.validation.Validation;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController
{
	@Autowired 
	UserDAO userDAO;
	@Autowired
	Validation validation;
	
	@RequestMapping("/")
	public String home()
	{        
		return "Home.jsp";
	}
	
	@PostMapping("/UserRegistration")
	public String saveUserDetails(@RequestParam("generatedUserID") String generatedUserID ,@RequestParam ("name") String name ,@RequestParam("phoneNumber") long phoneNumber ,@RequestParam ("designation") String designation, @RequestParam ("emailID") String emailID, @RequestParam ("password") String password, @RequestParam("district") String district, @RequestParam("state") String state, @RequestParam("address") String address, Model model)
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
		
		if(Boolean.FALSE.equals(validation.nameValidation(name, model))||Boolean.FALSE.equals(validation.phoneNumberValidation(phoneNumber,model))||Boolean.FALSE.equals(validation.emailValidation(emailID, model))||Boolean.FALSE.equals(validation.passwordValidation(password,model)))
		{
			
			return "UserRegistration.jsp";
		}
		else
		{
			userDAO.saveUserDetails(user);
			return "SuccessPage.jsp";
		}
		
	}
	
	@PostMapping("/Login")
	public String login(@RequestParam("generatedUserID") String generatedUserID, @RequestParam("password") String password, HttpSession httpSession, Model model)
	{
		try
		{
			if(generatedUserID.equals("UNR_Admin_1"))
			{
				if(password.equals(userDAO.getAdminpassword(generatedUserID)) || Boolean.FALSE.equals(validation.passwordValidation(password,model)))
				{
					httpSession.setAttribute("UNR_Admin_1", generatedUserID);
					return "AdminWelcomePage.jsp";
				}
				else
				{
					return "AdminLogin.jsp";
				}
			}
			else if(generatedUserID.equals(userDAO.getsellerId(generatedUserID)))
			{
				if(password.equals(userDAO.getsellerPassword(generatedUserID))||Boolean.FALSE.equals(validation.passwordValidation(password,model)))
				{
					httpSession.setAttribute("sellerId", generatedUserID);
					return "SellerWelcomePage.jsp";
				}
				else
				{
					return "AdminLogin.jsp";
				}
			}
			else if(generatedUserID.equals(userDAO.getcustomerId(generatedUserID)))
			{
				if(password.equals(userDAO.getCustomerPassword(generatedUserID))||Boolean.FALSE.equals(validation.passwordValidation(password,model)))
				{
					httpSession.setAttribute("customerId", generatedUserID);
					return "CustomerWelcomePage.jsp";
				}
				else
				{
					return "AdminLogin.jsp";
				}				
			}
			else
			{
				return "AdminLogin.jsp";
			}	
		}
		catch (EmptyResultDataAccessException e) {
	        return "AdminLogin.jsp";
	    }
	}
	
	@GetMapping("/AdminProfile")
	public String adminProfile(Model model)
	{
		List<User> list = userDAO.retriveAdminDetails();
		model.addAttribute("list", list);
		return "AdminProfile.jsp";
	}
	
	@GetMapping("/SellerProfile")
	public String sellerProfile(Model model, HttpSession httpSession)
	{
		String id = (String) httpSession.getAttribute("sellerId");
		List<User> list = userDAO.retriveSellerProfile(id);
		model.addAttribute("list", list);
		return "SellerProfile.jsp";
	}
	
	@GetMapping("/CustomerProfile")
	public String customerProfile(Model model, HttpSession httpSession)
	{
		String id = (String) httpSession.getAttribute("customerId");
		List<User> list = userDAO.retriveCustomerDetails(id);
		model.addAttribute("list", list);
		return "CustomerProfile.jsp";
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
	
	@PostMapping("/UpdateCustomer")
	public String updateCustomer(@RequestParam("phoneNumber") long phoneNumber, @RequestParam("password") String password, @RequestParam("address") String address, @RequestParam("name") String name, Model model,HttpSession httpSession)
	{
		User user = new User();
		
		user.setPhoneNumber(phoneNumber);
		user.setPassword(password);
		user.setAddress(address);
		user.setName(name);
		
		userDAO.updateCustomerdetails(user);
		
		String id = (String) httpSession.getAttribute("customerId");
		List<User> list = userDAO.retriveCustomerDetails(id);
		model.addAttribute("list", list);
		return "CustomerProfile.jsp";		
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
		return "SellerList.jsp";
	}
	
	@PostMapping("/deleteseller")
	public String delete(@RequestParam ("deleteName") String name, Model model)
	{
		User user = new User();
		user.setName(name);
		
		userDAO.delete(user);
		
		List<User> list = userDAO.sellerCustomerDetails();
		model.addAttribute("list",list);
		return "SellerList.jsp";
	}
	
	@GetMapping("/CustomerDetails")
	public String CustomerDetails(Model model)
	{
		List<User> list = userDAO.customerDetails();
		model.addAttribute("list",list);
		return "CustomerList.jsp";
	}
	
	
	@PostMapping("/deletecustomer")
	public String deletecustomer(@RequestParam ("deleteName") String name, Model model)
	{
		User user = new User();
		user.setName(name);
		
		userDAO.delete(user);
		
		List<User> list = userDAO.customerDetails();
		model.addAttribute("list",list);
		return "CustomerList.jsp";
	}
	
	@GetMapping("/SellerSearch")
	public String Search(@RequestParam("id") String id, Model model)
	{
		List<User> list = userDAO.sellerSearch(id);
		model.addAttribute("list",list);
		return "SellerList.jsp";
	}
	
	@GetMapping("/CustomerSearch")
	public String customerSearch(@RequestParam("id") String id, Model model)
	{
		List<User> list = userDAO.customerSearch(id);
		model.addAttribute("list",list);
		return "CustomerList.jsp";
	}
	
	
}