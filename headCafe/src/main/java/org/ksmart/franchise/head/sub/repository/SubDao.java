package org.ksmart.franchise.head.sub.repository;

import java.util.List;

import org.ksmart.franchise.head.sub.model.Sub;
import org.ksmart.franchise.head.sub.model.SubCommand;
import org.ksmart.franchise.head.util.Search;

public interface SubDao {
	//sub의 리스트를 불러오는 메서드입니다
	public List<Sub> viewSubList(Search subSearch); 
	//sub 한개의 상세를 불러오는 메서드입니다
	public Sub getSubDetail(String subCode);
	//sub을 추가하는 메서드입니다
	public void addSub(SubCommand subCommand);
	//sub을 수정하는 메서드입니다
	public void modifySub(SubCommand subCommand);
}
