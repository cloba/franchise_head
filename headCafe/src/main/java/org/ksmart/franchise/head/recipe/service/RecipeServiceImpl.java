package org.ksmart.franchise.head.recipe.service;

import java.util.List;

import org.ksmart.franchise.head.recipe.model.Recipe;
import org.ksmart.franchise.head.recipe.model.RecipeCommand;
import org.ksmart.franchise.head.recipe.repository.RecipeDao;
import org.ksmart.franchise.head.util.Search;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RecipeServiceImpl implements RecipeService {

	@Autowired
	private RecipeDao recipeDao;	
	
	//레시피 리스트를 보는 메서드
	@Override
	public List<Recipe> recipeListService(Recipe recipe, Search search) {
		System.out.println("RecipeServiceImpl의 recipeListService메서드");
		
		return recipeDao.viewRecipeList(recipe, search);
	}

	//레시피 상세정보를 보는 메서드
	@Override
	public List<Recipe> recipeDetail(String menuCode) {
		System.out.println("RecipeServiceImpl의 recipeDetail메서드");
		return recipeDao.viewRecipeDetail(menuCode);
	}

	//레시피 등록하는 메서드
	@Override
	public int addRecipeService(RecipeCommand recipeCommand) {
		System.out.println("RecipeServiceImpl의 recipeDetail메서드");
		
		return recipeDao.addRecipe(recipeCommand);
		
	}

}
