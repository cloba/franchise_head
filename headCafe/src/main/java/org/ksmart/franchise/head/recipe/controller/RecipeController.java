package org.ksmart.franchise.head.recipe.controller;

import java.util.List;

import org.ksmart.franchise.head.recipe.model.Recipe;
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
		
		//레시피 리스트 조회하는 메서드
		@RequestMapping(value="/viewRecipeList", method=RequestMethod.GET)
		public String viewRecipeList(Model model, Recipe recipe, Search search) {
			  System.out.println("RecipeController의 viewRecipeList메서드 ");
			  
			  List<Recipe> list =  recipeService.recipeListService(recipe, search);
			  
			  System.out.println("list.size:"+ list.size());
			  model.addAttribute("list", list);
			  
		      return "/recipe/viewRecipeList";
	    }
		
//		//레시피 상세정보 보여 주는 메서드
		  @RequestMapping(value="/viewRecipeDetail", method=RequestMethod.GET)
		  public String ViewRecipeDetail(Model model, String menuCode){
			  System.out.println("RecipeController의 ViewRecipeDetail메서드 ");
			  List<Recipe> list = recipeService.recipeDetail(menuCode);
			  Recipe recipeSecond = new Recipe();
			  System.out.println(list.get(0));
			  Recipe recipe = list.get(0);
			  
			  System.out.println("1"+recipe.getHeadStaffId());
			  recipeSecond.setHeadStaffId(recipe.getHeadStaffId());
			  recipeSecond.setMenuCode(recipe.getMenuName());
			  recipeSecond.setRecipeRegitDate(recipe.getRecipeRegitDate());
			  recipeSecond.setMenuName(recipe.getMenuName());
			  
			 // System.out.println("list.size:"+ list.size());
			  
			  model.addAttribute("list", list);
			  model.addAttribute("recipe", recipeSecond);
			return "/recipe/viewRecipeDetail";
		  }
		
		//레시피 등록 form을 보여주는 메서드
			@RequestMapping(value="/addRecipe", method=RequestMethod.GET)
			public String addRecipe(Model model, Recipe recipe){
				System.out.println("RecipeController의 addRecipe 메서드");
				model.addAttribute("recipe", recipe);	
				return "/recipe/addRecipe";
			}
		 
}
