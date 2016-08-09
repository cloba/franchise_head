package org.ksmart.franchise.head.sub.service;

import java.util.List;

import org.ksmart.franchise.head.sub.model.Sub;
import org.ksmart.franchise.head.sub.model.SubCommand;
import org.ksmart.franchise.head.util.Search;

public interface SubService {
	//가맹 리스트를 불러옵니다
	public List<Sub> viewSubListService(Search subSearch);
	//가맹  상세를 보여줍니다
	public Sub getSubDetailService(String subCode);
	//가맹을 등록합니다
	public void addSubService(SubCommand subCommand);
	//가맹점 정보를 수정합니다
	public void modifySubService(SubCommand subCommand);
}
