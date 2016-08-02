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
	
	//레시피 리스트보는 메서드
	@Override
	public List<Recipe> viewRecipeList(Recipe recipe, Search search) {
		System.out.println("RecipeDaoImpl의 viewRecipeList메서드");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("recipe", recipe);
		map.put("search", search);
		
		return sqlSessionRecipe.selectList(NS+".selectRecipeList", map);
		
	}
	//레시피 상세정보 보는 메서드
	@Override
	public List<Recipe> viewRecipeDetail(String menuCode) {
		System.out.println("RecipeDaoImpl의 viewRecipeDetail메서드");
/*		Map<String, String> map = new HashMap<String, String>();
		map.put("menuCode", menuCode);*/
		return sqlSessionRecipe.selectList(NS+".selectRecipeDetail", menuCode);
	}

}
