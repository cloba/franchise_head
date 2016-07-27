package org.ksmart.franchise.head.stock.repository;

import java.util.List;

import org.ksmart.franchise.head.stock.model.Stock;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StockDaoImpl implements StockDao {
	private final String NS = "org.ksmart.franchise.head.stock.repository.StockMapper";
	
	@Autowired
	private SqlSessionTemplate sqlSessionStock;
	
	
	@Override
	public List<Stock> viweHeadStrockList() {
		
		return sqlSessionStock.selectList(NS+".selectStockList");
	}

}
