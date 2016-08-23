package org.ksmart.franchise.head.sell.service;

import java.util.List;

import org.ksmart.franchise.head.sell.model.ReceivedOrder;
import org.ksmart.franchise.head.sell.model.Sell;
import org.ksmart.franchise.head.sell.model.SellSearch;
import org.ksmart.franchise.head.sell.repository.SellDao;
import org.ksmart.franchise.head.util.Search;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("sellService")
public class SellServiceImpl implements SellService {
	
	@Autowired
	private SellDao sellDao;

	@Override
	public List<Sell> viewSellListService(SellSearch search) {
		System.out.println("SellServiceImpl의 viewSellListService메서드 호출");
		return sellDao.viewSellList(search);
	}

	@Override
	public Sell getSellDetailService(String headSellCode) {
		System.out.println("SellServiceImpl의 getSellDetailService메서드 호출");
		return sellDao.getSellDetail(headSellCode);
	}

	@Override
	//본사가 받은 주문 내역을 보여줍니다
	public List<ReceivedOrder> viewReceivedOrderService(Search search) {
		System.out.println("SellServiceImpl의 viewReceivedOrderService메서드 호출");
		return sellDao.viewReceivedOrder(search);	
	}

	@Override
	//본사가 들어온 주문을 승인하고 판매 내역에 추가합니다
	public void confirmOrderService(Sell sell) {
		System.out.println("SellServiceImpl의 confirmOrderService메서드 호출");		
		
		//1. 주문을 승인합니다
		int result1 = sellDao.confirmOrder(sell);
		if( result1 == 1 ){
			//2-1.승인 성공시 판매내역 추가
			int result2 = sellDao.addSell(sell);
			if( result2 != 1 ){
				//3. 판매내역 추가 실패시 추가 된 내역 삭제/승인취소
				sellDao.cancelConfirm(sell);
				sellDao.cancelSell(sell.getReceivedOrderCode());
			}
		}else if( result1 != 1 ){
			//2-2.승인 실패시 승인 취소
			sellDao.cancelConfirm(sell);
			sellDao.cancelSell(sell.getReceivedOrderCode());
		}
	}

}
