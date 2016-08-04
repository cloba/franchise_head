package org.ksmart.franchise.head.royaltyExpected.controller;

import java.util.List;

import org.ksmart.franchise.head.recipe.model.Recipe;
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
			@RequestMapping(value="/viewRecipeList", method=RequestMethod.GET)
			public String viewRoyaltyExpectedList(Model model, RoyaltyExpected royaltyExpected, Search search) {
				  System.out.println("RecipeController의 viewRecipeList메서드 ");
				  
				  List<RoyaltyExpected> list =  royaltyExpectedService.royaltyExpectedListService(royaltyExpected, search);
				  
				  System.out.println("list.size:"+ list.size());
				  model.addAttribute("list", list);
				  
			      return "/royaltyExpected/viewRoyaltyExpectedList";
		    }
}
