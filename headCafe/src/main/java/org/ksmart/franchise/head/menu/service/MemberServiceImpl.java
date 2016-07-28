package org.ksmart.franchise.head.menu.service;

import org.ksmart.franchise.head.menu.model.Member;
import org.ksmart.franchise.head.menu.model.MemberCommand;
import org.ksmart.franchise.head.menu.repository.MemberDAoImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDAoImpl MemberDao;


	@Override
	public String loginStaffService(MemberCommand memberCommand) {
		MemberDao.loginStaff(memberCommand);
		
		return null;
		
		
		
	}

}
