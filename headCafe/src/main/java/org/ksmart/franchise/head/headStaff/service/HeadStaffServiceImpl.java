package org.ksmart.franchise.head.headStaff.service;

import java.util.List;

import org.ksmart.franchise.head.headStaff.model.HeadStaff;
import org.ksmart.franchise.head.headStaff.model.HeadStaffCommand;
import org.ksmart.franchise.head.headStaff.model.HeadStaffLogin;
import org.ksmart.franchise.head.headStaff.model.HeadStaffSearch;
import org.ksmart.franchise.head.headStaff.repository.HeadStaffDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

//박종무 0722 
@Service
public class HeadStaffServiceImpl implements HeadStaffService{
	
	
	@Autowired
	private HeadStaffDao headStaffDao;

	//headstaff객체를 받아 dao를 호출하여 처리한다.
	@Override
	public Object addHeadStaff(HeadStaffCommand headStaffCommand) {
		System.out.println("HeadStaffServiceImpl의 addHeadStaff 메서드");
		//
		return headStaffDao.addHeadStaff(headStaffCommand);
		
	}
	
	//본사 직원 리스트를 호출하는 메서드
	@Override
	public List<Object> headStaffListService(HeadStaff headStaff, HeadStaffSearch headStaffSearch) {
		return headStaffDao.headStaffList(headStaff, headStaffSearch);
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
	public HeadStaffLogin loginStaffService(HeadStaffLogin headStaffLogin) {
		return headStaffDao.headStaffLogin(headStaffLogin);
		
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
