package com.project.school.service.imp;

import java.util.List;

import com.project.school.models.*;
import org.springframework.beans.factory.annotation.Autowired;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.project.school.dao.StudentDao;
import com.project.school.service.StudentService;
import com.project.common.util.Constants;

public class StudentServiceImpl implements StudentService {
	@Autowired
	private StudentDao studentDao;

    @Override
    public CivilServant civilServant(Integer stateId) {
        CivilServant civilServant = studentDao.civilServant(stateId);
        return civilServant;
    }

    @Override
    public Postgraduate postgraduate(Integer stateId) {
        Postgraduate postgraduate = studentDao.postgraduate(stateId);
        return postgraduate;
    }

    @Override
    public Entrepreneurship entrepreneurship(Integer stateId) {
        Entrepreneurship entrepreneurship = studentDao.entrepreneurship(stateId);
        return entrepreneurship;
    }

    @Override
	public PageInfo<Student> searchAll(Integer pageNum) {
		PageInfo<Student>page=null;
		PageHelper.startPage(pageNum, Constants.PAGE_SIZE);
		List<Student> student = studentDao.searchAll();
		page = new PageInfo<Student>(student);
		return page;
	}

	@Override
	public PageInfo<Student> search(Student student, Integer pageNum) {
		PageInfo<Student>page=null;
		PageHelper.startPage(pageNum, Constants.PAGE_SIZE);
		List<Student> students = studentDao.search(student);
		page = new PageInfo<Student>(students);
		return page;
	}

    @Override
    public JoinArmy joinArmy(Integer stateId) {
	    JoinArmy joinArmy = studentDao.joinArmy(stateId);
        return joinArmy;
    }

    @Override
	public Company obtainEmployment(Integer stateId) {
		Company company = studentDao.obtainEmployment(stateId);
		return company;
	}

}
