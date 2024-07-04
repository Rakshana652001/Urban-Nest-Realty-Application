package com.chainsys.urbannestrealty.dao;

import java.util.List;

import com.chainsys.urbannestrealty.model.Property;
import com.chainsys.urbannestrealty.model.User;

public interface UserDAO 
{
	void saveUserDetails(User user);
	String getAdminpassword(String generatedUserID);
	String getsellerPassword(String generatedUserID);
	String getCustomerPassword(String generatedUserID);
	List<User> retriveAdminDetails();
	void updateAdmindetails(User user);
	List<User> sellerCustomerDetails();
	List<User> customerDetails();
	List<User> sellerSearch(String id);
	List<User> customerSearch(String id);
	List<User> retriveSellerProfile(String id);
	void updateSellerdetails(User user);
	
	void property(Property property);
	void delete(User user);
	String getsellerId(String generatedUserID);
	String getcustomerId(String generatedUserID);
	List<User> retriveCustomerDetails(String id);
	void updateCustomerdetails(User user);
	List<Property> sellerRegisteredProperties(String sellerId);
	List<Property> pendingProperty();
	void approval(Property property);
	List<Property> residential();
	List<Property> land();
	List<Property> industrial();
	List<Property> commercial();
	List<Property> authorizedProperties();
}
