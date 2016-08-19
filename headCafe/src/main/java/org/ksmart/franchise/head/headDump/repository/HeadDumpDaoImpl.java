package org.ksmart.franchise.head.headDump.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
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
	Logger log = Logger.getLogger(this.getClass());
		
	//판매 불가 상품 리스트 조회 메서드
	@Override
	public List<HeadDump> viewHeadDumpList(HeadDump headDump, Search search) {
		log.debug("HeadDumpDaoImpl의 RoyaltyList 메서드");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("headDump", headDump);
		return sqlSessionHeadDump.selectList(NS+".selectHeadDumpList", map);
	}

	//판매 불가 상품 등록 메서드
	@Override
	public int addHeadDump(HeadDumpCommand headDumpCommand) {
		log.debug("HeadDumpDaoImpl의 RoyaltyListaddHeadDump 메서드");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("headDumpCommand", headDumpCommand);
		return sqlSessionHeadDump.insert(NS+".insertHeadDump", map);
	}
	//판매 불가 상품 상세정보 조회 메서드
	@Override
	public HeadDump viewHeadDumpDetail(String headDumpCode) {
		log.debug("HeadDumpDaoImpl의 viewHeadDumpDetail 메서드");
		return sqlSessionHeadDump.selectOne(NS+".selectHeadDumpDetail", headDumpCode);
	}

	@Override
	public int modifyHeadDump(HeadDump headDump) {
		log.debug("HeadDumpDaoImpl의 modifyHeadDump 메서드");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("headDump", headDump);
		return sqlSessionHeadDump.update(NS+".updateHeadDump", map);
	}
}
