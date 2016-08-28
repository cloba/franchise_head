package org.ksmart.franchise.head.util.session;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.ksmart.franchise.head.headStaff.model.HeadStaffLogin;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Component
public class SessionInterceptor extends HandlerInterceptorAdapter{
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		log.debug("sessionInterceptor 실행");
		HttpSession session = request.getSession();
		boolean re = false;
		
		if( session.getAttribute("login") == null ){
			log.debug("세션없음");
			response.sendRedirect("/login.go");
		}else if( session.getAttribute("login") != null ){
			HeadStaffLogin login = (HeadStaffLogin) session.getAttribute("login");
			if( login.getHeadStaffId() == null ){
				log.debug("세션없음");
				response.sendRedirect("/login.go");
			}else{
				log.debug("세션있음: "+session.getAttribute("login"));
				re = true;
			}
		}
		
		return re;
	}
}
