package org.ksmart.franchise.head.recipe.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.ksmart.franchise.head.recipe.model.Recipe;
import org.ksmart.franchise.head.recipe.model.RecipeCommand;
import org.ksmart.franchise.head.recipe.service.RecipeService;
import org.ksmart.franchise.head.util.Search;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class RecipeController {

	@Autowired
	private RecipeService recipeService; 
	Logger log = Logger.getLogger(this.getClass());
	
	//레시피 리스트 조회하는 메서드
	@RequestMapping(value="/viewRecipeList.do", method=RequestMethod.GET)
	public String viewRecipeList(Model model, Recipe recipe, Search search) {
		log.debug("RecipeController의 viewRecipeList메서드 ");
  
		List<Recipe> list =  recipeService.recipeListService(recipe, search);
  
	//	log.debug("list.size:"+ list.size());
		model.addAttribute("list", list);
  
		return "/recipe/viewRecipeList";
    }
		
	//레시피 상세정보 보여 주는 메서드
	 @RequestMapping(value="/viewRecipeDetail.do", method=RequestMethod.GET)
	 public String ViewRecipeDetail(Model model, String menuCode){
		 log.debug("RecipeController의 ViewRecipeDetail메서드 ");
		  List<Recipe> list = recipeService.recipeDetailService(menuCode);
		  Recipe recipeSecond = new Recipe();
	//	  log.debug(list.get(0));
		  Recipe recipe = list.get(0);
		  
	//	  log.debug("1"+recipe.getHeadStaffId());
		  recipeSecond.setHeadStaffId(recipe.getHeadStaffId());
		  recipeSecond.setMenuCode(recipe.getMenuName());
		  recipeSecond.setRecipeRegitDate(recipe.getRecipeRegitDate());
		  recipeSecond.setMenuName(recipe.getMenuName());
		  
	//	 log.debug("list.size:"+ list.size());
		  
		  model.addAttribute("list", list);
		  model.addAttribute("recipe", recipeSecond);
		return "/recipe/viewRecipeDetail";
	  }
		
	//레시피 등록 form을 보여주는 메서드
	@RequestMapping(value="/addRecipe.do", method=RequestMethod.GET)
	public String addRecipe(Model model, RecipeCommand recipeCommand){
		log.debug("RecipeController의 addRecipe get메서드");
		model.addAttribute("recipeCommand", recipeCommand);	
	//	log.debug("getMenuCode"+recipeCommand.getMenuCode());
		return "/recipe/addRecipeForm";
	}

	// 레시피 등록 처리하는 메서드
	@RequestMapping(value="/addRecipe.do", method=RequestMethod.POST)
	public String addRecipe(RecipeCommand recipeCommand){
		log.debug("RecipeController의 addRecipe post메서드 ");
		recipeService.addRecipeService(recipeCommand);
		
		return "redirect:/viewRecipeDetail.do?menuCode="+recipeCommand.getMenuCode();
	}	
	
	 
		 
}
