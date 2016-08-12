package org.ksmart.franchise.head.accounting.model;

public class AccountingCommand {
	private String headAccountCode;
	private int headAccountSum;
	private String headAccountDetail;
	public String getHeadAccountCode() {
		return headAccountCode;
	}
	public void setHeadAccountCode(String headAccountCode) {
		this.headAccountCode = headAccountCode;
	}
	public int getHeadAccountSum() {
		return headAccountSum;
	}
	public void setHeadAccountSum(int sum) {
		this.headAccountSum = sum;
	}
	public String getHeadAccountDetail() {
		return headAccountDetail;
	}
	public void setHeadAccountDetail(String headAccountDetail) {
		this.headAccountDetail = headAccountDetail;
	}
	
}
