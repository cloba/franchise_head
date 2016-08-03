package org.ksmart.franchise.head.itemOut.model;

public class ItemOutSearch {
	private String regitDateStart;
	private String regitDateEnd;
	private String searchKey;
	private String searchItem;
	private String status;
	private String criteria;
	private String upDown;
	public String getRegitDateStart() {
		return regitDateStart;
	}
	public void setRegitDateStart(String regitDateStart) {
		this.regitDateStart = regitDateStart;
	}
	public String getRegitDateEnd() {
		return regitDateEnd;
	}
	public void setRegitDateEnd(String regitDateEnd) {
		this.regitDateEnd = regitDateEnd;
	}
	public String getSearchKey() {
		return searchKey;
	}
	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}
	public String getSearchItem() {
		return searchItem;
	}
	public void setSearchItem(String searchItem) {
		this.searchItem = searchItem;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getCriteria() {
		return criteria;
	}
	public void setCriteria(String criteria) {
		this.criteria = criteria;
	}
	public String getUpDown() {
		return upDown;
	}
	public void setUpDown(String upDown) {
		this.upDown = upDown;
	}
	@Override
	public String toString() {
		return "PaymentSearch [regitDateStart=" + regitDateStart + ", regitDateEnd=" + regitDateEnd + ", searchKey="
				+ searchKey + ", searchItem=" + searchItem + ", status=" + status + ", criteria=" + criteria
				+ ", upDown=" + upDown + "]";
	}
}
