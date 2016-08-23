package org.ksmart.franchise.head.delivery.controller;

import java.util.List;

import org.apache.log4j.Logger;
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
	
	Logger log = Logger.getLogger(this.getClass());
	
	//배송 리스트를 보여줍니다 (검색포함)
	@RequestMapping(value="/viewDeliveryList.do")
	public String viewDeliveryList(Deliverysearch search, Model model){
		log.debug("DeliveryController의 viewDeliveryList 메서드 호출");
		List<Delivery> deliveryList = deliveryService.viewDeliveryListService(search);
		model.addAttribute("deliveryList", deliveryList);
		model.addAttribute("search", search);
		
		return "/delivery/viewDeliveryList";
	}
	
	//배송상세를 보여줍니다
	@RequestMapping(value="/viewDeliveryDetail.do")
	public String viewDeliveryDetail(String deliveryCode, Model model){
		log.debug("DeliveryController의 viewDeliveryDetail 메서드 호출");
		Delivery delivery = deliveryService.getDeliveryDetailService(deliveryCode);
		model.addAttribute("delivery", delivery);
		return "/delivery/viewDeliveryDetail";
	}
	
	//선택한 판매내역에 대해 배송을 요청합니다
	@RequestMapping(value="/requestDelivery.do")
	public String requestDelivery(String[] checkedOrders, String[] inteCode, int[] headSellQuantity){
		log.debug("SellController의 requestDelivery 메서드 호출");
	//	log.debug("checkedOrders ====> "+Arrays.toString(checkedOrders));
	//	log.debug("inteCode ====> "+Arrays.toString(inteCode));
	//	log.debug("headSellQuantity ====> "+Arrays.toString(headSellQuantity));
		deliveryService.requestDeliveryService(checkedOrders, inteCode, headSellQuantity);

		return "redirect:/viewDeliveryList.do";
	}
	
	//배송상품의 현재 위치를 변경합니다
	@RequestMapping(value="/updateStatus.do", method=RequestMethod.POST)
	public String updateStatus(String[] checked, String deliveryStatus, String headStaffId){
		log.debug("SellController의 updateStatus 메서드 호출");
	//	log.debug(checked+" <===== checked");
	//	log.debug(status+" <===== status");
		deliveryService.updateStatusService(checked, deliveryStatus, headStaffId);
		
		return "redirect:/viewDeliveryList.do";
	}
}
