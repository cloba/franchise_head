package org.ksmart.franchise.head.menu.repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.ksmart.franchise.head.item.model.Item;
import org.ksmart.franchise.head.menu.model.Menu;
import org.ksmart.franchise.head.menu.model.MenuDomain;
import org.ksmart.franchise.head.menu.model.MenuIngre;
import org.ksmart.franchise.head.util.Search;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("menuDao")
public class MenuDaoImpl implements MenuDao {
	
	private final String NS = "org.ksmart.franchise.head.menu.repository.MenuMapper";
	private final String R = "org.ksmart.franchise.head.recipe.repository.RecipeMapper";
	
	@Autowired
	private SqlSessionTemplate sqlSessionMenu;
	@Autowired   
	private SqlSessionTemplate sqlSessionRecipe;
	
	Logger log = Logger.getLogger(this.getClass());
	
	// menu의 정보를 보여주는 메서드입니다
	public List<Menu> viewMenuList(Search menuSearch) {
		log.debug("MenuDaoImpl의 viewItemList 메서드 호출");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("menuSearch", menuSearch);
		
		return sqlSessionMenu.selectList(NS+".selectMenu", map);
	}

	@Override
	// menu의 상세정보를 불러오는 메서드입니다
	public Menu getMenuDetail(String menuCode) {
		log.debug("MenuDaoImpl의 getMenuDetail 메서드 호출");
		Map<String, String> map = new HashMap<String, String>();
		map.put("menuCode", menuCode);
		
		return sqlSessionMenu.selectOne(NS+".selectOneMenu", map);
	}

	@Override
	// 한 menu의 재료 정보를 불러오는 메서드 입니다
	public List<MenuIngre> getIngre(String menuCode) {
		log.debug("MenuDaoImpl의 getIngre 메서드 호출");
		
		//Mapper로 보낼 menuCode를 map에 담습니다
		Map<String, String> map = new HashMap<String, String>();
		map.put("menuCode", menuCode);
		
		//Mapper의 쿼리 실행 결과를 List에 담습니다
		List<MenuIngre> ingreList = new ArrayList<MenuIngre>();
		ingreList = sqlSessionMenu.selectList(NS+".selectIngre", map);
		
		return ingreList;
	}

	@Override
	// menu를 추가하는 메서드입니다
	public String addMenu(MenuDomain menu) {
		log.debug("MenuDaoImpl의 addMenu 메서드 호출");
		
		String menuCode = null;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("menu", menu);
		
		int result = sqlSessionMenu.insert(NS+".insertMenu", map);
	//	log.debug("result addMenu===> "+result);
		
		if( result != 0 ){
			//menu에 추가된 데이터의 PK값을 받습니다
			menuCode = (String) map.get("menuCode");
		}
		
		return menuCode;
	}


	@Override
	//재료를 검색합니다
	public List<Item> searchIngre(String ingreName) {
		log.debug("MenuDaoImpl의 searchIngre 메서드 호출");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("itemName", ingreName);
		
		return sqlSessionMenu.selectList(NS+".selectIngreByName", map);
	}

	
	@Override
	// menu에 따른 재료를 추가하는 메서드입니다
	public int addIngre(MenuDomain menu) {
		log.debug("MenuDaoImpl의 addIngre 메서드 호출");
		int result = 0;
		
		for(int i = 0; i<menu.gethItemCodeArr().length; i++){
		//	log.debug("for문 돌아감");
			
			menu.sethItemCode(menu.gethItemCodeArr()[i]);
			menu.setIngreAmount(menu.getIngreAmountArr()[i]);
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("menu", menu);
			
			result = sqlSessionMenu.insert(NS+".insertIngreWithMenu", map);
		//	log.debug("result::::: " + result);
		}
		
		return result;
	}

	@Override
	// menu에 따른 재료의 재료값을 업데이트 하는 메서드입니다
	public int updateMenuIngrePrice(String menuCode) {
		log.debug("MenuDaoImpl의 updateMenuIngrePrice 메서드 호출");
		int result = sqlSessionMenu.update(NS+".updateMenuIngrePrice", menuCode);
		
		return result;
	}

	@Override
	// 추가된 메뉴를 삭제하는 메서드입니다 - MylSAM에서 트랜잭션을 지원하지 않기 때문에 만든 대용 메서드.
	public void deleteMenu(String menuCode) {
		log.debug("MenuDaoImpl의 deleteMenu 메서드 호출");
		
		sqlSessionMenu.delete(NS+".deleteMenu", menuCode);
	}

	@Override
	// 추가된 재료를 삭제하는 메서드입니다 - MylSAM에서 트랜잭션을 지원하지 않기 때문에 만든 대용 메서드.
	public void deleteIngre(String menuCode) {
		log.debug("MenuDaoImpl의 deleteIngre 메서드 호출");
		
		sqlSessionMenu.delete(NS+".deleteIngre", menuCode);
	}

	//레시피 
	@Override
	public int recipeCount(String menuCode) {
		log.debug("MenuDaoImpl의 reciperecipecount 메서드 호출");
		
		return sqlSessionRecipe.selectOne(R+".selectCountRecipe", menuCode);
	}
}
