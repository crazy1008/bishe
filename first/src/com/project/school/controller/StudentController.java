package com.project.school.controller;


import com.project.school.models.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import com.github.pagehelper.PageInfo;
import com.project.school.service.StudentService;
import javax.servlet.http.HttpSession;

@Controller
public class StudentController {

    @Autowired
    private StudentService studentService;

    @RequestMapping("check.do")
    public ModelAndView check(HttpServletRequest request, Integer pageNum) {
        HttpSession session = request.getSession();
        session.getAttribute("school");
        ModelAndView mvAndView = new ModelAndView();
        School school = (School) session.getAttribute("school");
        if (school != null) {
            if (pageNum == null) {
                pageNum = 1;
            }
            PageInfo<Student> student = studentService.searchAll(pageNum);
            mvAndView.addObject("lists", student);
            mvAndView.setViewName("project/school/index");
        } else {
            mvAndView.setViewName("project/school/login");
        }

        return mvAndView;
    }

    @RequestMapping("jump.do")
    public ModelAndView jump(Integer pageNum) {
        if (pageNum == null) {
            pageNum = 1;
        }
        ModelAndView mvAndView = new ModelAndView();
        PageInfo<Student> student = studentService.searchAll(pageNum);
        mvAndView.addObject("lists", student);
        mvAndView.setViewName("project/school/index");
        return mvAndView;
    }

    @RequestMapping("search.do")
    public ModelAndView search(Student student, Integer pageNum) {
        if (pageNum == null || pageNum > 1) {
            pageNum = 1;
        }
        ModelAndView mvAndView = new ModelAndView();
        PageInfo<Student> student1 = studentService.search(student, pageNum);
        mvAndView.addObject("st", student);
        mvAndView.addObject("lists", student1);
        mvAndView.setViewName("project/school/index");
        return mvAndView;
    }

    @RequestMapping("searcher.do")
    public ModelAndView searcher(Student student, Integer pageNum) {
        if (pageNum == null) {
            pageNum = 1;
        }
        ModelAndView mvAndView = new ModelAndView();
        PageInfo<Student> student1 = studentService.search(student, pageNum);
        mvAndView.addObject("st", student);
        mvAndView.addObject("lists", student1);
        mvAndView.setViewName("project/school/index");
        return mvAndView;
    }

    @RequestMapping("obtainEmployment.do")
    public ModelAndView obtainEmployment(Integer stateId) {
        ModelAndView mView = new ModelAndView();
        Company company = studentService.obtainEmployment(stateId);
        mView.addObject("company", company);
        mView.setViewName("project/school/obtainEmployment");
        return mView;
    }

    @RequestMapping("joinArmy.do")
    public ModelAndView joinArmy(Integer stateId) {
        ModelAndView mView = new ModelAndView();
        JoinArmy joinArmy = studentService.joinArmy(stateId);
        mView.addObject("joinArmy", joinArmy);
        mView.setViewName("project/school/joinArmy");
        return mView;
    }

    @RequestMapping("civilServant.do")
    public ModelAndView civilServant(Integer stateId) {
        ModelAndView mView = new ModelAndView();
        CivilServant civilServant = studentService.civilServant(stateId);
        mView.addObject("civilServant", civilServant);
        mView.setViewName("project/school/civilServant");
        return mView;
    }

    @RequestMapping("postgraduate.do")
    public ModelAndView postgraduate(Integer stateId) {
        ModelAndView mView = new ModelAndView();
        Postgraduate postgraduate = studentService.postgraduate(stateId);
        mView.addObject("postgraduate", postgraduate);
        mView.setViewName("project/school/postgraduate");
        return mView;
    }
    @RequestMapping("entrepreneurship.do")
    public ModelAndView entrepreneurship(Integer stateId) {
        ModelAndView mView = new ModelAndView();
        Entrepreneurship entrepreneurship = studentService.entrepreneurship(stateId);
        mView.addObject("entrepreneurship", entrepreneurship);
        mView.setViewName("project/school/entrepreneurship");
        return mView;
    }
}
