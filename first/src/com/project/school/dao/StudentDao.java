package com.project.school.dao;

import java.util.List;

import com.project.school.models.*;

public interface StudentDao {

	List<Student> searchAll();

	List<Student> search(Student student);

	Company obtainEmployment(Integer stateId);

    JoinArmy joinArmy(Integer stateId);

    CivilServant civilServant(Integer stateId);

    Postgraduate postgraduate(Integer stateId);

    Entrepreneurship entrepreneurship(Integer stateId);
}
