package org.ksmart.franchise.head.royaltyOverdue.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;

import org.apache.log4j.Logger;
import org.ksmart.franchise.head.royaltyOverdue.model.RoyaltyOverdue;
import org.ksmart.franchise.head.royaltyOverdue.model.RoyaltyOverduePayAdd;
import org.ksmart.franchise.head.royaltyOverdue.service.RoyaltyOverdueService;
import org.ksmart.franchise.head.util.Search;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class RoyaltyOverdueController {

	
	@Autowired
	private RoyaltyOverdueService royaltyOverdueService;
	Logger log = Logger.getLogger(this.getClass());
	
	//로얄티 연체 리스트 조회 메서드
	@RequestMapping(value="/viewRoyaltyOverdueList.do")
	public String viewRoyaltyList(Model model, Search search, RoyaltyOverdue royaltyOverdue) {
		  log.debug("RoyaltyOverdueController의 viewRoyaltyList메서드 ");
		  
		//지난 달 구하기
		  Calendar cal = new GregorianCalendar(Locale.KOREA);
		  cal.setTime(new Date());
		  cal.add(Calendar.MONTH, -1); // 한달을 뺀다.  
		  SimpleDateFormat Month = new SimpleDateFormat("yyyy-MM");  //데이터 포맷 형태.
		  royaltyOverdue.setLastMonth(Month.format(cal.getTime()));  //royaltyOverdue객체에 지난 달 입력.
		  List<RoyaltyOverdue> royaltyOverduelist =  royaltyOverdueService.royaltyOverdueListService(search, royaltyOverdue);
		
		  model.addAttribute("royaltyOverduelist", royaltyOverduelist);
		  
		  return "/royaltyOverdue/viewRoyaltyOverdueList";
    }
	
	//로얄티 연체 상세정보 조회 메서드
	@RequestMapping(value="/viewRoyaltyOverdueDetail.do", method=RequestMethod.GET)
	public String viewRoyaltyOverdueDetail(Model model, String royaltyOverdueCode) {
		  RoyaltyOverdue royaltyOverdue =  royaltyOverdueService.royaltyOverdueDetailService(royaltyOverdueCode);			 
		  model.addAttribute("royaltyOverdue", royaltyOverdue);
		  
	      return "/royaltyOverdue/viewRoyaltyOverdueDetail";
    }
	
	//로얄티 연체테이블에 로얄티 납부금액 추가하는 폼 연결 메서드
	@RequestMapping(value="/addRoyaltyPay.do", method=RequestMethod.GET)
	public String addroyalty(Model model, String royaltyOverdueCode){
		log.debug("RoyaltyOverdueController의 addRoyaltyPay메서드 ");
		RoyaltyOverdue royaltyOverdue = royaltyOverdueService.royaltyOverdueDetailService(royaltyOverdueCode);
		model.addAttribute("royaltyOverdue", royaltyOverdue);
		return "/royaltyOverdue/addroyaltyForm";	
	}
	
	//로얄티 연체테이블에 로얄티 납부금액 추가하는 메서드
	@RequestMapping(value="/addRoyaltyPay.do", method=RequestMethod.POST)
	public String addroyalty(Model model, RoyaltyOverduePayAdd royaltyOverduePayAdd){
		System.out.println(royaltyOverduePayAdd.getTotalRoyaltyOverduePaid());
		System.out.println(royaltyOverduePayAdd.getTotalRoyaltyOverdueRest());
		royaltyOverdueService.royaltyOverduePadyAddService(royaltyOverduePayAdd);
		
		return "redirect:/viewRoyaltyOverdueDetail.do?royaltyOverdueCode="+royaltyOverduePayAdd.getRoyaltyOverdueCode();
		
	}
}