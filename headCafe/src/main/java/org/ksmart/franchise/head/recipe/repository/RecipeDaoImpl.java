package org.ksmart.franchise.head.recipe.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.ksmart.franchise.head.recipe.model.Recipe;
import org.ksmart.franchise.head.util.Search;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RecipeDaoImpl implements RecipeDao{

	private final String NS = "org.ksmart.franchise.head.recipe.repository.RecipeMapper";
	
	@Autowired
	private SqlSessionTemplate sqlSessionRecipe;
	
	@Override
	public List<Recipe> viewRecipeList(Recipe recipe, Search search) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("recipe", recipe);
		map.put("search", search);
		
		return sqlSessionRecipe.selectList(NS+".selectRecipeList", map);
		
	}

}
