package org.ksmart.franchise.head.royalty.model;

public class Royalty {
	
	private String lastMonth;
	private String RoyaltyCode;
	private String contractCode;
	private String royaltyMonth;
	private String royaltyDealine;
	private String royaltyPaid;
	private String subPracticalSellPriceMonth;
	private String subSellProfitMonth;
	private String headSellProfitBySubMonth;
	private String royaltyPayActualDate;
	private String royaltyActualAmount;
	
	public String getLastMonth() {
		return lastMonth;
	}
	public void setLastMonth(String lastMonth) {
		this.lastMonth = lastMonth;
	}
	public String getRoyaltyCode() {
		return RoyaltyCode;
	}
	public void setRoyaltyCode(String royaltyCode) {
		RoyaltyCode = royaltyCode;
	}
	public String getContractCode() {
		return contractCode;
	}
	public void setContractCode(String contractCode) {
		this.contractCode = contractCode;
	}
	public String getRoyaltyMonth() {
		return royaltyMonth;
	}
	public void setRoyaltyMonth(String royaltyMonth) {
		this.royaltyMonth = royaltyMonth;
	}
	public String getRoyaltyDealine() {
		return royaltyDealine;
	}
	public void setRoyaltyDealine(String royaltyDealine) {
		this.royaltyDealine = royaltyDealine;
	}
	public String getRoyaltyPaid() {
		return royaltyPaid;
	}
	public void setRoyaltyPaid(String royaltyPaid) {
		this.royaltyPaid = royaltyPaid;
	}
	public String getSubPracticalSellPriceMonth() {
		return subPracticalSellPriceMonth;
	}
	public void setSubPracticalSellPriceMonth(String subPracticalSellPriceMonth) {
		this.subPracticalSellPriceMonth = subPracticalSellPriceMonth;
	}
	public String getSubSellProfitMonth() {
		return subSellProfitMonth;
	}
	public void setSubSellProfitMonth(String subSellProfitMonth) {
		this.subSellProfitMonth = subSellProfitMonth;
	}
	public String getHeadSellProfitBySubMonth() {
		return headSellProfitBySubMonth;
	}
	public void setHeadSellProfitBySubMonth(String headSellProfitBySubMonth) {
		this.headSellProfitBySubMonth = headSellProfitBySubMonth;
	}
	public String getRoyaltyPayActualDate() {
		return royaltyPayActualDate;
	}
	public void setRoyaltyPayActualDate(String royaltyPayActualDate) {
		this.royaltyPayActualDate = royaltyPayActualDate;
	}
	public String getRoyaltyActualAmount() {
		return royaltyActualAmount;
	}
	public void setRoyaltyActualAmount(String royaltyActualAmount) {
		this.royaltyActualAmount = royaltyActualAmount;
	}
	
	@Override
	public String toString() {
		return "Royalty [lastMonth=" + lastMonth + ", RoyaltyCode=" + RoyaltyCode + ", contractCode=" + contractCode
				+ ", royaltyMonth=" + royaltyMonth + ", royaltyDealine=" + royaltyDealine + ", royaltyPaid="
				+ royaltyPaid + ", subPracticalSellPriceMonth=" + subPracticalSellPriceMonth + ", subSellProfitMonth="
				+ subSellProfitMonth + ", headSellProfitBySubMonth=" + headSellProfitBySubMonth
				+ ", royaltyPayActualDate=" + royaltyPayActualDate + ", royaltyActualAmount=" + royaltyActualAmount
				+ "]";
	}

	

	
}	
