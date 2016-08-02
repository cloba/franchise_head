package org.ksmart.franchise.head.contract.model;

public class Contract {
	private String contractCode;
	private String headStaffId;
	private String storeCode;
	private String contractorName;
	private String contractActualDate;
	private String contractRegitDate;
	private String contractExpiryDate;
	private int contractDeposit;
	private int contractProfitPercent;
	private String contractFile;
	private int contractN;
	private String contractExpire;
	private String contractExpiredDate;
	private String contractExpireContent;
	public String getContractCode() {
		return contractCode;
	}
	public void setContractCode(String contractCode) {
		this.contractCode = contractCode;
	}
	public String getHeadStaffId() {
		return headStaffId;
	}
	public void setHeadStaffId(String headStaffId) {
		this.headStaffId = headStaffId;
	}
	public String getStoreCode() {
		return storeCode;
	}
	public void setStoreCode(String storeCode) {
		this.storeCode = storeCode;
	}
	public String getContractorName() {
		return contractorName;
	}
	public void setContractorName(String contractorName) {
		this.contractorName = contractorName;
	}
	public String getContractActualDate() {
		return contractActualDate;
	}
	public void setContractActualDate(String contractActualDate) {
		this.contractActualDate = contractActualDate;
	}
	public String getContractRegitDate() {
		return contractRegitDate;
	}
	public void setContractRegitDate(String contractRegitDate) {
		this.contractRegitDate = contractRegitDate;
	}
	public String getContractExpiryDate() {
		return contractExpiryDate;
	}
	public void setContractExpiryDate(String contractExpiryDate) {
		this.contractExpiryDate = contractExpiryDate;
	}
	public int getContractDeposit() {
		return contractDeposit;
	}
	public void setContractDeposit(int contractDeposit) {
		this.contractDeposit = contractDeposit;
	}
	public int getContractProfitPercent() {
		return contractProfitPercent;
	}
	public void setContractProfitPercent(int contractProfitPercent) {
		this.contractProfitPercent = contractProfitPercent;
	}
	public String getContractFile() {
		return contractFile;
	}
	public void setContractFile(String contractFile) {
		this.contractFile = contractFile;
	}
	public int getContractN() {
		return contractN;
	}
	public void setContractN(int contractN) {
		this.contractN = contractN;
	}
	public String getContractExpire() {
		return contractExpire;
	}
	public void setContractExpire(String contractExpire) {
		this.contractExpire = contractExpire;
	}
	public String getContractExpiredDate() {
		return contractExpiredDate;
	}
	public void setContractExpiredDate(String contractExpiredDate) {
		this.contractExpiredDate = contractExpiredDate;
	}
	public String getContractExpireContent() {
		return contractExpireContent;
	}
	public void setContractExpireContent(String contractExpireContent) {
		this.contractExpireContent = contractExpireContent;
	}
	@Override
	public String toString() {
		return "Contract [contractCode=" + contractCode + ", headStaffId=" + headStaffId + ", storeCode=" + storeCode
				+ ", contractorName=" + contractorName + ", contractActualDate=" + contractActualDate
				+ ", contractRegitDate=" + contractRegitDate + ", contractExpiryDate=" + contractExpiryDate
				+ ", contractDeposit=" + contractDeposit + ", contractProfitPercent=" + contractProfitPercent
				+ ", contractFile=" + contractFile + ", contractN=" + contractN + ", contractExpire=" + contractExpire
				+ ", contractExpiredDate=" + contractExpiredDate + ", contractExpireContent=" + contractExpireContent
				+ "]";
	}
	
	
}
