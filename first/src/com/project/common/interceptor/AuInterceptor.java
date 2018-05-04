package com.project.common.interceptor;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import com.project.school.models.School;
import com.project.user.models.User;
public class AuInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request,HttpServletResponse response, Object handler)
			throws Exception {
		String[] inList = { "login.do","check.do","layout.do","checkUser.do","user.do","userQuit.do"};
		String[] inSchool = {"jump.do", "search.do","searcher.do",
            "obtainEmployment.do","civilServant.do","postgraduate.do","entrepreneurship.do",
            "joinArmy.do"};
		String[] inUser ={"jumpUser.do"};
		for (int i = 0; i < inList.length; i++) {
			if (request.getRequestURI().endsWith(inList[i])) {
				return true;
			}
		}
        for (String inV:inSchool
             ) {
		    if(request.getRequestURI().endsWith(inV)){
                HttpSession session = request.getSession();
                School school =(School)session.getAttribute("school");
                if(school!=null){
                    return true;
                }
                else {
                    request.getRequestDispatcher("/common.jsp").forward(request, response);
                }
            }
        }
        for (String inV:inUser
             ) {
		    if(request.getRequestURI().endsWith(inV)){
		        HttpSession session = request.getSession();
                User user =(User) session.getAttribute("user");
                if(user!=null){
                    return true;
                }
                else{
                    request.getRequestDispatcher("user.jsp").forward(request,response);
                }
            }
        }
        return false;
	}
}
