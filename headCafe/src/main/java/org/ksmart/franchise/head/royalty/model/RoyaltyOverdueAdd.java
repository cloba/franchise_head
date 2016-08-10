package org.ksmart.franchise.head.royalty.model;

public class RoyaltyOverdueAdd {
	
	private String contractCode;
	private int royaltyActualAmount;
	private String royaltyPayActualDate;
	private int headSellProfitBySubMonth; 
	private String royaltyOverdueCode;
	private String royaltyCode;

	public String getRoyaltyPayActualDate() {
		return royaltyPayActualDate;
	}
	public void setRoyaltyPayActualDate(String royaltyPayActualDate) {
		this.royaltyPayActualDate = royaltyPayActualDate;
	}
	
	public String getContractCode() {
		return contractCode;
	}
	public void setContractCode(String contractCode) {
		this.contractCode = contractCode;
	}
	public String getRoyaltyOverdueCode() {
		return royaltyOverdueCode;
	}
	public void setRoyaltyOverdueCode(String royaltyOverdueCode) {
		this.royaltyOverdueCode = royaltyOverdueCode;
	}
	public int getRoyaltyActualAmount() {
		return royaltyActualAmount;
	}
	public void setRoyaltyActualAmount(int royaltyActualAmount) {
		this.royaltyActualAmount = royaltyActualAmount;
	}
	public int getHeadSellProfitBySubMonth() {
		return headSellProfitBySubMonth;
	}
	public void setHeadSellProfitBySubMonth(int headSellProfitBySubMonth) {
		this.headSellProfitBySubMonth = headSellProfitBySubMonth;
	}
	public String getRoyaltyCode() {
		return royaltyCode;
	}
	public void setRoyaltyCode(String royaltyCode) {
		this.royaltyCode = royaltyCode;
	}

 

}
