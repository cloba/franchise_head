package org.ksmart.franchise.head.delivery.controller;

import java.util.List;

import org.ksmart.franchise.head.delivery.model.Delivery;
import org.ksmart.franchise.head.delivery.model.Deliverysearch;
import org.ksmart.franchise.head.delivery.service.DeliveryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DeliveryController {
	
	@Autowired
	private DeliveryService deliveryService;
	
	//배송 리스트를 보여줍니다 (검색포함)
	@RequestMapping(value="/viewDeliveryList")
	public String viewDeliveryList(Deliverysearch search, Model model){
		System.out.println("DeliveryController의 viewDeliveryList 메서드 호출");
		List<Delivery> deliveryList = deliveryService.viewDeliveryListService(search);
		model.addAttribute("deliveryList", deliveryList);
		model.addAttribute("search", search);
		
		return "/delivery/viewDeliveryList";
	}
	
	//배송상세를 보여줍니다
	@RequestMapping(value="/viewDeliveryDetail")
	public String viewDeliveryDetail(String deliveryCode, Model model){
		System.out.println("DeliveryController의 viewDeliveryDetail 메서드 호출");
		Delivery delivery = deliveryService.getDeliveryDetailService(deliveryCode);
		model.addAttribute("delivery", delivery);
		
		return "/delivery/viewDeliveryDetail";
	}
	
	//선택한 판매내역에 대해 배송을 요청합니다
	@RequestMapping(value="/requestDelivery")
	public String requestDelivery(String[] checkedOrders, String[] inteCode, int headSellQuantity){
		System.out.println("SellController의 requestDelivery 메서드 호출");
		System.out.println("checkedOrders ====> "+checkedOrders);
		System.out.println("inteCode ====> "+inteCode);
		System.out.println("headSellQuantity ====> "+headSellQuantity);
			deliveryService.requestDeliveryService(checkedOrders, inteCode, headSellQuantity);
		
		return "redirect:/viewDeliveryList";
	}
	
	//배송상품의 현재 위치를 변경합니다
	@RequestMapping(value="/updateStatus", method=RequestMethod.POST)
	public String updateStatus(String[] checked, String status){
		System.out.println("SellController의 updateStatus 메서드 호출");
	//	System.out.println(checked+" <===== checked");
	//	System.out.println(status+" <===== status");
		deliveryService.updateStatusService(checked, status);
		
		return "redirect:/viewDeliveryList";
	}
}
