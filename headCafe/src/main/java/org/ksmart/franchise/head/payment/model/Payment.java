package org.ksmart.franchise.head.payment.model;

public class Payment {
	private String payMethodCode;
	private String payMethod;
	private int profitPercent;
	private String headStaffId;
	private String profitRegitDate;
	private String profitStatus;
	public String getPayMethodCode() {
		return payMethodCode;
	}
	public void setPayMethodCode(String payMethodCode) {
		this.payMethodCode = payMethodCode;
	}
	public String getPayMethod() {
		return payMethod;
	}
	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}
	public int getProfitPercent() {
		return profitPercent;
	}
	public void setProfitPercent(int profitPercent) {
		this.profitPercent = profitPercent;
	}
	public String getHeadStaffId() {
		return headStaffId;
	}
	public void setHeadStaffId(String headStaffId) {
		this.headStaffId = headStaffId;
	}
	public String getProfitRegitDate() {
		return profitRegitDate;
	}
	public void setProfitRegitDate(String profitRegitDate) {
		this.profitRegitDate = profitRegitDate;
	}
	public String getProfitStatus() {
		return profitStatus;
	}
	public void setProfitStatus(String profitStatus) {
		this.profitStatus = profitStatus;
	}
	@Override
	public String toString() {
		return "Payment [payMethodCode=" + payMethodCode + ", payMethod=" + payMethod + ", profitPercent="
				+ profitPercent + ", headStaffId=" + headStaffId + ", profitRegitDate=" + profitRegitDate
				+ ", profitStatus=" + profitStatus + "]";
	}
}
