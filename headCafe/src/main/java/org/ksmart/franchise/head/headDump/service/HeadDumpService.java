package org.ksmart.franchise.head.headDump.service;

import java.util.List;

import org.ksmart.franchise.head.headDump.model.HeadDump;
import org.ksmart.franchise.head.headDump.model.HeadDumpCommand;
import org.ksmart.franchise.head.util.Search;

public interface HeadDumpService {
	
	//판매불가상품 리스트를 조회하는 메서드
	List<HeadDump> viewHeadDumpService(HeadDump headDump, Search search);
	
	//판매불가상품 리스트 추가 메서드
	void addHeadDumpService(HeadDumpCommand headDumpCommand) throws Exception;
	
	//판매불가상품 하나의 상세정보 조회 메서드
	HeadDump viewHeadDumpDetailService(String headDumpCode);

	//판매불가상품 수정하는 메서드
	int modifyHeadDumpService(HeadDump headDump);


}
