package com.project.school.service;

import com.github.pagehelper.PageInfo;
import com.project.school.models.*;

public interface StudentService {

	PageInfo<Student> searchAll(Integer pageNum);

	PageInfo<Student> search(Student student, Integer pageNum);

	Company obtainEmployment(Integer stateId);

    JoinArmy joinArmy(Integer stateId);

    CivilServant civilServant(Integer stateId);

    Postgraduate postgraduate(Integer stateId);

    Entrepreneurship entrepreneurship(Integer stateId);
}

	
