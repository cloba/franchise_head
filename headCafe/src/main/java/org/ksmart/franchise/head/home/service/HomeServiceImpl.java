package org.ksmart.franchise.head.home.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.ksmart.franchise.head.item.repository.ItemDao;
import org.ksmart.franchise.head.returns.repository.ReturnsDao;
import org.ksmart.franchise.head.sell.repository.SellDao;
import org.ksmart.franchise.head.stock.repository.StockDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HomeServiceImpl implements HomeService {
	
	@Autowired
	private SellDao sellDao;
	@Autowired
	private ReturnsDao returnsDao;
	@Autowired
	private StockDao stockDao;
	@Autowired
	private ItemDao itemDao;
	Logger log = Logger.getLogger(this.getClass());

	@Override
	//새로운 반품, 주문 요청 수를 보여줍니다
	public ArrayList<Object> getNewCountsService() {
		log.debug("HomeServiceImpl의 getNewCountsService메서드 호출");
		
		ArrayList<Object> count = new ArrayList<Object>();
		//요청받은 주문 수를 가져옵니다
		int orderCount = sellDao.getNewOrderCount();
	//	String orderCount = Integer.toString(orderCountTemp);
		count.add(orderCount);
	//	log.debug("orderCount: "+orderCount);
		//요청받은 반품 수를 가져옵니다
		int returnsCount = returnsDao.getNewReturnsCount();
	//	String returnsCount = Integer.toString(returnsCountTemp);
		count.add(returnsCount);
	//	log.debug("returnsCount: "+returnsCount);
		
		//등록된 상품의 개수를 가져옵니다
		int ItemCount = itemDao.getItemCount();
		//등록된 상품들의 현재 재고량을 가져옵니다
		for(int i = 1; i<ItemCount+1; i++){
			String hItemCode = "h_item_code"+i;
			//해당상품의 상품명을 가져옵니다
			String hItemName = itemDao.getItemName(hItemCode);
			//해당 상품의 현재 재고량을 가져옵니다
			int stockCount = stockDao.getStockCount(hItemCode);
			//해당 상품의 적정 재고량을 가져옵니다
			int OptimumStorage = itemDao.getOptimumStorage(hItemCode);
		//	log.debug(hItemCode+"의 현재 재고량: "+stockCount);
		//	log.debug(hItemCode+"의 적정 재고량: "+OptimumStorage);
			//현재재고량이 적정재고량보다 작다면 view로 보냅니다
			if(stockCount<OptimumStorage){
			//	log.debug("if문 실행");
				Map<String, Object> storage = new HashMap<String, Object>();
				storage.put("hItemName", hItemName);
				storage.put("stockCount", stockCount);
				storage.put("OptimumStorage", OptimumStorage);
			//	log.debug("storage map확인 ==> "+storage.toString());
				count.add(storage);
			}
		}
		return count;
	}

}
