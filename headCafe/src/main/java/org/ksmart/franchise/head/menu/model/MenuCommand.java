package org.ksmart.franchise.head.menu.model;

public class MenuCommand {
	private String menuCode;
	private String inteCode;
	private String menuName;
	private String menuStatus;
	public String getMenuStatus() {
		return menuStatus;
	}
	public void setMenuStatus(String menuStatus) {
		this.menuStatus = menuStatus;
	}
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
	
	@Override
	public String toString() {
		return "MenuSearch [menuCode=" + menuCode + ", inteCode=" + inteCode + ", menuName=" + menuName
				+ ", menuStatus=" + menuStatus + "]";
	}
	
}
