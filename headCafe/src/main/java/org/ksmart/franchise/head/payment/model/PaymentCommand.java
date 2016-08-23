package org.ksmart.franchise.head.payment.model;

public class PaymentCommand {
	private String payMethod;
	private int profitPercent;
	private String headStaffId;
	
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
}
