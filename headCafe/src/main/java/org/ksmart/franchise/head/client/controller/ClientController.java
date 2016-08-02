package org.ksmart.franchise.head.client.controller;

import java.util.List;

import org.ksmart.franchise.head.client.model.Client;
import org.ksmart.franchise.head.client.service.ClientService;
import org.ksmart.franchise.head.headStaff.model.HeadStaff;
import org.ksmart.franchise.head.util.Search;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ClientController {
	
	@Autowired
	private ClientService clientService;

	//거래처 리스트 조회
	@RequestMapping(value="/viewHeadClientList", method=RequestMethod.GET)
	public String headViewHeadClientList(Model model, Search search){
		System.out.println("ClientController의 headViewHeadClientList메서드 ");
		
		
		List<Client> list = clientService.HeadClientListService(search);
		
		model.addAttribute("list", list);
		
		return "/client/viewHeadClientList";
		
		
	}
	//거래처 상세 정보 보는 메서드
	@RequestMapping(value="/viewHeadClientDetail", method=RequestMethod.GET)
	public String HeadClientDetail(Model model, String headClientCode){
		
		Client client = clientService.headClientDetailService(headClientCode);
		model.addAttribute("client", client);
		
		return "/client/viewHeadClientDetail";
		
	}

}
