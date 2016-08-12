package org.ksmart.franchise.head.headDump.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.ksmart.franchise.head.headDump.model.HeadDump;
import org.ksmart.franchise.head.headDump.model.HeadDumpCommand;
import org.ksmart.franchise.head.util.Search;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class HeadDumpDaoImpl implements HeadDumpDao{

	private String NS = "org.ksmart.franchise.head.headDump.repository.HeadDumpMapper";
	
	@Autowired		
	private SqlSessionTemplate sqlSessionHeadDump;
		
	//판매 불가 상품 리스트 조회 메서드
	@Override
	public List<HeadDump> viewHeadDumpList(HeadDump headDump, Search search) {
		System.out.println("RoyaltyDaoImpl의 RoyaltyList메서드");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("headDump", headDump);
		return sqlSessionHeadDump.selectList(NS+".selectHeadDumpList", map);
	}

	//판매 불가 상품 등록 메서드
	@Override
	public int addHeadDump(HeadDumpCommand headDumpCommand) {
		System.out.println("RoyaltyDaoImpl의 RoyaltyListaddHeadDump");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("headDumpCommand", headDumpCommand);
		return sqlSessionHeadDump.insert(NS+".insertHeadDump", map);
	}

	@Override
	public HeadDump viewHeadDumpDetail(String headDumpCode) {
		System.out.println("RoyaltyDaoImpl의 viewHeadDumpDetail");
		
		return sqlSessionHeadDump.selectOne(NS+".selectHeadDumpDetail", headDumpCode);
	}

}
