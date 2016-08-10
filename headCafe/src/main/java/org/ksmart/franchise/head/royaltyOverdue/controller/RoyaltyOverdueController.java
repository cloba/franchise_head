package org.ksmart.franchise.head.royaltyOverdue.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;

import org.ksmart.franchise.head.royaltyOverdue.model.RoyaltyOverdue;
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
	
	//연체리스트 조회 하는 메서드
	@RequestMapping(value="/viewRoyaltyOverdueList", method=RequestMethod.GET)
	public String viewRoyaltyList(Model model, Search search, RoyaltyOverdue royaltyOverdue) {
		  System.out.println("RoyaltyOverdueController의 viewRoyaltyList메서드 ");
		  
		//지난 달 구하기
		  Calendar cal = new GregorianCalendar(Locale.KOREA);
		  cal.setTime(new Date());
		  cal.add(Calendar.MONTH, -1); // 한달을 뺀다.  
		  SimpleDateFormat Month = new SimpleDateFormat("yyyy-MM");  //데이터 포맷 형태.
		  royaltyOverdue.setLastMonth(Month.format(cal.getTime()));  //royaltyOverdue객체에 지난 달 입력.
		  List<RoyaltyOverdue> royaltyOverduelist =  royaltyOverdueService.royaltyOverdueListService(search, royaltyOverdue);

		  for(RoyaltyOverdue a:royaltyOverduelist){
			  System.out.println("getRoyaltyPayActualDate"+a.getRoyaltyOverduePayDate()); 
		  }
		  System.out.println("royaltyOverduelist.size:"+ royaltyOverduelist.size());
		  model.addAttribute("royaltyOverduelist", royaltyOverduelist);
		  
	      return "/royaltyOverdue/viewRoyaltyOverdueList";
    }
	
}
