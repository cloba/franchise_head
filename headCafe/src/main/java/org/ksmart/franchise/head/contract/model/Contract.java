package org.ksmart.franchise.head.contract.model;

public class Contract {
	private String contractCode;
	private String headStaffId;
	private String subCode;
	private String contractorName;
	private String contractActualDate;
	private String contractRegitDate;
	private String contractExpiryDate;
	private int contractDeposit;
	private int contractProfitPercent;
	private int contractStatus;
	private String contractFile;
	private String contractFileOriginalName;
	private String contractFileStoredName;
	private int contractFileSize;
	private int contractN;
	private String contractExpiredDate;
	private String contractExpireContent;
	private int royaltyDeadline;
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
	public String getSubCode() {
		return subCode;
	}
	public void setSubCode(String subCode) {
		this.subCode = subCode;
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
	public int getContractStatus() {
		return contractStatus;
	}
	public void setContractStatus(int contractStatus) {
		this.contractStatus = contractStatus;
	}
	public String getContractFile() {
		return contractFile;
	}
	public void setContractFile(String contractFile) {
		this.contractFile = contractFile;
	}
	public String getContractFileOriginalName() {
		return contractFileOriginalName;
	}
	public void setContractFileOriginalName(String contractFileOriginalName) {
		this.contractFileOriginalName = contractFileOriginalName;
	}
	public String getContractFileStoredName() {
		return contractFileStoredName;
	}
	public void setContractFileStoredName(String contractFileStoredName) {
		this.contractFileStoredName = contractFileStoredName;
	}
	public int getContractFileSize() {
		return contractFileSize;
	}
	public void setContractFileSize(int contractFileSize) {
		this.contractFileSize = contractFileSize;
	}
	public int getContractN() {
		return contractN;
	}
	public void setContractN(int contractN) {
		this.contractN = contractN;
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
	public int getRoyaltyDeadline() {
		return royaltyDeadline;
	}
	public void setRoyaltyDeadline(int royaltyDeadline) {
		this.royaltyDeadline = royaltyDeadline;
	}
	@Override
	public String toString() {
		return "Contract [contractCode=" + contractCode + ", headStaffId=" + headStaffId + ", subCode=" + subCode
				+ ", contractorName=" + contractorName + ", contractActualDate=" + contractActualDate
				+ ", contractRegitDate=" + contractRegitDate + ", contractExpiryDate=" + contractExpiryDate
				+ ", contractDeposit=" + contractDeposit + ", contractProfitPercent=" + contractProfitPercent
				+ ", contractStatus=" + contractStatus + ", contractFile=" + contractFile
				+ ", contractFileOriginalName=" + contractFileOriginalName + ", contractFileStoredName="
				+ contractFileStoredName + ", contractFileSize=" + contractFileSize + ", contractN=" + contractN
				+ ", contractExpiredDate=" + contractExpiredDate + ", contractExpireContent=" + contractExpireContent
				+ ", royaltyDeadline=" + royaltyDeadline + "]";
	}
	
}
