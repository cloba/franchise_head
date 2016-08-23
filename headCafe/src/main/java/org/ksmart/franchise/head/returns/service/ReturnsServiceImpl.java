package org.ksmart.franchise.head.returns.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.ksmart.franchise.head.returns.model.Returns;
import org.ksmart.franchise.head.returns.model.ReturnsProcess;
import org.ksmart.franchise.head.returns.repository.ReturnsDao;
import org.ksmart.franchise.head.util.Search;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReturnsServiceImpl implements ReturnsService{
	
	@Autowired
	private ReturnsDao returnsDao;
	
	Logger log = Logger.getLogger(this.getClass());
	
	//반품 리스트 보여주는 메서드
	@Override
	public List<Returns> viewReturnsListService(Returns returns, Search search) {
		log.debug("ReturnsServiceImpl의 viewReturnsListService메서드");
		return returnsDao.viewReturnsList(returns, search);
	}
	//반품 상세 정보 보여주는 메서드
	@Override
	public Returns viewReturnsDetailService(Returns returns) {
		log.debug("ReturnsServiceImpl의 viewReturnsDetailService메서드");
		return returnsDao.viewReturnsDetail(returns);
	}
	
	//반품 본사가 확인하여 재배송하는 메서드
	@Override
	public void addHeadDumpService(ReturnsProcess returnsProcess) {
		log.debug("ReturnsServiceImpl의 modifyHeadDumpService메서드");
		//본사가 반품 확인하는 메서드
		returnsDao.modifyReturnsApproval(returnsProcess);
		
		List<Returns> list = returnsDao.selectReturnsGroupCode(returnsProcess);
		
		for(int i=0; i<list.size(); i++){
			list.get(i).setHeadStaffId(returnsProcess.getHeadStaffId());
			returnsDao.addReDelivery(list.get(i));
		}	
	}

}
