package org.ksmart.franchise.head.delivery.model;

public class DeliveryCommand {
	private String deliveryCode;
	private String receivedOrderCode;
	private String deliveryStatus;
	
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
	
}
