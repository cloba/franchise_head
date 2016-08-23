package org.ksmart.franchise.head.client.repository;

import java.util.List;

import org.ksmart.franchise.head.client.model.Client;
import org.ksmart.franchise.head.client.model.ClientCommand;
import org.ksmart.franchise.head.util.Search;

public interface ClientDao {
	
	//본사 거래처리스트를 조회하는 메서드
	List<Client> HeadClientList(Search search);

	//본사 거래처 상세정보를 조회하는 메서드
	Client HeadClientDetail(String headClientCode);

	//본사 거래처를 추가하는 메서드
	int addHeadClient(ClientCommand clientCommand);

	//본사 거래처 수정하는 메서드
	int modifyHeadClient(Client client);
	
}
