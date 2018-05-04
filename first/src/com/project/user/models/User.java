package com.project.user.models;

import lombok.Data;

@Data
public class User {
    private Integer id;
    private String username;
    private String password;
    private String studentId;
}
