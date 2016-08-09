package org.ksmart.franchise.head.royalty.model;

public class RoyaltyOverdueAdd {
	
	private String contractCode;
	private String royaltyActualAmount;
	private String royaltyPayActualDate;
	private String headSellProfitBySubMonth;

	public String getRoyaltyActualAmount() {
		return royaltyActualAmount;
	}
	public void setRoyaltyActualAmount(String royaltyActualAmount) {
		this.royaltyActualAmount = royaltyActualAmount;
	}
	public String getRoyaltyPayActualDate() {
		return royaltyPayActualDate;
	}
	public void setRoyaltyPayActualDate(String royaltyPayActualDate) {
		this.royaltyPayActualDate = royaltyPayActualDate;
	}
	public String getHeadSellProfitBySubMonth() {
		return headSellProfitBySubMonth;
	}
	public void setHeadSellProfitBySubMonth(String headSellProfitBySubMonth) {
		this.headSellProfitBySubMonth = headSellProfitBySubMonth;
	}
	public String getContractCode() {
		return contractCode;
	}
	public void setContractCode(String contractCode) {
		this.contractCode = contractCode;
	}
	
 

}
