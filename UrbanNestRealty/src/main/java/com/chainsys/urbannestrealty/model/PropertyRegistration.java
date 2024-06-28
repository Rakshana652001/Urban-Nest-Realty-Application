package com.chainsys.urbannestrealty.model;

import java.util.Arrays;

public class PropertyRegistration
{
	String sellerId;
    String propertyName;
    String propertyId;
    long   propertyPrice;
    String propertyAddress;                                      
    String propertyDistrict;
    String propertyState;
    byte[] propertyImages;
    byte[] propertyDocument;
    String approval;
    String registerStatus;
    String paymentStatus;
    String customerId;
    String registeredDate;
    String purchasedDate;
    
	public String getSellerId() {
		return sellerId;
	}
	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}
	public String getPropertyName() {
		return propertyName;
	}
	public void setPropertyName(String propertyName) {
		this.propertyName = propertyName;
	}
	public String getPropertyId() {
		return propertyId;
	}
	public void setPropertyId(String propertyId) {
		this.propertyId = propertyId;
	}
	public long getPropertyPrice() {
		return propertyPrice;
	}
	public void setPropertyPrice(long propertyPrice) {
		this.propertyPrice = propertyPrice;
	}
	public String getPropertyAddress() {
		return propertyAddress;
	}
	public void setPropertyAddress(String propertyAddress) {
		this.propertyAddress = propertyAddress;
	}
	public String getPropertyDistrict() {
		return propertyDistrict;
	}
	public void setPropertyDistrict(String propertyDistrict) {
		this.propertyDistrict = propertyDistrict;
	}
	public String getPropertyState() {
		return propertyState;
	}
	public void setPropertyState(String propertyState) {
		this.propertyState = propertyState;
	}
	public byte[] getPropertyImages() {
		return propertyImages;
	}
	public void setPropertyImages(byte[] propertyImages) {
		this.propertyImages = propertyImages;
	}
	public byte[] getPropertyDocument() {
		return propertyDocument;
	}
	public void setPropertyDocument(byte[] propertyDocument) {
		this.propertyDocument = propertyDocument;
	}
	public String getApproval() {
		return approval;
	}
	public void setApproval(String approval) {
		this.approval = approval;
	}
	public String getRegisterStatus() {
		return registerStatus;
	}
	public void setRegisterStatus(String registerStatus) {
		this.registerStatus = registerStatus;
	}
	public String getPaymentStatus() {
		return paymentStatus;
	}
	public void setPaymentStatus(String paymentStatus) {
		this.paymentStatus = paymentStatus;
	}
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public String getRegisteredDate() {
		return registeredDate;
	}
	public void setRegisteredDate(String registeredDate) {
		this.registeredDate = registeredDate;
	}
	public String getPurchasedDate() {
		return purchasedDate;
	}
	public void setPurchasedDate(String purchasedDate) {
		this.purchasedDate = purchasedDate;
	}
	@Override
	public String toString() {
		return "PropertyRegistration [sellerId=" + sellerId + ", propertyName=" + propertyName + ", propertyId="
				+ propertyId + ", propertyPrice=" + propertyPrice + ", propertyAddress=" + propertyAddress
				+ ", propertyDistrict=" + propertyDistrict + ", propertyState=" + propertyState + ", propertyImages="
				+ Arrays.toString(propertyImages) + ", propertyDocument=" + Arrays.toString(propertyDocument)
				+ ", approval=" + approval + ", registerStatus=" + registerStatus + ", paymentStatus=" + paymentStatus
				+ ", customerId=" + customerId + ", registeredDate=" + registeredDate + ", purchasedDate="
				+ purchasedDate + "]";
	}
}