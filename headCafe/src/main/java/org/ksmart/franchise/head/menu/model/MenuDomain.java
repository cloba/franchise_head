package org.ksmart.franchise.head.menu.model;

import java.util.ArrayList;
import java.util.Arrays;

public class MenuDomain {
	private String menuCode;
	private String menuName;
	private int menuIngrePrice;
	private int menuSellingPrice;
	private ArrayList<Object>[] ingreName;
	private ArrayList<Object>[] ingreAmount;
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
	public ArrayList<Object>[] getIngreName() {
		return ingreName;
	}
	public void setIngreName(ArrayList<Object>[] ingreName) {
		this.ingreName = ingreName;
	}
	public ArrayList<Object>[] getIngreAmount() {
		return ingreAmount;
	}
	public void setIngreAmount(ArrayList<Object>[] ingreAmount) {
		this.ingreAmount = ingreAmount;
	}
	@Override
	public String toString() {
		return "MenuDomain [menuName=" + menuName + ", menuIngrePrice=" + menuIngrePrice + ", menuSellingPrice="
				+ menuSellingPrice + ", ingreName=" + Arrays.toString(ingreName) + ", ingreAmount="
				+ Arrays.toString(ingreAmount) + "]";
	}
	public String getMenuCode() {
		return menuCode;
	}
	public void setMenuCode(String menuCode) {
		this.menuCode = menuCode;
	}
}
