package org.ksmart.franchise.head.returns.repository;

import java.util.List;

import org.ksmart.franchise.head.returns.model.Returns;
import org.ksmart.franchise.head.returns.model.ReturnsProcess;
import org.ksmart.franchise.head.util.Search;

public interface ReturnsDao {

	//반품상품 리스트 조회 메서드
	List<Returns> viewReturnsList(Returns returns, Search search);

	//반품상품 하나의 상세 정보 조회 메서드
	Returns viewReturnsDetail(Returns returns);

	//반품상풀을 승인하는 메서드
	int modifyReturnsApproval(ReturnsProcess returnsProcess);

	//반품상품을 재배송입력하는 메서드
	void addReDelivery(Returns returns);

	//반품상품의 그룹코드 및 정보를 조회하는 메서드
	List<Returns> selectReturnsGroupCode(ReturnsProcess returnsProcess);
	
	//반품요청 개수 조회하는 메서드
	int getNewReturnsCount();

}
