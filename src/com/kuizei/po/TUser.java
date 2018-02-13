package com.kuizei.po;

import java.util.Objects;

public class TUser {
    private String uid;
    private String uname;
    private String gender;
    private Integer workingAge;
    private String role;
    private String photo;
    private String pwd;
    private String dept;

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Integer getWorkingAge() {
        return workingAge;
    }

    public void setWorkingAge(Integer workingAge) {
        this.workingAge = workingAge;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getDept() {
        return dept;
    }

    public void setDept(String dept) {
        this.dept = dept;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        TUser tUser = (TUser) o;
        return Objects.equals(uid, tUser.uid) &&
                Objects.equals(uname, tUser.uname) &&
                Objects.equals(gender, tUser.gender) &&
                Objects.equals(workingAge, tUser.workingAge) &&
                Objects.equals(role, tUser.role) &&
                Objects.equals(photo, tUser.photo) &&
                Objects.equals(pwd, tUser.pwd) &&
                Objects.equals(dept, tUser.dept);
    }

    @Override
    public int hashCode() {

        return Objects.hash(uid, uname, gender, workingAge, role, photo, pwd, dept);
    }
}
