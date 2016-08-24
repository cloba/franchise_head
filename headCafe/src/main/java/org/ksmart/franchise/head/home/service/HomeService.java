package org.ksmart.franchise.head.home.service;

import java.util.Map;

public interface HomeService {
	//새로 들어온 주문/반품 요청 개수를 보여줍니다
	Map<String, Integer> getNewCountsService();
		
}
