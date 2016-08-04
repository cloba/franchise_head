package org.ksmart.franchise.head.util;

public class Search {
	private String regitDateStart;
	private String regitDateEnd;
	private String searchKey;
	private String searchItem;
	private String criteria;
	private String upDown;
	private String status;
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
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
		return "Search [regitDateStart=" + regitDateStart + ", regitDateEnd=" + regitDateEnd + ", searchKey="
				+ searchKey + ", searchItem=" + searchItem + ", criteria=" + criteria + ", upDown=" + upDown
				+ ", status=" + status + "]";
	}
	
	
	
}
