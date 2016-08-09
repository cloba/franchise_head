package org.ksmart.franchise.head.headStaff.repository;

import java.util.List;

import org.ksmart.franchise.head.headStaff.model.HeadStaff;
import org.ksmart.franchise.head.headStaff.model.HeadStaffCommand;
import org.ksmart.franchise.head.headStaff.model.HeadStaffLogin;
import org.ksmart.franchise.head.headStaff.model.HeadStaffSearch;



public interface HeadStaffDao {

	int addHeadStaff(HeadStaffCommand headStaffCommand);

	List<Object> headStaffList(HeadStaff headStaff, HeadStaffSearch headStaffSearch);

	HeadStaff headStaffDetail(String headStaffId);

	int headStaffModify(HeadStaff headstaff);

	HeadStaffLogin headStaffLogin(HeadStaffLogin headStaffLogin);

	public int addResignStaff(HeadStaff headStaff);
}
