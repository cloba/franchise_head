var modifyPop = function (hItemCode){
		window.open("/headModifyItem?hItemCode="+hItemCode+"", "", "width=500, height=500, left=500, top=500");
	}

var addPop = function(){
		window.open("/headAddItem", "SmallWindwo", "width=500, height=500, left=500, top=500");
		
}

function sendTxt(){
		
		window.opener.document.addItemLink.addedItemName.value = document.addForm.hItemName.value;
		window.opener.document.addItemLink.addedItemName.value.select();
		//window.opener.location.reload();
		window.open('','_self').close();	
}