package org.ksmart.franchise.head.itemOut.model;

public class ItemOut {
	private String headOutCode;
	private String headOutGroup;
	private String ordersCode;
	private String specificItemCode;
	private String hItemCode;
	private String storeCode;
	private String headOutDate;
	private String headStaffSender;
	private int headOutStatus;
	private String headStaffCheck;
	private String totalAccountGroup;
	public String getHeadOutCode() {
		return headOutCode;
	}
	public void setHeadOutCode(String headOutCode) {
		this.headOutCode = headOutCode;
	}
	public String getHeadOutGroup() {
		return headOutGroup;
	}
	public void setHeadOutGroup(String headOutGroup) {
		this.headOutGroup = headOutGroup;
	}
	public String getOrdersCode() {
		return ordersCode;
	}
	public void setOrdersCode(String ordersCode) {
		this.ordersCode = ordersCode;
	}
	public String getSpecificItemCode() {
		return specificItemCode;
	}
	public void setSpecificItemCode(String specificItemCode) {
		this.specificItemCode = specificItemCode;
	}
	public String gethItemCode() {
		return hItemCode;
	}
	public void sethItemCode(String hItemCode) {
		this.hItemCode = hItemCode;
	}
	public String getStoreCode() {
		return storeCode;
	}
	public void setStoreCode(String storeCode) {
		this.storeCode = storeCode;
	}
	public String getHeadOutDate() {
		return headOutDate;
	}
	public void setHeadOutDate(String headOutDate) {
		this.headOutDate = headOutDate;
	}
	public String getHeadStaffSender() {
		return headStaffSender;
	}
	public void setHeadStaffSender(String headStaffSender) {
		this.headStaffSender = headStaffSender;
	}
	public int getHeadOutStatus() {
		return headOutStatus;
	}
	public void setHeadOutStatus(int headOutStatus) {
		this.headOutStatus = headOutStatus;
	}
	public String getHeadStaffCheck() {
		return headStaffCheck;
	}
	public void setHeadStaffCheck(String headStaffCheck) {
		this.headStaffCheck = headStaffCheck;
	}
	public String getTotalAccountGroup() {
		return totalAccountGroup;
	}
	public void setTotalAccountGroup(String totalAccountGroup) {
		this.totalAccountGroup = totalAccountGroup;
	}
	@Override
	public String toString() {
		return "ItemOut [headOutCode=" + headOutCode + ", headOutGroup=" + headOutGroup + ", ordersCode=" + ordersCode
				+ ", specificItemCode=" + specificItemCode + ", hItemCode=" + hItemCode + ", storeCode=" + storeCode
				+ ", headOutDate=" + headOutDate + ", headStaffSender=" + headStaffSender + ", headOutStatus="
				+ headOutStatus + ", headStaffCheck=" + headStaffCheck + ", totalAccountGroup=" + totalAccountGroup
				+ "]";
	}
	
}
