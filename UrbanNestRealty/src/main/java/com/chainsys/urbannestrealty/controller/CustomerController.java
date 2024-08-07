package com.chainsys.urbannestrealty.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.chainsys.urbannestrealty.dao.UserDAO;
import com.chainsys.urbannestrealty.model.Property;
import com.chainsys.urbannestrealty.model.Sales;
import com.chainsys.urbannestrealty.validation.Validation;

import jakarta.servlet.http.HttpSession;

@Controller
public class CustomerController 
{
	@Autowired
	UserDAO userDAO;
	@Autowired
	Validation validation;
	
	@PostMapping("/Purchase")
	public String purchase(@RequestParam("customerId") String customerId, @RequestParam("governmentId") MultipartFile governmentId, @RequestParam("sellerId") String sellerId, @RequestParam("propertyId") String propertyId, @RequestParam("propertyName") String propertyName, @RequestParam("propertyAddress") String propertyAddress, @RequestParam("propertyPrice") long propertyPrice, @RequestParam("payableAmount") double payableAmount, @RequestParam("paymentMethod") String paymentMethod, HttpSession httpSession) throws IOException
	{
		Sales sale = new Sales();
		if(!governmentId.isEmpty())
		{
			byte[] govId = governmentId.getBytes();
			
			sale.setCustomerId(customerId);
			sale.setGovernmentId(govId);
			sale.setSellerId(sellerId);
			sale.setPropertyId(propertyId);
			sale.setPropertyName(propertyName);
			sale.setPropertyAddress(propertyAddress);
			sale.setTotalAmount(propertyPrice);
			sale.setPayableAmount(payableAmount);
			sale.setPaymentMethod(paymentMethod);
			sale.setApproval("Not Approved");
			sale.setPaidStatus("Not Paid");		
			
			httpSession.setAttribute("propertyAddress", propertyAddress);
			userDAO.sale(sale);
			userDAO.updateCustomerId(customerId, propertyAddress);
		}
		else
		{
			return "BuyNowForm.jsp";
		}
			
		return "SuccessPage2.jsp";
	}
	
	@RequestMapping("/PropertiesUnderReview")
	public String propertiesUsedReview(Model model, HttpSession httpSession)
	{
		String id = (String)httpSession.getAttribute("customerId");
		List<Sales> list = userDAO.propertiesUnderReview(id);
		model.addAttribute("list",list);
		return "CustomerRegisteredPropertiesTable.jsp";
		
	}
	
	@RequestMapping("/ApproveToBuy")
	public String approveToBuy(Model model, HttpSession httpSession)
	{
		List<Sales> list = userDAO.approveToBuy();
		model.addAttribute("list", list);
		return "ApproveToBuyTable.jsp";
	}
	
	@RequestMapping("/ApprovalToBuy")
	public String approvalToBuy(@RequestParam("customerId") String customerId, @RequestParam("approvalStatus") String approvalStatus, Model model)
	{
		userDAO.updateApproval(customerId, approvalStatus);
		
		List<Sales> list = userDAO.approveToBuy();
		model.addAttribute("list", list);
		return "ApproveToBuyTable.jsp";
	}
	
	@RequestMapping("/RegisterBuyProperties")
	public String registerBuyProperties(Model model, HttpSession session)
	{
		String id = (String)session.getAttribute("customerId");
		List<Sales> list = userDAO.readyToBuy(id);
		model.addAttribute("list", list);
		return "RegisterBuyPropertiesTable.jsp";
	}
	
	@RequestMapping("/PayNow")
	public String payNow(Model model,@RequestParam("yourAccountNumber") long yourAccountNumber, @RequestParam("senderAccountNumber") long senderAccountNumber, @RequestParam("amount") Double amount, @RequestParam("purchasedDate") String purchasedDate, HttpSession session)
	{
		String address = (String)session.getAttribute("propertyAddress");
		if(Boolean.FALSE.equals(validation.accountNumber(yourAccountNumber, senderAccountNumber,model)))
		{
			userDAO.updatePayment(address, yourAccountNumber, senderAccountNumber, purchasedDate);
			return "CustomerWelcomePage.jsp";
		}
		else
		{
			return "PayNow.jsp";
		}
		
	}
	
	@RequestMapping("/PurchasedProperties")
	public String purchasedProperties(Model model, HttpSession session)
	{
		String id = (String)session.getAttribute("customerId");
		List<Property> list = userDAO.purchasedProperties(id);
		model.addAttribute("list", list);
		return "BuyedPropertiesCustomerViewTable.jsp";
	}
	
	@RequestMapping("/CustomerHistory")
	public String history(Model model, HttpSession session)
	{
		String id = (String)session.getAttribute("customerId");
		List<Sales> list = userDAO.customerTransactionHistory(id);
		model.addAttribute("list",list);
		return "CustomerTransactionHistory.jsp";
	}
	
	@RequestMapping("/customerDate")
	public String customerDate(HttpSession session, Model model,  @RequestParam("fromDate") String fromDate, @RequestParam("toDate") String toDate)
	{
		String id = (String)session.getAttribute("customerId");
		List<Sales> list = userDAO.customerDate(id, fromDate, toDate);
		model.addAttribute("list",list);
		return "CustomerTransactionHistory.jsp";
	}

}
