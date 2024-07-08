package com.chainsys.urbannestrealty.controller;


import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.chainsys.urbannestrealty.dao.UserDAO;
import com.chainsys.urbannestrealty.model.Property;
import com.chainsys.urbannestrealty.model.Sales;

import jakarta.servlet.http.HttpSession;


@Controller
public class PropertiesController 
{
	@Autowired 
	UserDAO userDAO;
	
	
	@PostMapping("/PropertyRegistration")
	public String saveUserDetails(@RequestParam("sellerId") String sellerId ,@RequestParam ("propertyName") String propertyName ,@RequestParam("propertyId") String propertyId ,@RequestParam ("registeredDate") String registeredDate, @RequestParam ("propertyPrice") long propertyPrice, @RequestParam ("propertyImages") MultipartFile propertyImages, @RequestParam("propertyDocument") MultipartFile propertyDocument, @RequestParam("propertyAddress") String propertyAddress, @RequestParam("propertyDistrict") String propertyDistrict, @RequestParam("propertyState") String propertyState, HttpSession httpSession) throws IOException
	{
		if(!propertyImages.isEmpty() && !propertyDocument.isEmpty())
		{
			
		Property property = new Property();
		byte[] imagebytes = propertyImages.getBytes();
		byte[] documetnImages = propertyDocument.getBytes();
		
		property.setSellerId(sellerId);
		property.setPropertyName(propertyName);
		property.setPropertyId(propertyId);
		property.setRegisteredDate(registeredDate);
		property.setPropertyPrice(propertyPrice);
		property.setPropertyAddress(propertyAddress);
		property.setPropertyImages(imagebytes);
		property.setPropertyDocument(documetnImages);
		property.setPropertyDistrict(propertyDistrict);
		property.setPropertyState(propertyState);
		property.setApproval("Not Approved");
		property.setCustomerId("Not Purchased");
		property.setRegisterStatus("Not Registered");
		property.setPaymentStatus("Not Paid");
		
		httpSession.setAttribute("sellerId", sellerId);
		httpSession.setAttribute("propertyName", propertyName);
		
		userDAO.property(property);
		}
		else
		{
			return "PropertyRegistration.jsp";
		}
		
		return "SuccessPage3.jsp";
	}
	
	
	@RequestMapping("/RegisteredProperties")
	public String registeredPropertiesRetrive(Model model, HttpSession session)
	{
		String id = (String)session.getAttribute("sellerId");
		List<Property> list = userDAO.sellerRegisteredProperties(id);
		model.addAttribute("list",list);
		return "PropertiesTableSellerView.jsp";
	}
	
	@GetMapping("/PendingProperty")
	public String pendingProperties(Model model)
	{
		List<Property> list = userDAO.pendingProperty();
		model.addAttribute("list",list);
		return "RegisteredPropertyAdminView.jsp";
	}
	
	@GetMapping("/Authorized")
	public String authorized(Model model)
	{
		List<Property> list = userDAO.authorizedProperties();
		model.addAttribute("list",list);
		return "RegisteredPropertiesTable.jsp";
	}
	
	@PostMapping("/Approval")
	public String approval(@RequestParam("address") String address, @RequestParam("approvalStatus") String approvalStatus, Model model)
	{
		Property property = new Property();
		
		property.setApproval(approvalStatus);
		property.setPropertyAddress(address);
		
		userDAO.approval(property);
		
		List<Property> list = userDAO.pendingProperty();
		model.addAttribute("list",list);
		return "RegisteredPropertyAdminView.jsp";
	}
	
	@RequestMapping("/Residential")
	public String residential(Model model)
	{
		List<Property> list = userDAO.residential();
		model.addAttribute("list",list);
		return "PropertyTableForUserDisplay.jsp";
	}
	
	@RequestMapping("/Land")
	public String land(Model model)
	{
		List<Property> list = userDAO.land();
		model.addAttribute("list",list);
		return "PropertyTableForUserDisplay.jsp";
	}
	
	@RequestMapping("/Industrial")
	public String industrial(Model model)
	{
		List<Property> list = userDAO.industrial();
		model.addAttribute("list",list);
		return "PropertyTableForUserDisplay.jsp";
	}
	
	@RequestMapping("/Commercial")
	public String commercial(Model model)
	{
		List<Property> list = userDAO.commercial();
		model.addAttribute("list",list);
		return "PropertyTableForUserDisplay.jsp";
	}

	@GetMapping("/RegisterStatus")
	public String registerStatus(@RequestParam("address") String address, @RequestParam("registerStatus") String registerStatus, Model model)
	{
		userDAO.registerUpdate(address, registerStatus);
		List<Property> list = userDAO.authorizedProperties();
		model.addAttribute("list",list);
		return "RegisteredPropertiesTable.jsp";
	}
	
	@RequestMapping("/ClosedDeals")
	public String registeredProperties(Model model)
	{
		List<Property> list = userDAO.registeredProperties();
		model.addAttribute("list", list);
		return "RetrivePropertiesTable.jsp";
	}
	
	@RequestMapping("/CompletedDeals")
	public String completedDeals(Model model, HttpSession session)
	{
		String id = (String)session.getAttribute("sellerId");
		List<Sales> list = userDAO.completedDeals(id);
		model.addAttribute("list", list);
		return "PaidTable.jsp";
	}
}