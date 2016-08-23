package org.ksmart.franchise.head.royalty.model;

public class RoyaltyOverdueAdd {
	
	private String contractCode;
	private int royaltyActualAmount;
	private String royaltyPayActualDate;
	private int headSellProfitBySubMonth; 
	private String royaltyOverdueCode;
	private String royaltyCode;
	private int royaltyOverdueRest;
	private String royaltyOverdueHeadStaffId;

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
		setRoyaltyOverdueRest();
	}
	public int getHeadSellProfitBySubMonth() {
		return headSellProfitBySubMonth;
	}
	public void setHeadSellProfitBySubMonth(int headSellProfitBySubMonth) {
		this.headSellProfitBySubMonth = headSellProfitBySubMonth;
		setRoyaltyOverdueRest();
	}
	public String getRoyaltyCode() {
		return royaltyCode;
	}
	public void setRoyaltyCode(String royaltyCode) {
		this.royaltyCode = royaltyCode;
	}

	//로얄티 연체 남은금액 구하는 메서드
	public void setRoyaltyOverdueRest(){
		int headSellProfitBySubMonth= this.headSellProfitBySubMonth;
		int royaltyActualAmount = this.royaltyActualAmount;
		int subtraction = headSellProfitBySubMonth - royaltyActualAmount;
		this.royaltyOverdueRest = subtraction;

	}
	public int getRoyaltyOverdueRest() {
		return royaltyOverdueRest;
	}
	public void setRoyaltyOverdueRest(int royaltyOverdueRest) {
		this.royaltyOverdueRest = royaltyOverdueRest;
	}
	public String getRoyaltyPayActualDate() {
		return royaltyPayActualDate;
	}
	public void setRoyaltyPayActualDate(String royaltyPayActualDate) {
		this.royaltyPayActualDate = royaltyPayActualDate;
	}
	public String getRoyaltyOverdueHeadStaffId() {
		return royaltyOverdueHeadStaffId;
	}
	public void setRoyaltyOverdueHeadStaffId(String royaltyOverdueHeadStaffId) {
		this.royaltyOverdueHeadStaffId = royaltyOverdueHeadStaffId;
	}
	
 

}
