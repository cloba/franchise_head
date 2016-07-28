package org.ksmart.franchise.head.item.model;

//로그인 한 본사 직원의 정보를 담습니다
public class HeadLogin {
	private String headStaffId;
	private String headStaffName;
	private String headStaffLevel;
	private String headStaffDep;
	public String getHeadStaffId() {
		return headStaffId;
	}
	public void setHeadStaffId(String headStaffId) {
		this.headStaffId = headStaffId;
	}
	public String getHeadStaffName() {
		return headStaffName;
	}
	public void setHeadStaffName(String headStaffName) {
		this.headStaffName = headStaffName;
	}
	public String getHeadStaffLevel() {
		return headStaffLevel;
	}
	public void setHeadStaffLevel(String headStaffLevel) {
		this.headStaffLevel = headStaffLevel;
	}
	public String getHeadStaffDep() {
		return headStaffDep;
	}
	public void setHeadStaffDep(String headStaffDep) {
		this.headStaffDep = headStaffDep;
	}
}
