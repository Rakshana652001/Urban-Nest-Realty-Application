package com.chainsys.urbannestrealty.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.chainsys.urbannestrealty.mapper.PropertyMapper;
import com.chainsys.urbannestrealty.mapper.PropertyUserDisplayMapper;
import com.chainsys.urbannestrealty.mapper.UserMapper;
import com.chainsys.urbannestrealty.model.Property;
import com.chainsys.urbannestrealty.model.User;

@Repository
public class UserDAOImplementation implements UserDAO
{

	@Autowired
	JdbcTemplate jdbcTemplate;
	UserMapper mapper;
	PropertyUserDisplayMapper propertyUserDisplayMapper;
	
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
	public String getsellerId(String generatedUserID)
	{
		String sellerId = "select id from user where id=? and designation = 'Seller' and deleted_User=0";
		String seller = jdbcTemplate.queryForObject(sellerId, String.class, generatedUserID);
		return seller;
	}
	
	@Override
	public String getcustomerId(String generatedUserID)
	{
		String sellerId = "select id from user where id=? and  designation = 'Customer' and deleted_User=0";
		String seller = jdbcTemplate.queryForObject(sellerId, String.class, generatedUserID);
		return seller;
	}
	
	@Override
	public String getsellerPassword(String generatedUserID) 
	{
		String password = "select password from user where id=? and designation = 'Seller' and deleted_User=0";
		String sellerPassword = jdbcTemplate.queryForObject(password, String.class, generatedUserID);
		return sellerPassword;
	}

	@Override
	public String getCustomerPassword(String generatedUserID) 
	{
		String password = "select password from user where id=? and designation = 'Customer' and deleted_User=0";
		String customerPassword = jdbcTemplate.queryForObject(password, String.class, generatedUserID);
		return customerPassword;
	}

	@Override
	public List<User> retriveAdminDetails() 
	{
		String retriveAdminDetails = "select id, name, phone_number, designation, email_id, address, district, state from user where id='UNR_Admin_1' and deleted_user=0";
		List<User> list = jdbcTemplate.query(retriveAdminDetails, new UserMapper());
		return list;
	}
	
	@Override
	public List<User> retriveCustomerDetails(String id) 
	{
		String retriveAdminDetails = "select id, name, phone_number, designation, email_id, address, district, state from user where id=? and designation='Customer' and deleted_user=0";
		List<User> list = jdbcTemplate.query(retriveAdminDetails, new UserMapper(), id);
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
	public void updateSellerdetails(User user) {
		String update = "update user set phone_number=?, password=?, address=? where name=?";
		Object[] params = {user.getPhoneNumber(), user.getPassword(), user.getAddress(), user.getName()};
		jdbcTemplate.update(update, params);
		
	}	
	
	@Override
	public void updateCustomerdetails(User user) 
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
	public List<User> sellerSearch(String id) 
	{
		String retriveDetails = "select id, name, phone_number, designation, email_id, address, district, state from user where id=? and deleted_User=0 and designation='seller'";
		List<User> list = jdbcTemplate.query(retriveDetails, new UserMapper(), id);
		return list;
	}
	
	@Override
	public List<User> customerSearch(String id) 
	{
		String retriveDetails = "select id, name, phone_number, designation, email_id, address, district, state from user where id=? and deleted_User=0 and designation='customer'";
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
	public void property(Property property) 
	{
		String insert = "insert into property_registration (seller_id,property_name, property_id, approval, property_images, property_document, property_price, property_address, property_district, property_state, registered_date, customer_id, register_status, payment_status) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Object[] params = {property.getSellerId(), property.getPropertyName(), property.getPropertyId(), property.getApproval(), property.getPropertyImages(), property.getPropertyDocument(),property.getPropertyPrice(),
		property.getPropertyAddress(), property.getPropertyDistrict(), property.getPropertyState(), property.getRegisteredDate(),property.getCustomerId(), property.getRegisterStatus(), property.getPaymentStatus()};
		jdbcTemplate.update(insert, params);	
	}

	@Override
	public void delete(User user)
	{
		String delete = "update user set deleted_User=1 where name=?";
		Object[] name = {user.getName()};
		jdbcTemplate.update(delete, name);		
	}

	@Override
	public List<Property> sellerRegisteredProperties(String sellerId) 
	{
		String select = "select seller_id, property_name, property_id, approval, property_images, property_document, property_price, property_address, property_district, property_state, registered_date, purchased_date, customer_id, register_status,payment_status from property_registration where seller_id=? and approval='Approved'";
		List<Property> list = jdbcTemplate.query(select, new PropertyMapper(), sellerId);
		return list;
	}

	@Override
	public List<Property> pendingProperty() 
	{
		String select = "select seller_id, property_name, property_id, approval, property_images, property_document, property_price, property_address, property_district, property_state, registered_date, purchased_date, customer_id, register_status,payment_status from property_registration where approval='Not Approved'";
		List<Property> list = jdbcTemplate.query(select, new PropertyMapper());
		return list;
	}

	@Override
	public void approval(Property property) 
	{
		String update = "update property_registration set approval=? where property_address=?";
		Object[] approval = {property.getApproval(),property.getPropertyAddress()};
		jdbcTemplate.update(update, approval);
		
	}

	@Override
	public List<Property> residential() 
	{
		String residential = "select seller_id, property_name, property_id, approval, property_images, property_price, property_address, property_district, property_state, registered_date from property_registration where property_name='Residential' and deleted_User=0 and approval='Approved'";
		List<Property> list = jdbcTemplate.query(residential, new PropertyUserDisplayMapper());
		return list;
	}

	@Override
	public List<Property> land() {
		String residential = "select seller_id, property_name, property_id, approval, property_images, property_price, property_address, property_district, property_state, registered_date from property_registration where property_name='Land' and deleted_User=0 and approval='Approved'";
		List<Property> list = jdbcTemplate.query(residential, new PropertyUserDisplayMapper());
		return list;
	}

	@Override
	public List<Property> industrial() {
		String residential = "select seller_id, property_name, property_id, approval, property_images, property_price, property_address, property_district, property_state, registered_date from property_registration where property_name='Industrial' and deleted_User=0 and approval='Approved'";
		List<Property> list = jdbcTemplate.query(residential, new PropertyUserDisplayMapper());
		return list;
	}

	@Override
	public List<Property> commercial() {
		String residential = "select seller_id, property_name, property_id, approval, property_images, property_price, property_address, property_district, property_state, registered_date from property_registration where property_name='Commercial' and deleted_User=0 and approval='Approved'";
		List<Property> list = jdbcTemplate.query(residential, new PropertyUserDisplayMapper());
		return list;
	}

	@Override
	public List<Property> authorizedProperties()
	{
		return null;
	}
}