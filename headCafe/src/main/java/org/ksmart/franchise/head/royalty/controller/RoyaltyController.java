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

	//레시피 리스트 조회하는 메서드
			@RequestMapping(value="/viewRoyaltyList", method=RequestMethod.GET)
			public String viewRoyaltyList(Model model, Royalty Royalty, Search search) {
				  System.out.println("RecipeController의 viewRecipeList메서드 ");
				  
				  //전 달 구하기
				  Calendar cal = new GregorianCalendar(Locale.KOREA);
				  cal.setTime(new Date());
				  cal.add(Calendar.YEAR, 0); // 1년을 더한다.
				  cal.add(Calendar.MONTH, -1); // 한달을 더한다. 
				     
				  SimpleDateFormat Month = new SimpleDateFormat("yyyy-MM");
				  String lastMonth = Month.format(cal.getTime());
				  System.out.println(lastMonth);
				  Royalty.setLastMonth(lastMonth);
	
				  
				  List<Royalty> list =  royaltyService.royaltyListService(Royalty, search);
				  
				  System.out.println("list.size:"+ list.size());
				  model.addAttribute("list", list);
				  
			      return "/Royalty/viewRoyaltyList";
		    }
}
