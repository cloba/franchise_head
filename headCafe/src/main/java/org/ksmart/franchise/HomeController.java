package org.ksmart.franchise;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.InternalResourceView;


@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView main(Locale locale, Model model) {
		logger.debug("main 실행");
		
		InternalResourceView resourceView= new InternalResourceView("/WEB-INF/descriptionViews/main.jsp");
	    return new ModelAndView(resourceView);
	}
	
	@RequestMapping(value = "/index")
	public String index(){
		logger.debug("index 실행");
		
		return "/index";
	}
}
