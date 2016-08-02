package org.ksmart.franchise.head.recipe.service;

import java.util.List;

import org.ksmart.franchise.head.recipe.model.Recipe;
import org.ksmart.franchise.head.util.Search;

public interface RecipeService {

	List<Recipe> recipeListService(Recipe recipe, Search search);

	List<Recipe> recipeDetail(String menuCode);

}
