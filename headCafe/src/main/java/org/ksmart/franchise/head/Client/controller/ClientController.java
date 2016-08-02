package org.ksmart.franchise.head.Client.controller;

import java.util.List;

import org.ksmart.franchise.head.Client.model.Client;
import org.ksmart.franchise.head.Client.service.ClientService;
import org.ksmart.franchise.head.util.Search;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

public class ClientController {
	
	@Autowired
	private ClientService clientService;

	
	@RequestMapping(value="/viewHeadClientList", method=RequestMethod.GET)
	public String headViewHeadClientList(Model model, Search search){
		System.out.println("ClientController의 headViewHeadClientList메서드 ");
		
		
		List<Client> list = clientService.HeadClientListService(search);
		
		model.addAttribute("list", list);
		
		return "/client/viewHeadClientList";
		
		
	}
}
