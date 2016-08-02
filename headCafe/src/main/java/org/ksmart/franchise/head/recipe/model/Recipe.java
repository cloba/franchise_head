package org.ksmart.franchise.head.recipe.model;


public class Recipe {
	
	private String recipeCode; //레시피코드
	private String menuCode; //메뉴코드
	private String recipeAct; //조리내용
	private String headStaffId; //등록한 아이디
	private String recipeRegitDate;  //등록한 날짜
	private String menuName;     //메뉴 이름
	private String recipeOrder; //레시피 순서
//	private IngrePrice ingrePrice; //메뉴가격
//	private String ingreName;    //재료이름
//	private String ingreAmount;  //재료량
//	private String hItemCode;    //상품 코드
//	private String ingreStatus; //현재적용상태
	
	
	public String getRecipeCode() {
		return recipeCode;
	}
	public void setRecipeCode(String recipeCode) {
		this.recipeCode = recipeCode;
	}
	public String getMenuCode() {
		return menuCode;
	}
	public void setMenuCode(String menuCode) {
		this.menuCode = menuCode;
	}
	public String getRecipeAct() {
		return recipeAct;
	}
	public void setRecipeAct(String recipeAct) {
		this.recipeAct = recipeAct;
	}
	public String getHeadStaffId() {
		return headStaffId;
	}
	public void setHeadStaffId(String headStaffId) {
		this.headStaffId = headStaffId;
	}
	public String getRecipeRegitDate() {
		return recipeRegitDate;
	}
	public void setRecipeRegitDate(String recipeRegitDate) {
		this.recipeRegitDate = recipeRegitDate;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getRecipeOrder() {
		return recipeOrder;
	}
	public void setRecipeOrder(String recipeOrder) {
		this.recipeOrder = recipeOrder;
	}
	
	
	
	
	
}
