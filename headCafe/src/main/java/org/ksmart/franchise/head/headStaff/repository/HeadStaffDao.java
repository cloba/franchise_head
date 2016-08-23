package org.ksmart.franchise.head.headStaff.repository;

import java.util.List;

import org.ksmart.franchise.head.headStaff.model.HeadStaff;
import org.ksmart.franchise.head.headStaff.model.HeadStaffCommand;
import org.ksmart.franchise.head.headStaff.model.HeadStaffLogin;
import org.ksmart.franchise.head.util.Search;



public interface HeadStaffDao {
	//본사직원을 등록하는 메서드
	int addHeadStaff(HeadStaffCommand headStaffCommand);
	
	//본사직원 리스트를 조회하는 메서드
	List<Object> headStaffList(HeadStaff headStaff, Search search);
	
	//본사직원 한명의 상세정보를 보는 메서드
	HeadStaff headStaffDetail(String headStaffId);
	
	//본사직원 수정하는 메서드
	int headStaffModify(HeadStaff headstaff);
	
	//본사직원 로그인 메서드
	HeadStaffLogin headStaffLogin(HeadStaffLogin headStaffLogin);
	
	//본사직원 퇴사하는 메서드
	public int addResignStaff(HeadStaff headStaff);
}
