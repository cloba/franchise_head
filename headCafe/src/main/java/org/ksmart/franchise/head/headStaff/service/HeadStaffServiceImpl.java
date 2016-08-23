package org.ksmart.franchise.head.headStaff.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.ksmart.franchise.head.headStaff.model.HeadStaff;
import org.ksmart.franchise.head.headStaff.model.HeadStaffCommand;
import org.ksmart.franchise.head.headStaff.model.HeadStaffLogin;
import org.ksmart.franchise.head.headStaff.repository.HeadStaffDao;
import org.ksmart.franchise.head.util.Search;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

//박종무 0722 
@Service
public class HeadStaffServiceImpl implements HeadStaffService{
	
	
	@Autowired
	private HeadStaffDao headStaffDao;
	Logger log = Logger.getLogger(this.getClass());
	
	//headstaff객체를 받아 dao를 호출하여 처리한다.
	@Override
	public Object addHeadStaff(HeadStaffCommand headStaffCommand) {
		System.out.println("HeadStaffServiceImpl의 addHeadStaff 메서드");
		//
		return headStaffDao.addHeadStaff(headStaffCommand);
		
	}
	
	//본사 직원 리스트를 호출하는 메서드
	@Override
	public List<Object> headStaffListService(HeadStaff headStaff, Search search) {
		return headStaffDao.headStaffList(headStaff, search);
	}
	
	//본사직원 개인의 정보를 불러오는 메서드
	@Override
	public HeadStaff headStaffDetail(String headStaffId) {
		
		return headStaffDao.headStaffDetail(headStaffId);
	}

	//본사직원 개인정보를 수정하는 메서드
	@Override
	public int modifyHeadStaff(HeadStaff headstaff) {
		return headStaffDao.headStaffModify(headstaff);
		
	}
	
	//본사직원 로그인 메서드
	@Override
	public String loginStaffService(HeadStaffLogin headStaffLogin) {
		log.debug("HeadStaffServiceImpl의 loginStaffService 메서드");
		
		String re = null;
		
		if(null != headStaffDao.headStaffLogin(headStaffLogin)){
			log.debug("service test:: "+headStaffDao.headStaffLogin(headStaffLogin).toString());
			re = "success";
		}else{
			re = "fail";
		}
		
		return re;
	}
	
	//본사직원 퇴사하는 메서드
	@Override
	public int addResignStaffService(HeadStaff headStaff) {
		System.out.println("HeadStaffServiceImpl의 addResignStaffService 메서드");
		return headStaffDao.addResignStaff(headStaff);
	}

//	@Override
//	public void viewResignStaffListService(HeadStaff headStaff) {
//		headStaffDao.viewResignStaffList(headStaff);
//		
//	}
}
