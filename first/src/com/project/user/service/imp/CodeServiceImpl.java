package com.project.user.service.imp;

import com.project.user.service.CodeService;
import org.springframework.beans.factory.annotation.Autowired;
import com.project.user.dao.CodeDao;


public class CodeServiceImpl implements CodeService {

    @Autowired
    private CodeDao codeDao;
}
