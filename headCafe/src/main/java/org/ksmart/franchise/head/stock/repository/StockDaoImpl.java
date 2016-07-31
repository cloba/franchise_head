package org.ksmart.franchise.head.stock.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.ksmart.franchise.head.stock.model.Stock;
import org.ksmart.franchise.head.util.Search;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StockDaoImpl implements StockDao {

	private final String NS = "org.ksmart.franchise.head.stock.repository.StockMapper";
	
	@Autowired
	private SqlSessionTemplate sqlSessionStock;
	
	
	//재고 리스트 조회 메서드
	@Override
	public List<Stock> viweHeadStrockList(Search search) {
		System.out.println("StockDaoImpl의 viweHeadStrockList메서드");
		Map<String, Object> map = new HashMap<String, Object >();
		map.put("search", search);
		return sqlSessionStock.selectList(NS+".selectStockList", map);
	}


	
	//단일 재고의 상세 정보를 보여주는 메서드 
	@Override
	public Stock viewHeadStrockDetail(Stock stock) {
		System.out.println("StockDaoImpl의 viewHeadStrockDetail메서드");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("stock", stock);
		return sqlSessionStock.selectOne(NS+".selectStockDetail", map);
	}

}
