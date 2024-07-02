package com.chainsys.urbannestrealty.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.chainsys.urbannestrealty.dao.UserDAO;
import com.chainsys.urbannestrealty.model.PropertyRegistration;

@Controller
public class PropertiesController 
{
	@Autowired 
	UserDAO userDAO;
	
	@PostMapping("/PropertyRegistration")
	public String saveUserDetails(@RequestParam("sellerId") String sellerId ,@RequestParam ("propertyName") String propertyName ,@RequestParam("propertyId") String propertyId ,@RequestParam ("registeredDate") String registeredDate, @RequestParam ("propertyPrice") long propertyPrice, @RequestParam ("propertyImages") MultipartFile propertyImages, @RequestParam("propertyDocument") MultipartFile propertyDocument, @RequestParam("propertyAddress") String propertyAddress, @RequestParam("propertyDistrict") String propertyDistrict, @RequestParam("propertyState") String propertyState)
	{
		PropertyRegistration propertyRegistration = new PropertyRegistration();
		
		propertyRegistration.setSellerId(sellerId);
		propertyRegistration.setPropertyName(propertyName);
		propertyRegistration.setPropertyId(propertyId);
		propertyRegistration.setRegisteredDate(registeredDate);
		propertyRegistration.setPropertyPrice(propertyPrice);
		propertyRegistration.setPropertyImages(propertyImages);
		propertyRegistration.setPropertyDocument(propertyDocument);
		propertyRegistration.setPropertyAddress(propertyAddress);
		propertyRegistration.setPropertyDistrict(propertyDistrict);
		propertyRegistration.setPropertyState(propertyState);
		propertyRegistration.setApproval("Not Approved");
		propertyRegistration.setPurchasedDate("Not Purchased");
		propertyRegistration.setCustomerId("Not Purchased");
		propertyRegistration.setRegisterStatus("Not Registered");
		propertyRegistration.setPaymentStatus("Not Paid");
		
		
		userDAO.propertyRegistration(propertyRegistration);
		
		return "AfterRegister.jsp";
	}

}
