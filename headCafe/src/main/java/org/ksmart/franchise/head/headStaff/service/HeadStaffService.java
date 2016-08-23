package org.ksmart.franchise.head.headStaff.service;

import java.util.List;

import org.ksmart.franchise.head.headStaff.model.HeadStaff;
import org.ksmart.franchise.head.headStaff.model.HeadStaffCommand;
import org.ksmart.franchise.head.headStaff.model.HeadStaffLogin;
import org.ksmart.franchise.head.util.Search;



public interface HeadStaffService {

	//본사직원을 추가합니다.
	Object addHeadStaff(HeadStaffCommand headStaffCommand);

	//본사직원리스트를 조회합니다.
	List<Object> headStaffListService(HeadStaff headStaff, Search search);

	//본사직원 한 명의 상세정보를 봅니다. 
	HeadStaff headStaffDetail(String headStaffId);

	//본사직원의 정보를 수정합니다.
	int modifyHeadStaff(HeadStaff headStaff);

	//로그인 메서드.
	String loginStaffService(HeadStaffLogin headStaffLogin);

	//퇴사하는 메서드.
	int addResignStaffService(HeadStaff headStaff);

}
