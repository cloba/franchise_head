package org.ksmart.franchise.head.sub.repository;

import java.util.List;

import org.ksmart.franchise.head.sub.model.Sub;
import org.ksmart.franchise.head.util.Search;

public interface SubDao {
	//sub의 리스트를 불러오는 메서드입니다
	public List<Sub> viewSubList(Search subSearch); 
}
