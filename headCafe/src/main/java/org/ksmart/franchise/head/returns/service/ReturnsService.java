package org.ksmart.franchise.head.returns.service;

import java.util.List;

import org.ksmart.franchise.head.returns.model.Returns;
import org.ksmart.franchise.head.returns.model.ReturnsProcess;
import org.ksmart.franchise.head.util.Search;

public interface ReturnsService {

	//반품상품의 리스트를 조회하는 메서드
	List<Returns> viewReturnsListService(Returns returns, Search search);

	//반품상품 하나의 상세정보를 조회하는 메서드
	Returns viewReturnsDetailService(Returns returns);

	//반품상품을 승인해 재배송 요청하는 메서드
	void addHeadDumpService(ReturnsProcess returnsProcess);

}