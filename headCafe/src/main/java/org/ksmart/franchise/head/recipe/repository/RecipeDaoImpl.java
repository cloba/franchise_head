package org.ksmart.franchise.head.recipe.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.ksmart.franchise.head.recipe.model.Recipe;
import org.ksmart.franchise.head.recipe.model.RecipeCommand;
import org.ksmart.franchise.head.util.Search;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RecipeDaoImpl implements RecipeDao{

	private final String NS = "org.ksmart.franchise.head.recipe.repository.RecipeMapper";
	
	@Autowired   
	private SqlSessionTemplate sqlSessionRecipe;
	Logger log = Logger.getLogger(this.getClass());
	
	//레시피 리스트보는 메서드
	@Override
	public List<Recipe> viewRecipeList(Recipe recipe, Search search) {
		log.debug("RecipeDaoImpl의 viewRecipeList메서드");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("recipe", recipe);
		map.put("search", search);
		
		return sqlSessionRecipe.selectList(NS+".selectRecipeList", map);
		
	}
	//레시피 상세정보 보는 메서드
	@Override
	public List<Recipe> viewRecipeDetail(String menuCode) {
		log.debug("RecipeDaoImpl의 viewRecipeDetail메서드");
		return sqlSessionRecipe.selectList(NS+".selectRecipeDetail", menuCode);
	}
	
	// 레시피 등록 하는 메서드
	@Override
	public int addRecipe(RecipeCommand recipeCommand) {
		log.debug("RecipeDaoImpl의 addRecipe메서드");
		log.debug("getRecipeActArr::"+recipeCommand.getRecipeActArr().length);
		int result = 0;
		for(int i=0;  i<recipeCommand.getRecipeActArr().length; i++){
			recipeCommand.setRecipeAct(recipeCommand.getRecipeActArr()[i]);
			recipeCommand.setRecipeOrder(recipeCommand.getRecipeOrderArr()[i]);
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("recipeCommand", recipeCommand);
			
			result = sqlSessionRecipe.insert(NS+".insertAddRecipe", map);
		}
		return result;
	}
}
