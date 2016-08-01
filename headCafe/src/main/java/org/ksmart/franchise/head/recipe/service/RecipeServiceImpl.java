package org.ksmart.franchise.head.recipe.service;

import java.util.List;

import org.ksmart.franchise.head.recipe.model.Recipe;
import org.ksmart.franchise.head.recipe.repository.RecipeDao;
import org.ksmart.franchise.head.util.Search;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RecipeServiceImpl implements RecipeService {

	@Autowired
	private RecipeDao recipeDao;	
	
	@Override
	public List<Recipe> recipeListService(Recipe recipe, Search search) {
		
		
		return recipeDao.viewRecipeList(recipe, search);
	}

}
