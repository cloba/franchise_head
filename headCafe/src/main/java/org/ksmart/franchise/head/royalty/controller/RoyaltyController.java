package org.ksmart.franchise.head.royalty.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;

import org.ksmart.franchise.head.royalty.model.Royalty;
import org.ksmart.franchise.head.royalty.service.RoyaltyService;
import org.ksmart.franchise.head.util.Search;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class RoyaltyController {
	
	@Autowired
	private RoyaltyService royaltyService;

	//전가맹 로얄티 리스트 조회하는 메서드
	@RequestMapping(value="/viewRoyaltyList.do", method=RequestMethod.GET)
	public String viewRoyaltyList(Model model, Royalty royalty, Search search) {
		  System.out.println("RoyaltyController의 viewRecipeList메서드 ");
		  
		  //지난 달 구하기
		  Calendar cal = new GregorianCalendar(Locale.KOREA);
		  cal.setTime(new Date());
		  cal.add(Calendar.MONTH, -1); // 한달을 뺀다.  
		  SimpleDateFormat Month = new SimpleDateFormat("yyyy-MM");  //데이터 포맷 형태
		  String lastMonth = Month.format(cal.getTime());
		  royalty.setLastMonth(lastMonth);
		  
		  //리스트 불러오는 쿼리(만약 최근 지불해야할 데이터가 입력안되있다면 추가해서 보여줌)  
		  List<Royalty> royaltyList = royaltyService.currentlypaiedMonthService(royalty, search);
		  
		  model.addAttribute("royaltyList", royaltyList);

	      return "/royalty/viewRoyaltyList";
    }
	
	// 가맹 디테일 조회하는 메서드
	@RequestMapping(value="/viewRoyaltyDetail.do", method= RequestMethod.GET)
	public String viewRoyaltyDetail(Model model, Royalty royalty){
		System.out.println("RoyaltyController의 viewRoyaltyDetail메서드 ");
		royalty = royaltyService.royaltyDetailService(royalty);
		model.addAttribute("royalty", royalty);
		return "/royalty/viewRoyaltyDetail";
		
	}		
			
		
}
