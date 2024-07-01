package com.chainsys.urbannestrealty.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.chainsys.urbannestrealty.mapper.UserMapper;
import com.chainsys.urbannestrealty.model.User;

@Repository
public class UserDAOImplementation implements UserDAO
{

	@Autowired
	JdbcTemplate jdbcTemplate;
	UserMapper mapper;
	
	@Override
	public void saveUserDetails(User user)
	{
		String insert = "insert into user (id, name, phone_number, designation, email_id, password, address, district, state)values(?,?,?,?,?,?,?,?,?)";
		Object[] params = {user.getGeneratedUserID() ,user.getName(),user.getPhoneNumber(), user.getDesignation(),  user.getEmailID(),user.getPassword(), user.getAddress(), user.getDistrict(), user.getState()};
		jdbcTemplate.update(insert, params);
	}

	@Override
	public String getAdminpassword(String generatedUserID) 
	{
		String adminPassword = "select password from user where id=? and (designation = 'Admin') and deleted_User=0";
		String password = jdbcTemplate.queryForObject(adminPassword, String.class, generatedUserID);
		return password;
	}

	@Override
	public String getGeneratedId(String generatedUserID) 
	{
		String sellerId = "select id from user where id=? and (designation = 'Seller' or designation = 'Customer') and deleted_User=0";
		String seller = jdbcTemplate.queryForObject(sellerId, String.class, generatedUserID);
		return seller;
	}

	@Override
	public String getsellerPassword(String generatedUserID) 
	{
		String password = "select password from user where id=? and (designation = 'Seller') and deleted_User=0";
		String sellerPassword = jdbcTemplate.queryForObject(password, String.class, generatedUserID);
		return sellerPassword;
	}

	@Override
	public String getCustomerPassword(String generatedUserID) 
	{
		String password = "select password from user where id=? and (designation = 'Customer') and deleted_User=0";
		String sellerPassword = jdbcTemplate.queryForObject(password, String.class, generatedUserID);
		return sellerPassword;
	}

	@Override
	public List<User> retriveAdminDetails() 
	{
		String retriveAdminDetails = "select id, name, phone_number, designation, email_id, address, district, state from user where id='UNR_Admin_1' and deleted_user=0";
		List<User> list = jdbcTemplate.query(retriveAdminDetails, new UserMapper());
		return list;
	}
	

	@Override
	public void updateAdmindetails(User user) 
	{
		String update = "update user set phone_number=?, password=?, address=? where name=?";
		Object[] params = {user.getPhoneNumber(), user.getPassword(), user.getAddress(), user.getName()};
		jdbcTemplate.update(update, params);
	}

	@Override
	public List<User> sellerCustomerDetails() 
	{
		String retriveDetails = "select id, name, phone_number, designation, email_id, address, district, state from user where deleted_User=0 and (designation = 'Seller')";
		List<User> list = jdbcTemplate.query(retriveDetails, new UserMapper());
		return list;
	}

	@Override
	public List<User> customerDetails() 
	{
		String retriveDetails = "select id, name, phone_number, designation, email_id, address, district, state from user where deleted_User=0 and (designation = 'Customer')";
		List<User> list = jdbcTemplate.query(retriveDetails, new UserMapper());
		return list;
	}

	@Override
	public List<User> search(String id) 
	{
		String retriveDetails = "select id, name, phone_number, designation, email_id, address, district, state from user where id=? and deleted_User=0 and (designation='seller' or designation = 'customer')";
		List<User> list = jdbcTemplate.query(retriveDetails, new UserMapper(), id);
		return list;
	}

	@Override
	public List<User> retriveSellerProfile(String id)
	{
		String retriveAdminDetails = "select id, name, phone_number, designation, email_id, address, district, state from user where id=? and designation='seller' and deleted_user=0";
		List<User> list = jdbcTemplate.query(retriveAdminDetails, new UserMapper(), id);
		return list;
	}

	@Override
	public void updateSellerdetails(User user) {
		String update = "update user set phone_number=?, password=?, address=? where name=?";
		Object[] params = {user.getPhoneNumber(), user.getPassword(), user.getAddress(), user.getName()};
		jdbcTemplate.update(update, params);
		
	}	
}
