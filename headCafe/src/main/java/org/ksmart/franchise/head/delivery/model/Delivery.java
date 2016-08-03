package org.ksmart.franchise.head.delivery.model;

public class Delivery {
	private String deliveryCode;
	private String ordersCode;
	private String deliveryDate;
	private String deliveryReceive;
	private String deliveryLocation;
	private String headStaffId;
	private String deliveryReturn;
	private String deliveryPerson;
	public String getDeliveryCode() {
		return deliveryCode;
	}
	public void setDeliveryCode(String deliveryCode) {
		this.deliveryCode = deliveryCode;
	}
	public String getOrdersCode() {
		return ordersCode;
	}
	public void setOrdersCode(String ordersCode) {
		this.ordersCode = ordersCode;
	}
	public String getDeliveryDate() {
		return deliveryDate;
	}
	public void setDeliveryDate(String deliveryDate) {
		this.deliveryDate = deliveryDate;
	}
	public String getDeliveryReceive() {
		return deliveryReceive;
	}
	public void setDeliveryReceive(String deliveryReceive) {
		this.deliveryReceive = deliveryReceive;
	}
	public String getDeliveryLocation() {
		return deliveryLocation;
	}
	public void setDeliveryLocation(String deliveryLocation) {
		this.deliveryLocation = deliveryLocation;
	}
	public String getHeadStaffId() {
		return headStaffId;
	}
	public void setHeadStaffId(String headStaffId) {
		this.headStaffId = headStaffId;
	}
	public String getDeliveryReturn() {
		return deliveryReturn;
	}
	public void setDeliveryReturn(String deliveryReturn) {
		this.deliveryReturn = deliveryReturn;
	}
	public String getDeliveryPerson() {
		return deliveryPerson;
	}
	public void setDeliveryPerson(String deliveryPerson) {
		this.deliveryPerson = deliveryPerson;
	}
	@Override
	public String toString() {
		return "Delivery [deliveryCode=" + deliveryCode + ", ordersCode=" + ordersCode + ", deliveryDate="
				+ deliveryDate + ", deliveryReceive=" + deliveryReceive + ", deliveryLocation=" + deliveryLocation
				+ ", headStaffId=" + headStaffId + ", deliveryReturn=" + deliveryReturn + ", deliveryPerson="
				+ deliveryPerson + "]";
	}
	
	
}
