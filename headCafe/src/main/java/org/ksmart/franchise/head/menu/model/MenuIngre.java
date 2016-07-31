package org.ksmart.franchise.head.menu.model;

import org.springframework.stereotype.Repository;

@Repository
public class MenuIngre {
	private String ingrePriceCode;
	private String menuCode;
	private String hItemCode;
	private String ingreName;
	private String ingreAmount;
	private String ingreMoney;
	private String headStaffId;
	private String ingreRegitDate;
	private String menuStatus;
	public String getIngrePriceCode() {
		return ingrePriceCode;
	}
	public void setIngrePriceCode(String ingrePriceCode) {
		this.ingrePriceCode = ingrePriceCode;
	}
	public String getMenuCode() {
		return menuCode;
	}
	public void setMenuCode(String menuCode) {
		this.menuCode = menuCode;
	}
	public String gethItemCode() {
		return hItemCode;
	}
	public void sethItemCode(String hItemCode) {
		this.hItemCode = hItemCode;
	}
	public String getIngreName() {
		return ingreName;
	}
	public void setIngreName(String ingreName) {
		this.ingreName = ingreName;
	}
	public String getIngreAmount() {
		return ingreAmount;
	}
	public void setIngreAmount(String ingreAmount) {
		this.ingreAmount = ingreAmount;
	}
	public String getIngreMoney() {
		return ingreMoney;
	}
	public void setIngreMoney(String ingreMoney) {
		this.ingreMoney = ingreMoney;
	}
	public String getHeadStaffId() {
		return headStaffId;
	}
	public void setHeadStaffId(String headStaffId) {
		this.headStaffId = headStaffId;
	}
	public String getIngreRegitDate() {
		return ingreRegitDate;
	}
	public void setIngreRegitDate(String ingreRegitDate) {
		this.ingreRegitDate = ingreRegitDate;
	}
	public String getMenuStatus() {
		return menuStatus;
	}
	public void setMenuStatus(String menuStatus) {
		this.menuStatus = menuStatus;
	}
	@Override
	public String toString() {
		return "MenuIngre [ingrePriceCode=" + ingrePriceCode + ", menuCode=" + menuCode + ", hItemCode=" + hItemCode
				+ ", ingreName=" + ingreName + ", ingreAmount=" + ingreAmount + ", ingreMoney=" + ingreMoney
				+ ", headStaffId=" + headStaffId + ", ingreRegitDate=" + ingreRegitDate + ", menuStatus=" + menuStatus
				+ "]";
	}
	
	
}
