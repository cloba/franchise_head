package org.ksmart.franchise.head.util.session;

import org.apache.log4j.Logger;
import org.ksmart.franchise.head.headStaff.model.HeadStaffLogin;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("login")
public class Session {
	
	
	Logger log = Logger.getLogger(this.getClass());
	
	@RequestMapping("/login")
	public String login(Model model, @ModelAttribute HeadStaffLogin login){
		
		log.debug("Session.java의 login메서드 호출");
		model.addAttribute("login", login);
		
		return "/home";
	}
}
