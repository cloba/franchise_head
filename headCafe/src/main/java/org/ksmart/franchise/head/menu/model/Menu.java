package org.ksmart.franchise.head.menu.model;

public class Menu {
	private String menuCode;
	private String inteCode;
	private String menuName;
	private int menuIngrePrice;
	private int menuSellingPrice;
	private String headStaffId;
	private String menuRegitDate;
	private char menuStatus;
	public String getMenuCode() {
		return menuCode;
	}
	public void setMenuCode(String menuCode) {
		this.menuCode = menuCode;
	}
	public String getInteCode() {
		return inteCode;
	}
	public void setInteCode(String inteCode) {
		this.inteCode = inteCode;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public int getMenuIngrePrice() {
		return menuIngrePrice;
	}
	public void setMenuIngrePrice(int menuIngrePrice) {
		this.menuIngrePrice = menuIngrePrice;
	}
	public int getMenuSellingPrice() {
		return menuSellingPrice;
	}
	public void setMenuSellingPrice(int menuSellingPrice) {
		this.menuSellingPrice = menuSellingPrice;
	}
	public String getHeadStaffId() {
		return headStaffId;
	}
	public void setHeadStaffId(String headStaffId) {
		this.headStaffId = headStaffId;
	}
	public String getMenuRegitDate() {
		return menuRegitDate;
	}
	public void setMenuRegitDate(String menuRegitDate) {
		this.menuRegitDate = menuRegitDate;
	}
	public char getMenuStatus() {
		return menuStatus;
	}
	public void setMenuStatus(char menuStatus) {
		this.menuStatus = menuStatus;
	}
	@Override
	public String toString() {
		return "Menu [menuCode=" + menuCode + ", inteCode=" + inteCode + ", menuName=" + menuName + ", menuIngrePrice="
				+ menuIngrePrice + ", menuSellingPrice=" + menuSellingPrice + ", headStaffId=" + headStaffId
				+ ", menuRegitDate=" + menuRegitDate + ", menuStatus=" + menuStatus + "]";
	}
	
	
}
