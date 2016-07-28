package org.ksmart.franchise.head.item.model;

import org.springframework.stereotype.Repository;

@Repository
public class Item {
	private String hItemCode;
	private String hItemName;
	private String inteCode;
	private int hItemQuantity;
	private String hItemUnit;
	private int hItemPurchasePrice;
	private String hItemMarginPercent;
	private int hItemHeadProfit;
	private int hItemSellingPrice;
	private int hItemRetailPrice;
	private String hItemRegitDate;
	private String headStaffId;
	private String headClientCode;
	public String gethItemCode() {
		return hItemCode;
	}
	public void sethItemCode(String hItemCode) {
		this.hItemCode = hItemCode;
	}
	public String gethItemName() {
		return hItemName;
	}
	public void sethItemName(String hItemName) {
		this.hItemName = hItemName;
	}
	public String getInteCode() {
		return inteCode;
	}
	public void setInteCode(String inteCode) {
		this.inteCode = inteCode;
	}
	public int gethItemQuantity() {
		return hItemQuantity;
	}
	public void sethItemQuantity(int hItemQuantity) {
		this.hItemQuantity = hItemQuantity;
	}
	public String gethItemUnit() {
		return hItemUnit;
	}
	public void sethItemUnit(String hItemUnit) {
		this.hItemUnit = hItemUnit;
	}
	public int gethItemPurchasePrice() {
		return hItemPurchasePrice;
	}
	public void sethItemPurchasePrice(int hItemPurchasePrice) {
		this.hItemPurchasePrice = hItemPurchasePrice;
	}
	public String gethItemMarginPercent() {
		return hItemMarginPercent;
	}
	public void sethItemMarginPercent(String hItemMarginPercent) {
		this.hItemMarginPercent = hItemMarginPercent;
	}
	public int gethItemHeadProfit() {
		return hItemHeadProfit;
	}
	public void sethItemHeadProfit(int hItemHeadProfit) {
		this.hItemHeadProfit = hItemHeadProfit;
	}
	public int gethItemSellingPrice() {
		return hItemSellingPrice;
	}
	public void sethItemSellingPrice(int hItemSellingPrice) {
		this.hItemSellingPrice = hItemSellingPrice;
	}
	public int gethItemRetailPrice() {
		return hItemRetailPrice;
	}
	public void sethItemRetailPrice(int hItemRetailPrice) {
		this.hItemRetailPrice = hItemRetailPrice;
	}
	public String gethItemRegitDate() {
		return hItemRegitDate;
	}
	public void sethItemRegitDate(String hItemRegitDate) {
		this.hItemRegitDate = hItemRegitDate;
	}
	public String getHeadStaffId() {
		return headStaffId;
	}
	public void setHeadStaffId(String headStaffId) {
		this.headStaffId = headStaffId;
	}
	public String getHeadClientCode() {
		return headClientCode;
	}
	public void setHeadClientCode(String headClientCode) {
		this.headClientCode = headClientCode;
	}
	@Override
	public String toString() {
		return "Item [hItemCode=" + hItemCode + ", hItemName=" + hItemName + ", inteCode=" + inteCode
				+ ", hItemQuantity=" + hItemQuantity + ", hItemUnit=" + hItemUnit + ", hItemPurchasePrice="
				+ hItemPurchasePrice + ", hItemMarginPercent=" + hItemMarginPercent + ", hItemHeadProfit="
				+ hItemHeadProfit + ", hItemSellingPrice=" + hItemSellingPrice + ", hItemRetailPrice="
				+ hItemRetailPrice + ", hItemRegitDate=" + hItemRegitDate + ", headStaffId=" + headStaffId
				+ ", headClientCode=" + headClientCode + "]";
	}
	
}
