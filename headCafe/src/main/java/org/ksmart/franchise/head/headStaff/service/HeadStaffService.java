package org.ksmart.franchise.head.headStaff.service;

import java.util.List;

import org.ksmart.franchise.head.headStaff.model.HeadStaff;
import org.ksmart.franchise.head.headStaff.model.HeadStaffCommand;
import org.ksmart.franchise.head.headStaff.model.HeadStaffLogin;
import org.ksmart.franchise.head.headStaff.model.HeadStaffSearch;
import org.ksmart.franchise.head.util.Search;



public interface HeadStaffService {

	Object addHeadStaff(HeadStaffCommand headStaffCommand);

	List<Object> headStaffListService(HeadStaff headStaff, Search search);

	HeadStaff headStaffDetail(String headStaffId);

	int modifyHeadStaff(HeadStaff headStaff);

	String loginStaffService(HeadStaffLogin headStaffLogin);

	int addResignStaffService(HeadStaff headStaff);

}
