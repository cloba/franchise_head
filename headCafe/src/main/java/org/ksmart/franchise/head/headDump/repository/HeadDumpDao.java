package org.ksmart.franchise.head.headDump.repository;

import java.util.List;

import org.ksmart.franchise.head.headDump.model.HeadDump;
import org.ksmart.franchise.head.headDump.model.HeadDumpCommand;
import org.ksmart.franchise.head.util.Search;

public interface HeadDumpDao {

	//판매불가상품 리스트를 조회하는 메서드
	List<HeadDump> viewHeadDumpList(HeadDump headDump, Search search);

	//판매불가상품을 추가하는 메서드
	int addHeadDump(HeadDumpCommand headDumpCommand);

	//판매불가상품 하나의 상세정보 조회하는 메서드
	HeadDump viewHeadDumpDetail(String headDumpCode);

	//판매불가상품 수정하는 메서드
	int modifyHeadDump(HeadDump headDump);

	int modifyStockSub(HeadDumpCommand headDumpCommand);

}
