	/* 검색 유효성 검사 */
	function searchValid(form){
		if( $('#regitDateStart').val() == "" && $('#regitDateEnd').val() == ""){
			if(  $('#searchKey').val() == "" || $('#searchItem').val() == "" ){
				alert('검색분류를 선택하고 검색어를 입력해주세요');
			}else if( $('#searchKey').val() != "" && $('#searchItem').val() != "" ){
				form.submit();
			}
		}else if($('#regitDateStart').val() != "" && $('#regitDateEnd').val() == ""){
			alert('날짜를 정확히 선택해 주세요');
		}else if($('#regitDateStart').val() == "" && $('#regitDateEnd').val() != ""){
			alert('날짜를 정확히 선택해 주세요');
		}else{
			form.submit();
		}
	};
	
	/* 오름차 내림차 유효성 검사 */
	function upDownValid(form){
		
		if( $('#regitDateStart').val() == "" && $('#regitDateEnd').val() != ""){
			alert('검색 시작일과 종료일을 선택해주세요');
		}else if( $('#regitDateStart').val() != "" && $('#regitDateEnd').val() == ""){
			alert('검색 시작일과 종료일을 선택해주세요');
		}else{
			form.submit();
		}
	}
	
	/* 버튼 클릭 수 기록위한 함수 */
	var btnCount = 0;
	function btnClick(){
		btnCount++;
	}
	
	/* 오름차/내림차순 정렬 세팅 함수 */
	function upDownSet(criteria){
		
		/* 정렬 기준 column을 설정합니다 */
		if( criteria.indexOf("name") != -1 ){
			$('#criteria').attr('value','h_item_name');
		}else if( criteria.indexOf("date") != -1 ){
			$('#criteria').attr('value','h_item_regit_date');
		}else if( criteria.indexOf("client") != -1 ){
			$('#criteria').attr('value','head_client_code');
		}
		/* 오름차/내림차 를 설정합니다 */
		if( criteria.indexOf('Up') != -1 ){
			$('#upDown').attr('value','DESC');
		}else if( criteria.indexOf('Down') != -1 ){
			$('#upDown').attr('value','ASC');
		}
	}
	
	function upDown(criteria, form){
		
		/* 전체 리스트를 대상으로 오름차/내림차 정렬합니다 */
		if( btnCount > 0 ){
			$('#regitDateStart').attr('value','');
			$('#regitDateEnd').attr('value','');
			$('#searchItem').attr('value','');
			$('#searchKey').attr('value','');
			upDownSet(criteria);
			upDownValid(form);
			
		}else{
			upDownSet(criteria);
			form.submit();
		}
	}