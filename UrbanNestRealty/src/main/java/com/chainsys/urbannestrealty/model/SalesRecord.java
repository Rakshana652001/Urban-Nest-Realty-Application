package com.chainsys.urbannestrealty.model;

import java.util.Arrays;

public class SalesRecord 
{
	String customerId, sellerId ;
	long totalAmount;
	String paymentMethod;
	String approval;
	String propertyAddress;
	byte[] governmentId;
	double payableAmount;
	String paidStatus;
	long customerAccount;
	long sellerAccount;
	String purchasedDate;
	
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public String getSellerId() {
		return sellerId;
	}
	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}
	public long getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(long totalAmount) {
		this.totalAmount = totalAmount;
	}
	public String getPaymentMethod() {
		return paymentMethod;
	}
	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	public String getApproval() {
		return approval;
	}
	public void setApproval(String approval) {
		this.approval = approval;
	}
	public String getPropertyAddress() {
		return propertyAddress;
	}
	public void setPropertyAddress(String propertyAddress) {
		this.propertyAddress = propertyAddress;
	}
	public byte[] getGovernmentId() {
		return governmentId;
	}
	public void setGovernmentId(byte[] governmentId) {
		this.governmentId = governmentId;
	}
	public double getPayableAmount() {
		return payableAmount;
	}
	public void setPayableAmount(double payableAmount) {
		this.payableAmount = payableAmount;
	}
	public String getPaidStatus() {
		return paidStatus;
	}
	public void setPaidStatus(String paidStatus) {
		this.paidStatus = paidStatus;
	}
	public long getCustomerAccount() {
		return customerAccount;
	}
	public void setCustomerAccount(long customerAccount) {
		this.customerAccount = customerAccount;
	}
	public long getSellerAccount() {
		return sellerAccount;
	}
	public void setSellerAccount(long sellerAccount) {
		this.sellerAccount = sellerAccount;
	}
	public String getPurchasedDate() {
		return purchasedDate;
	}
	public void setPurchasedDate(String purchasedDate) {
		this.purchasedDate = purchasedDate;
	}
	@Override
	public String toString() {
		return "SaleRecords [customerId=" + customerId + ", sellerId=" + sellerId + ", totalAmount=" + totalAmount
				+ ", paymentMethod=" + paymentMethod + ", approval=" + approval + ", propertyAddress=" + propertyAddress
				+ ", governmentId=" + Arrays.toString(governmentId) + ", payableAmount=" + payableAmount
				+ ", paidStatus=" + paidStatus + ", customerAccount=" + customerAccount + ", sellerAccount="
				+ sellerAccount + ", purchasedDate=" + purchasedDate + "]";
	}
}