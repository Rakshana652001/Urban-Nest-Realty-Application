package com.chainsys.urbannestrealty.dao;

import java.util.List;

import com.chainsys.urbannestrealty.model.User;

public interface UserDAO 
{

	void saveUserDetails(User user);

	String getAdminpassword(String generatedUserID);
	
	String getGeneratedId(String generatedUserID);

	String getsellerPassword(String generatedUserID);

	String getCustomerPassword(String generatedUserID);

	List<User> retriveAdminDetails();

	void updateAdmindetails(User user);

	List<User> sellerCustomerDetails();

	List<User> customerDetails();

	List<User> search(String id);

	List<User> retriveSellerProfile(String id);

	void updateSellerdetails(User user);


	


}
