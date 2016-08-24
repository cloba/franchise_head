package org.ksmart.franchise.head.home.service;

import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.ksmart.franchise.head.returns.repository.ReturnsDao;
import org.ksmart.franchise.head.sell.repository.SellDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HomeServiceImpl implements HomeService {
	
	@Autowired
	private SellDao sellDao;
	@Autowired
	private ReturnsDao returnsDao;
	Logger log = Logger.getLogger(this.getClass());

	@Override
	//새로운 반품, 주문 요청 수를 보여줍니다
	public Map<String, Integer> getNewCountsService() {
		log.debug("HomeServiceImpl의 getNewCountsService메서드 호출");
		int orderCount = sellDao.getNewOrderCount();
		int returnsCount = returnsDao.getNewReturnsCount();
		Map<String, Integer> count = new HashMap<String, Integer>();
		count.put("orderCount", orderCount);
		count.put("returnsCount", returnsCount);
		return count;
	}

}
