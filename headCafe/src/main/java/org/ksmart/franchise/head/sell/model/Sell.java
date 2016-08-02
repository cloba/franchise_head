package org.ksmart.franchise.head.sell.model;

public class Sell {
	private String headSellCode; 
	private String inteCode;
	private int headSellQuantity;
	private String storeCode;
	private String headSellGroup;
	private int headSellPurchasePrice;
	private int headSellSellingPrice;
	private String headSellDate;
	private String totalAccountGroup;
	private String headSellFinal;
	private String headSellFinalStaff;
	private String headSellFinalDate;
	private String headSellDistr;
	private int headSellProfitHead;
	private int headSellProfitSub;
	public String getHeadSellCode() {
		return headSellCode;
	}
	public void setHeadSellCode(String headSellCode) {
		this.headSellCode = headSellCode;
	}
	public String getInteCode() {
		return inteCode;
	}
	public void setInteCode(String inteCode) {
		this.inteCode = inteCode;
	}
	public int getHeadSellQuantity() {
		return headSellQuantity;
	}
	public void setHeadSellQuantity(int headSellQuantity) {
		this.headSellQuantity = headSellQuantity;
	}
	public String getStoreCode() {
		return storeCode;
	}
	public void setStoreCode(String storeCode) {
		this.storeCode = storeCode;
	}
	public String getHeadSellGroup() {
		return headSellGroup;
	}
	public void setHeadSellGroup(String headSellGroup) {
		this.headSellGroup = headSellGroup;
	}
	public int getHeadSellPurchasePrice() {
		return headSellPurchasePrice;
	}
	public void setHeadSellPurchasePrice(int headSellPurchasePrice) {
		this.headSellPurchasePrice = headSellPurchasePrice;
	}
	public int getHeadSellSellingPrice() {
		return headSellSellingPrice;
	}
	public void setHeadSellSellingPrice(int headSellSellingPrice) {
		this.headSellSellingPrice = headSellSellingPrice;
	}
	public String getHeadSellDate() {
		return headSellDate;
	}
	public void setHeadSellDate(String headSellDate) {
		this.headSellDate = headSellDate;
	}
	public String getTotalAccountGroup() {
		return totalAccountGroup;
	}
	public void setTotalAccountGroup(String totalAccountGroup) {
		this.totalAccountGroup = totalAccountGroup;
	}
	public String getHeadSellFinal() {
		return headSellFinal;
	}
	public void setHeadSellFinal(String headSellFinal) {
		this.headSellFinal = headSellFinal;
	}
	public String getHeadSellFinalStaff() {
		return headSellFinalStaff;
	}
	public void setHeadSellFinalStaff(String headSellFinalStaff) {
		this.headSellFinalStaff = headSellFinalStaff;
	}
	public String getHeadSellFinalDate() {
		return headSellFinalDate;
	}
	public void setHeadSellFinalDate(String headSellFinalDate) {
		this.headSellFinalDate = headSellFinalDate;
	}
	public String getHeadSellDistr() {
		return headSellDistr;
	}
	public void setHeadSellDistr(String headSellDistr) {
		this.headSellDistr = headSellDistr;
	}
	public int getHeadSellProfitHead() {
		return headSellProfitHead;
	}
	public void setHeadSellProfitHead(int headSellProfitHead) {
		this.headSellProfitHead = headSellProfitHead;
	}
	public int getHeadSellProfitSub() {
		return headSellProfitSub;
	}
	public void setHeadSellProfitSub(int headSellProfitSub) {
		this.headSellProfitSub = headSellProfitSub;
	}
	@Override
	public String toString() {
		return "Sell [headSellCode=" + headSellCode + ", inteCode=" + inteCode + ", headSellQuantity="
				+ headSellQuantity + ", storeCode=" + storeCode + ", headSellGroup=" + headSellGroup
				+ ", headSellPurchasePrice=" + headSellPurchasePrice + ", headSellSellingPrice=" + headSellSellingPrice
				+ ", headSellDate=" + headSellDate + ", totalAccountGroup=" + totalAccountGroup + ", headSellFinal="
				+ headSellFinal + ", headSellFinalStaff=" + headSellFinalStaff + ", headSellFinalDate="
				+ headSellFinalDate + ", headSellDistr=" + headSellDistr + ", headSellProfitHead=" + headSellProfitHead
				+ ", headSellProfitSub=" + headSellProfitSub + "]";
	}
	
}
