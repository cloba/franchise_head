package org.ksmart.franchise.head.payment.controller;

import java.util.List;

import org.ksmart.franchise.head.payment.model.Payment;
import org.ksmart.franchise.head.payment.model.PaymentCommand;
import org.ksmart.franchise.head.payment.model.PaymentSearch;
import org.ksmart.franchise.head.payment.service.PaymentService;
import org.ksmart.franchise.head.subject.model.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PaymentController {

	@Autowired
	private PaymentService paymentService;
	
	// 결제방식 리스트를 보여줍니다 (검색포함)
	@RequestMapping(value="/viewPaymentList")
	public String viewPaymentList(PaymentSearch search, Model model){
		System.out.println("PaymentController의 viewPaymentList 메서드 호출");

		List<Payment> paymentList = paymentService.viewPaymentListService(search);
		model.addAttribute("paymentList", paymentList);
		model.addAttribute("search", search);
		
		return "/payment/viewPaymentList";
	}
	
	//결제방식의 상세내용를 보여줍니다
	@RequestMapping(value="/viewPaymentDetail")
	public String viewPaymentDetail(String payMethodCode, Model model){
		System.out.println("PaymentController의 viewPaymentDetail 메서드 호출");

		Payment payment = paymentService.getPaymentDetailService(payMethodCode);
		model.addAttribute("payment", payment);
		
		return "/payment/viewPaymentDetail";
	}
	
	//결제방식을 등록하는 form으로 이동합니다
	@RequestMapping(value="/addPaymentForm", method=RequestMethod.GET)
	public String addPaymentForm(){
		System.out.println("PaymentController의 addPaymentForm메서드 호출");
		
		return "/payment/addPayment";
	}
	
	//결제방식을 등록합니다
	@RequestMapping(value="/addPayment", method=RequestMethod.POST)
	public String addPayment(PaymentCommand paymentCommand){
		System.out.println("PaymentController의 addPayment 메서드 호출");

		paymentService.addPaymentService(paymentCommand);
		
		return "redirect:/viewPaymentList";
	}
	
	//결제방식의 적용상태를 변경합니다
	@RequestMapping(value="/invalidPayment", method=RequestMethod.GET)
	public String invalidPayment(String payMethodCode){
		System.out.println("PaymentController의 invalidPayment 메서드 호출");

		paymentService.modifyPaymentService(payMethodCode);
		
		return "redirect:/viewPaymentDetail?payMethodCode="+payMethodCode;
	}
}
