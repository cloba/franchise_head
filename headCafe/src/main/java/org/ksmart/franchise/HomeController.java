package org.ksmart.franchise;

import java.util.ArrayList;

import org.ksmart.franchise.head.home.service.HomeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.InternalResourceView;

@Controller
public class HomeController {
	
	@Autowired
	private HomeService homeService;
	
	private static final Logger log = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView main(Model model) {
		log.debug("main 실행");
		
		InternalResourceView resourceView= new InternalResourceView("/WEB-INF/descriptionViews/main.jsp");
	    return new ModelAndView(resourceView);
	}
	
	@RequestMapping(value = "/index")
	public String index(Model model){
		log.debug("index 실행");
		ArrayList<Object> count = homeService.getNewCountsService();
	//	logger.debug("count---> "+count.toString());
		int orderCount = (Integer) count.get(0);
		int returnsCount = (Integer) count.get(1);
		
		ArrayList<Object> storage = new ArrayList<Object>();
		for(int i = 2; i<count.size(); i++){
			storage.add(count.get(i));
		}
		
		model.addAttribute("storage", storage);
		model.addAttribute("orderCount", orderCount);
		model.addAttribute("returnsCount", returnsCount);
		
		return "/index";
	}
}
