var modifyPop = function (hItemCode){
	window.open("/headModifyItem?hItemCode="+hItemCode+"", "", "width=500, height=500, left=500, top=500");
	}

var addPop = function(){
	window.open("/headAddItem", "SmallWindwo", "width=500, height=500, left=500, top=500");
}

var closeAdd = function(){
	
	/*document.addForm.submit();*/
	var temp = document.addForm.hItemName.value
	window.opener.location.reload();
	window.opener.document.addItemLink.addedItemName.value = "test";
	/*window.opener.document.addItemLink.addedItemName.value.select();*/
	window.close();
}