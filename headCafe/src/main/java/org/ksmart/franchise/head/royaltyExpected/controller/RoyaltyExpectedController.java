package org.ksmart.franchise.head.royaltyExpected.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;

import org.ksmart.franchise.head.royaltyExpected.model.RoyaltyExpected;
import org.ksmart.franchise.head.royaltyExpected.service.RoyaltyExpectedService;
import org.ksmart.franchise.head.util.Search;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class RoyaltyExpectedController {
	
	@Autowired
	private RoyaltyExpectedService royaltyExpectedService;

	//레시피 리스트 조회하는 메서드
			@RequestMapping(value="/viewRoyaltyExpectedList", method=RequestMethod.GET)
			public String viewRoyaltyExpectedList(Model model, RoyaltyExpected royaltyExpected, Search search) {
				  System.out.println("RecipeController의 viewRecipeList메서드 ");
				  
				  //전 달 구하기
				  Calendar cal = new GregorianCalendar(Locale.KOREA);
				  cal.setTime(new Date());
				  cal.add(Calendar.YEAR, 0); // 1년을 더한다.
				  cal.add(Calendar.MONTH, -1); // 한달을 더한다. 
				     
				  SimpleDateFormat Month = new SimpleDateFormat("yyyy-MM");
				  String lastMonth = Month.format(cal.getTime());
				  System.out.println(lastMonth);
				  royaltyExpected.setLastMonth(lastMonth);
	
				  
				  List<RoyaltyExpected> list =  royaltyExpectedService.royaltyExpectedListService(royaltyExpected, search);
				  
				  System.out.println("list.size:"+ list.size());
				  model.addAttribute("list", list);
				  
			      return "/royaltyExpected/viewRoyaltyExpectedList";
		    }
}
