package org.ksmart.franchise.head.recipe.service;

import java.util.List;

import org.ksmart.franchise.head.recipe.model.Recipe;
import org.ksmart.franchise.head.recipe.model.RecipeCommand;
import org.ksmart.franchise.head.util.Search;

public interface RecipeService {
	
	List<Recipe> recipeListService(Recipe recipe, Search search);
	
	//레시피 상세정보를 보여주는 메서드
	List<Recipe> recipeDetailService(String menuCode);

	//레시피를 추가하는 메서드
	int addRecipeService(RecipeCommand recipeCommand);

}
