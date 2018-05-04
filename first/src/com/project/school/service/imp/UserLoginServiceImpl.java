package com.project.school.service.imp;

import org.springframework.beans.factory.annotation.Autowired;

import com.project.school.dao.UserLoginDao;
import com.project.school.service.UserLoginService;
import com.project.school.models.School;
public class UserLoginServiceImpl implements UserLoginService {

	@Autowired
	private UserLoginDao userLoginDao;
	@Override
	public School searchUser(String username) {
		School school =  userLoginDao.searchUser(username);
		return school;
	}

}
