package org.ksmart.franchise.head.headStaff.model;

import org.springframework.stereotype.Component;

@Component
public class HeadStaffLogin {

	private String headStaffId;
	private String headStaffPw;
	private String headStaffName;
	private String headStaffLevel; 
	
	public String getHeadStaffId() {
		return headStaffId;
	}
	public void setHeadStaffId(String headStaffId) {
		this.headStaffId = headStaffId;
	}
	public String getHeadStaffPw() {
		return headStaffPw;
	}
	public void setHeadStaffPw(String headStaffPw) {
		this.headStaffPw = headStaffPw;
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
	@Override
	public String toString() {
		return "HeadStaffLogin [headStaffId=" + headStaffId + ", headStaffPw=" + headStaffPw + ", headStaffName="
				+ headStaffName + ", headStaffLevel=" + headStaffLevel + "]";
	}
	
	

}
