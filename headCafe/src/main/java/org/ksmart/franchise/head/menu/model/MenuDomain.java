package org.ksmart.franchise.head.menu.model;

import java.util.Arrays;

public class MenuDomain {
	private String menuCode;
	private String menuName;
	private int menuIngrePrice;
	private int menuSellingPrice;
	private String ingrePriceCode;
	private String ingreName;
	private String hItemCode;
	private String[] hItemCodeArr;
	private String ingreAmount;
	private String[] ingreAmountArr;
	private String headStaffId;
	
	public String getMenuCode() {
		return menuCode;
	}
	public void setMenuCode(String menuCode) {
		this.menuCode = menuCode;
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
	public String getIngrePriceCode() {
		return ingrePriceCode;
	}
	public void setIngrePriceCode(String ingrePriceCode) {
		this.ingrePriceCode = ingrePriceCode;
	}
	public String getIngreName() {
		return ingreName;
	}
	public void setIngreName(String ingreName) {
		this.ingreName = ingreName;
	}
	public String gethItemCode() {
		return hItemCode;
	}
	public void sethItemCode(String hItemCode) {
		this.hItemCode = hItemCode;
	}
	public String[] gethItemCodeArr() {
		return hItemCodeArr;
	}
	public void sethItemCodeArr(String[] hItemCodeArr) {
		this.hItemCodeArr = hItemCodeArr;
	}
	public String getIngreAmount() {
		return ingreAmount;
	}
	public void setIngreAmount(String ingreAmount) {
		this.ingreAmount = ingreAmount;
	}
	public String[] getIngreAmountArr() {
		return ingreAmountArr;
	}
	public void setIngreAmountArr(String[] ingreAmountArr) {
		this.ingreAmountArr = ingreAmountArr;
	}
	public String getHeadStaffId() {
		return headStaffId;
	}
	public void setHeadStaffId(String headStaffId) {
		this.headStaffId = headStaffId;
	}
	@Override
	public String toString() {
		return "MenuDomain [menuCode=" + menuCode + ", menuName=" + menuName + ", menuIngrePrice=" + menuIngrePrice
				+ ", menuSellingPrice=" + menuSellingPrice + ", ingrePriceCode=" + ingrePriceCode + ", ingreName="
				+ ingreName + ", hItemCode=" + hItemCode + ", hItemCodeArr=" + Arrays.toString(hItemCodeArr)
				+ ", ingreAmount=" + ingreAmount + ", ingreAmountArr=" + Arrays.toString(ingreAmountArr)
				+ ", headStaffId=" + headStaffId + "]";
	}
}
