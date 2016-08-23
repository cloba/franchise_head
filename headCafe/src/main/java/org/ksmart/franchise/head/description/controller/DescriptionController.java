package org.ksmart.franchise.head.description.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.InternalResourceView;

@Controller
public class DescriptionController {

	Logger log = Logger.getLogger(this.getClass());
	
	@RequestMapping(value="/viewERD", method = RequestMethod.GET)
	public ModelAndView viewERD(){
		log.debug("viewERD 실행");
		
		InternalResourceView resourceView= new InternalResourceView("/WEB-INF/descriptionViews/viewERD.jsp");
	    return new ModelAndView(resourceView);
	}
	
	@RequestMapping(value="/viewEnvironment", method = RequestMethod.GET)
	public ModelAndView viewEnvironment(){
		log.debug("viewEnvironment 실행");
		
		InternalResourceView resourceView= new InternalResourceView("/WEB-INF/descriptionViews/viewEnvironment.jsp");
		return new ModelAndView(resourceView);
	}
}
