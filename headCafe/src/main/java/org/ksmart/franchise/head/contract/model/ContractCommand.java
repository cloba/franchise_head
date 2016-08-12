package org.ksmart.franchise.head.contract.model;

import java.util.Map;

public class ContractCommand {
	private String contractCode;
	private String subCode;
	private String contractorName;
	private String contractActualDate;
	private String contractExpiryDate;
	private int contractDeposit;
	private int contractProfitPercent;
	private Map<String, Object> contractFile;
	private int contractStatus;
	private int contractN;
	private int royaltyDeadline;
	public String getContractCode() {
		return contractCode;
	}
	public void setContractCode(String contractCode) {
		this.contractCode = contractCode;
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
	public Map<String, Object> getContractFile() {
		return contractFile;
	}
	public void setContractFile(Map<String, Object> contractFile) {
		this.contractFile = contractFile;
	}
	public int getContractStatus() {
		return contractStatus;
	}
	public void setContractStatus(int contractStatus) {
		this.contractStatus = contractStatus;
	}
	public int getContractN() {
		return contractN;
	}
	public void setContractN(int contractN) {
		this.contractN = contractN;
	}
	public int getRoyaltyDeadline() {
		return royaltyDeadline;
	}
	public void setRoyaltyDeadline(int royaltyDeadline) {
		this.royaltyDeadline = royaltyDeadline;
	}
	@Override
	public String toString() {
		return "ContractCommand [contractCode=" + contractCode + ", subCode=" + subCode + ", contractorName="
				+ contractorName + ", contractActualDate=" + contractActualDate + ", contractExpiryDate="
				+ contractExpiryDate + ", contractDeposit=" + contractDeposit + ", contractProfitPercent="
				+ contractProfitPercent + ", contractFile=" + contractFile + ", contractStatus=" + contractStatus
				+ ", contractN=" + contractN + ", royaltyDeadline=" + royaltyDeadline + "]";
	}
	
}
