package org.ksmart.franchise.head.recipe.model;

public class RecipeCommand {
	private String menuCode; //메뉴코드
	private String[] recipeActArr; //조리내용 배열
	private String[] recipeOrderArr; //레시피 순서 배열
	private String recipeAct; //조리내용
	private String recipeOrder; //레시피 순서
	private String headStaffId; //등록한 아이디
	private String recipeCode;

	public String getMenuCode() {
		return menuCode;
	}
	public void setMenuCode(String menuCode) {
		this.menuCode = menuCode;
	}
	public String[] getRecipeActArr() {
		return recipeActArr;
	}
	public void setRecipeActArr(String[] recipeActArr) {
		this.recipeActArr = recipeActArr;
	}
	public String getHeadStaffId() {
		return headStaffId;
	}
	public void setHeadStaffId(String headStaffId) {
		this.headStaffId = headStaffId;
	}
	public String[] getRecipeOrderArr() {
		return recipeOrderArr;
	}
	public void setRecipeOrderArr(String[] recipeOrderArr) {
		this.recipeOrderArr = recipeOrderArr;
	}
	public String getRecipeAct() {
		return recipeAct;
	}
	public void setRecipeAct(String recipeAct) {
		this.recipeAct = recipeAct;
	}
	public String getRecipeOrder() {
		return recipeOrder;
	}
	public void setRecipeOrder(String recipeOrder) {
		this.recipeOrder = recipeOrder;
	}
	public String getRecipeCode() {
		return recipeCode;
	}
	public void setRecipeCode(String recipeCode) {
		this.recipeCode = recipeCode;
	}
	
	
}
