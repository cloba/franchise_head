package org.ksmart.franchise.head.item.model;

public class ItemCommand {
	private String hItemCode;
	private String hItemName;
	private int hItemQuantity;
	private String hItemUnit;
	private int hItemPurchasePrice;
	private String hItemMarginPercent;
	private int hItemSellingPrice;
	private int hItemRetailPrice;
	private String headClientCode;
	private String headStaffId;
	
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
	public String getHeadClientCode() {
		return headClientCode;
	}
	public void setHeadClientCode(String headClientCode) {
		this.headClientCode = headClientCode;
	}
	@Override
	public String toString() {
		return "ItemCommand [hItemCode=" + hItemCode + ", hItemName=" + hItemName + ", hItemQuantity=" + hItemQuantity
				+ ", hItemUnit=" + hItemUnit + ", hItemPurchasePrice=" + hItemPurchasePrice + ", hItemMarginPercent="
				+ hItemMarginPercent + ", hItemSellingPrice=" + hItemSellingPrice + ", hItemRetailPrice="
				+ hItemRetailPrice + ", headClientCode=" + headClientCode + "]";
	}
	public String getHeadStaffId() {
		return headStaffId;
	}
	public void setHeadStaffId(String headStaffId) {
		this.headStaffId = headStaffId;
	}
	
}
