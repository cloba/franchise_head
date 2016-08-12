package org.ksmart.franchise.head.returns.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.ksmart.franchise.head.returns.model.Returns;
import org.ksmart.franchise.head.util.Search;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReturnsDaoImpl implements ReturnsDao {
	
	private final String NS = "org.ksmart.franchise.head.returns.repository.ReturnsMapper";
	
	@Autowired
	private SqlSessionTemplate sqlSessionReturns;
	
	//반품 상품 리스트 조회 메서드
	@Override
	public List<Returns> viewReturnsList(Returns returns, Search search) {
		System.out.println("ReturnsDaoImpl의 viewReturnsList메서드");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("returns", returns);
		
		return sqlSessionReturns.selectList(NS+".selectReturnsList", map);
	}

	//반품 상품 상세 정보 조회 메서드
	@Override
	public Returns viewReturnsDetail(Returns returns) {
		System.out.println("ReturnsDaoImpl의 viewReturnsDetail메서드");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("returns", returns);
		return sqlSessionReturns.selectOne(NS+".selectReturnDetail", map);
	}

	@Override
	public int modifyReturnsApproval(String returnsCode, String returnApprovalIdenfity) {
		System.out.println("ReturnsDaoImpl의 modifyReturnsApproval메서드");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("returnsCode", returnsCode);
		map.put("returnApprovalIdenfity", returnApprovalIdenfity);
		
		return sqlSessionReturns.update(NS+".updateReturnsApproval", map);
	}

}
