package com.project.user.controller;

import com.project.user.models.User;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import org.springframework.stereotype.Controller;
import org.springframework.beans.factory.annotation.Autowired;
import com.project.user.service.UserService;
import com.project.user.service.CodeService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private CodeService codeService;

    @RequestMapping("checkUser.do")
    public ModelAndView checkUser(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();
        HttpSession session = request.getSession();
        User user =(User)session.getAttribute("user");
        if(user!=null){
            modelAndView.setViewName("project/user/index");
        }else{
            modelAndView.setViewName("project/user/userList");
        }
        return modelAndView;
    }
    @RequestMapping("jumpUser.do")
    public ModelAndView jumpUser(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("project/user/index");
        return modelAndView;
    }
    @RequestMapping("user.do")
    @ResponseBody
    public Map<String,String> user(User user,HttpSession session){
        Map<String,String> map = new HashMap<String,String>();
        User user1 = userService.searchUser(user);
        if(user1==null){
            map.put("tip","error");
        }else{
            if(user1.getPassword().equals(user.getPassword())){
                session.setAttribute("user",user1);
                map.put("tip","success");
            }
            else{
                map.put("tip","notPassword");
            }
        }
        return map;
    }
    @RequestMapping("userQuit.do")
    public void userQuit(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.removeAttribute("user");
        request.getRequestDispatcher("/user.jsp").forward(request,response);
    }
}
