package org.ksmart.franchise.head.royaltyOverdue.model;

public class RoyaltyOverduePayAdd {
	private int royaltyOverdueRest;
	private String royaltyOverdueAddPayDate;
	private int royaltyOverdueAddPaid;
	private int royaltyOverduePaid;
	private int totalRoyaltyOverduePaid;
	private int totalRoyaltyOverdueRest;
	private String royaltyOverdueCode;
	private String royaltyOverdueHeadStaffId; 
	
	public int getRoyaltyOverdueRest() {
		return royaltyOverdueRest;
	}
	public void setRoyaltyOverdueRest(int royaltyOverdueRest) {
		this.royaltyOverdueRest = royaltyOverdueRest;
	}
	public String getRoyaltyOverdueAddPayDate() {
		return royaltyOverdueAddPayDate;
	}
	public void setRoyaltyOverdueAddPayDate(String royaltyOverdueAddPayDate) {
		this.royaltyOverdueAddPayDate = royaltyOverdueAddPayDate;
	}
	public int getRoyaltyOverdueAddPaid() {
		return royaltyOverdueAddPaid;
	}
	public void setRoyaltyOverdueAddPaid(int royaltyOverdueAddPaid) {
		this.royaltyOverdueAddPaid = royaltyOverdueAddPaid;
	}
	public int getRoyaltyOverduePaid() {
		return royaltyOverduePaid;
	}
	public void setRoyaltyOverduePaid(int royaltyOverduePaid) {
		this.royaltyOverduePaid = royaltyOverduePaid;
	}
	public int getTotalRoyaltyOverduePaid() {
		this.totalRoyaltyOverduePaid = this.royaltyOverduePaid + this.royaltyOverdueAddPaid;
		return totalRoyaltyOverduePaid;
	}
	public void setTotalRoyaltyOverduePaid(int totalRoyaltyOverduePaid) {
		this.totalRoyaltyOverduePaid = totalRoyaltyOverduePaid;
	}
	public int getTotalRoyaltyOverdueRest() {
		this.totalRoyaltyOverdueRest = this.royaltyOverdueRest - this.royaltyOverdueAddPaid;
		return totalRoyaltyOverdueRest;
	}
	public void setTotalRoyaltyOverdueRest(int totalRoyaltyOverdueRest) {
		this.totalRoyaltyOverdueRest = totalRoyaltyOverdueRest;
	}
	public String getRoyaltyOverdueCode() {
		return royaltyOverdueCode;
	}
	public void setRoyaltyOverdueCode(String royaltyOverdueCode) {
		this.royaltyOverdueCode = royaltyOverdueCode;
	}
	public String getRoyaltyOverdueHeadStaffId() {
		return royaltyOverdueHeadStaffId;
	}
	public void setRoyaltyOverdueHeadStaffId(String royaltyOverdueHeadStaffId) {
		this.royaltyOverdueHeadStaffId = royaltyOverdueHeadStaffId;
	}
	
	

	
	
	
	

}

