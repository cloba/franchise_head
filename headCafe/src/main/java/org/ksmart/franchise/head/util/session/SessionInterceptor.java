package org.ksmart.franchise.head.util.session;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
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
		
		if( session == null || session.getAttribute("login") == null ){
			response.sendRedirect("/login.go");
			return false;
		}
		
		return true;
	}
}
