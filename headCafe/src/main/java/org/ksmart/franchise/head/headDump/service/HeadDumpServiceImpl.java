package org.ksmart.franchise.head.headDump.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.ksmart.franchise.head.headDump.model.HeadDump;
import org.ksmart.franchise.head.headDump.model.HeadDumpCommand;
import org.ksmart.franchise.head.headDump.repository.HeadDumpDao;
import org.ksmart.franchise.head.util.Search;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HeadDumpServiceImpl implements HeadDumpService{
	
	@Autowired
	private HeadDumpDao headDumpDao;
	Logger log = Logger.getLogger(this.getClass());
	
	//판매불가 상품 리스트 조회 메서드
	@Override
	public List<HeadDump> viewHeadDumpService(HeadDump headDump, Search search) {
		log.debug("HeadDumpServiceImpl의 viewHeadDumpService메서드");
		return headDumpDao.viewHeadDumpList(headDump, search);
	}
	
	//판매불가 상품 등록 메서드
	@Override
	public int addHeadDumpService(HeadDumpCommand headDumpCommand) {
		log.debug("HeadDumpServiceImpl의 addHeadDumpService메서드");
		return headDumpDao.addHeadDump(headDumpCommand);
		
	}
	//판매 불가 상품 상세 정보 조회 메서드
	@Override
	public HeadDump viewHeadDumpDetailService(String headDumpCode) {
		log.debug("HeadDumpServiceImpl의 viewHeadDumpDetailService메서드");
		return headDumpDao.viewHeadDumpDetail(headDumpCode);
	}

	@Override
	public int modifyHeadDumpService(HeadDump headDump) {
		log.debug("HeadDumpServiceImpl의 modifyHeadDumpService메서드");
		return headDumpDao.modifyHeadDump(headDump);
	}
}
