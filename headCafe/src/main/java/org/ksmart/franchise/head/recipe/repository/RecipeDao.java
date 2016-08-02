package org.ksmart.franchise.head.recipe.repository;

import java.util.List;

import org.ksmart.franchise.head.recipe.model.Recipe;
import org.ksmart.franchise.head.util.Search;

public interface RecipeDao {

	List<Recipe> viewRecipeList(Recipe recipe, Search search);

	List<Recipe> viewRecipeDetail(String menuCode);

}
