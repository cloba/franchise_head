package org.ksmart.franchise.head.headStaff.model;

public class HeadStaffCommand {
	private String headStaffId;
	private String headStaffPw;
	private String headStaffName;
	private String headStaffLevel;
	private String headStaffDep;
	private String headStaffJoin;
	
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
	public String getHeadStaffJoin() {
		return headStaffJoin;
	}
	public void setHeadStaffJoin(String headStaffJoin) {
		this.headStaffJoin = headStaffJoin;
	}
	@Override
	public String toString() {
		return "HeadStaffCommand [headStaffName=" + headStaffName + ", headStaffLevel=" + headStaffLevel
				+ ", headStaffDep=" + headStaffDep + ", headStaffJoin=" + headStaffJoin + "]";
	}
	public String getHeadStaffPw() {
		return headStaffPw;
	}
	public void setHeadStaffPw(String headStaffPw) {
		this.headStaffPw = headStaffPw;
	}
}
