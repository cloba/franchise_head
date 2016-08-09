package org.ksmart.franchise.head.headStaff.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.ksmart.franchise.head.headStaff.model.HeadStaff;
import org.ksmart.franchise.head.headStaff.model.HeadStaffCommand;
import org.ksmart.franchise.head.headStaff.model.HeadStaffLogin;
import org.ksmart.franchise.head.headStaff.model.HeadStaffSearch;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class HeadStaffDaoImpl implements HeadStaffDao{
	
	//mapper주소 변수로 저장
	private final String NS = "org.ksmart02.cafe.headStaff.repository.HeadStaffMapper";

	@Autowired
	private SqlSessionTemplate sqlSessionHeadStaff;
	
	
	//form에서 입력한 headstaff객체를 받아 회원가입처리 하는 메서드.
	@Override        
	public int addHeadStaff(HeadStaffCommand headStaffCommand) {  
		System.out.println("HeadStaffDaoImpl의 addHeadStaff메서드");
		return sqlSessionHeadStaff.insert(NS+".insertHeadStaff", headStaffCommand);
	}

	//본사직원 리스트를 호출하는 메서드
	@Override
	public List<Object> headStaffList(HeadStaff headStaff, HeadStaffSearch headStaffSearch) {
		System.out.println("HeadStaffDaoImpl의 HeadStaffList메서드");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("headStaff", headStaff);
		map.put("headStaffSearch", headStaffSearch);
		
		return sqlSessionHeadStaff.selectList(NS+".selectHeadStaffList", map);
	}
	
	//본사직원의 개인정보를 가져오는 메서드
	@Override
	public HeadStaff headStaffDetail(String headStaffId) {
		System.out.println("HeadStaffDaoImpl의 HeadStaffDetail메서드");
		
		return sqlSessionHeadStaff.selectOne(NS+".selectHeadStaffDetail", headStaffId);
	}

	//회원정보를 수정하는 메서드
	@Override
	public int headStaffModify(HeadStaff headstaff) {
		System.out.println("HeadStaffDaoImpl의 headStaffModify메서드");
		
		return sqlSessionHeadStaff.update(NS+".updateHeadStaff", headstaff);
	}

	//로그인 하는 메서드
	@Override
	public HeadStaffLogin headStaffLogin(HeadStaffLogin headStaffLogin) {
		System.out.println("HeadStaffDaoImpl의 headStafflogin메서드");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("headStaffLogin", headStaffLogin);
		return sqlSessionHeadStaff.selectOne(NS+".selectHeadStaffLogin", map);
	}

	//퇴사자 등록 하는 메서드
	@Override
	public int addResignStaff(HeadStaff headStaff) {
		System.out.println("HeadStaffDaoImpl의 addResignStaff메서드");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("headStaff", headStaff);
		
		return sqlSessionHeadStaff.update(NS+".updateHeadStaffResign", map);
		
	}
	


	



}
