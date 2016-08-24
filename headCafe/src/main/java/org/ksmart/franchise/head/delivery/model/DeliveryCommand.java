package org.ksmart.franchise.head.delivery.model;

public class DeliveryCommand {
	private String deliveryCode;
	private String receivedOrderCode;
	private String deliveryStatus;
	private String headStaffId;
	private String ordersCode;
	
	public String getDeliveryStatus() {
		return deliveryStatus;
	}
	public void setDeliveryStatus(String deliveryStatus) {
		this.deliveryStatus = deliveryStatus;
	}
	public String getReceivedOrderCode() {
		return receivedOrderCode;
	}
	public void setReceivedOrderCode(String receivedOrderCode) {
		this.receivedOrderCode = receivedOrderCode;
	}
	public String getDeliveryCode() {
		return deliveryCode;
	}
	public void setDeliveryCode(String deliveryCode) {
		this.deliveryCode = deliveryCode;
	}
	public String getHeadStaffId() {
		return headStaffId;
	}
	public void setHeadStaffId(String headStaffId) {
		this.headStaffId = headStaffId;
	}
	public String getOrdersCode() {
		return ordersCode;
	}
	public void setOrdersCode(String ordersCode) {
		this.ordersCode = ordersCode;
	}
	
}
