package org.ksmart.franchise.head.delivery.controller;

import java.util.List;

import org.ksmart.franchise.head.delivery.model.Delivery;
import org.ksmart.franchise.head.delivery.model.Deliverysearch;
import org.ksmart.franchise.head.delivery.service.DeliveryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
