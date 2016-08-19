/**
 * 천단위 마다 쉼표를 찍어줍니다
 */
//콤마찍기
function comma(num) {
	num = String(num);
    return num.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}
//콤마풀기
function uncomma(str) {
    str = String(str);
    return str.replace(/[^\d]+/g, '');
}
//값 입력시 콤마찍기
function inputNumberFormat(obj) {
    obj = comma(uncomma(obj));
    return obj;
}


//jsp에 넣을 코드
/*$('.comma').blur(function(){
	console.log($(this).val());
	var result = inputNumberFormat($(this).val());
	$(this).val(result);
});*/