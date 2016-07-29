package org.ksmart.franchise.head.headStaff.service;

import java.util.List;

import org.ksmart.franchise.head.headStaff.model.HeadStaff;
import org.ksmart.franchise.head.headStaff.model.HeadStaffCommand;
import org.ksmart.franchise.head.headStaff.model.HeadStaffSearch;



public interface HeadStaffService {

	Object addHeadStaff(HeadStaffCommand headStaffCommand);

	List<Object> headStaffList(HeadStaff headStaff, HeadStaffSearch headStaffSearch);

	HeadStaff headStaffDetail(String headStaffId);

	int modifyHeadStaff(HeadStaff headStaff);

	HeadStaff loginStaffService(HeadStaffCommand headStaffCommand);

	void addResignStaffService(HeadStaff headStaff);

//	void viewResignStaffListService(HeadStaff headStaff);

}
