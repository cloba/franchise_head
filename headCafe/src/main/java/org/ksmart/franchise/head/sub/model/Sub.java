package org.ksmart.franchise.head.sub.model;

public class Sub {
	private String subCode;
	private String headStaffId;
	private String subRegitDate;
	private String subName;
	private String subOwner;
	private int subPhoneFirst;
	private int subPhoneSecond;
	private int subPhoneThird;
	private int subPost;
	private String subRoadAddr;
	private String subParcelAddr;
	public String getSubCode() {
		return subCode;
	}
	public void setSubCode(String subCode) {
		this.subCode = subCode;
	}
	public String getHeadStaffId() {
		return headStaffId;
	}
	public void setHeadStaffId(String headStaffId) {
		this.headStaffId = headStaffId;
	}
	public String getSubRegitDate() {
		return subRegitDate;
	}
	public void setSubRegitDate(String subRegitDate) {
		this.subRegitDate = subRegitDate;
	}
	public String getSubName() {
		return subName;
	}
	public void setSubName(String subName) {
		this.subName = subName;
	}
	public String getSubOwner() {
		return subOwner;
	}
	public void setSubOwner(String subOwner) {
		this.subOwner = subOwner;
	}
	public int getSubPhoneFirst() {
		return subPhoneFirst;
	}
	public void setSubPhoneFirst(int subPhoneFirst) {
		this.subPhoneFirst = subPhoneFirst;
	}
	public int getSubPhoneSecond() {
		return subPhoneSecond;
	}
	public void setSubPhoneSecond(int subPhoneSecond) {
		this.subPhoneSecond = subPhoneSecond;
	}
	public int getSubPhoneThird() {
		return subPhoneThird;
	}
	public void setSubPhoneThird(int subPhoneThird) {
		this.subPhoneThird = subPhoneThird;
	}
	public int getSubPost() {
		return subPost;
	}
	public void setSubPost(int subPost) {
		this.subPost = subPost;
	}
	public String getSubRoadAddr() {
		return subRoadAddr;
	}
	public void setSubRoadAddr(String subRoadAddr) {
		this.subRoadAddr = subRoadAddr;
	}
	public String getSubParcelAddr() {
		return subParcelAddr;
	}
	public void setSubParcelAddr(String subParcelAddr) {
		this.subParcelAddr = subParcelAddr;
	}
	@Override
	public String toString() {
		return "Sub [subCode=" + subCode + ", headStaffId=" + headStaffId + ", subRegitDate=" + subRegitDate
				+ ", subName=" + subName + ", subOwner=" + subOwner + ", subPhoneFirst=" + subPhoneFirst
				+ ", subPhoneSecond=" + subPhoneSecond + ", subPhoneThird=" + subPhoneThird + ", subPost=" + subPost
				+ ", subRoadAddr=" + subRoadAddr + ", subParcelAddr=" + subParcelAddr + "]";
	}
	
}
