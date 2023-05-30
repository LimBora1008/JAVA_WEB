package com.javalab.vo;

import java.sql.Date;

public class Member {
	
	private String id;
	private String pw;
	private String name;
	private Date age;
	
	private String birthyy;		// 생일 - 년
	private String birthmm;		// 생일 - 월
	private String birthdd;		// 생일 - 일
	
public Member() {
	
}

public Member(String id, String pw, String name, Date age) {
	this.id = id;
	this.pw = pw;
	this.name = name;
	this.age = age;
}
public Member(String id, String pw) {
	this.id = id;
	this.pw = pw;
}

public Member(String id, String pw, String name, String birthyy, String birthmm, String birthdd) {
	this.id = id;
	this.pw = pw;
	this.name = name;
	this.birthyy = birthyy;
	this.birthmm = birthmm;
	this.birthdd = birthdd;
}

public Member(String id, String name, Date age) {
	this.id = id;
	this.name = name;
	this.age = age;
}

public String getId() {
	return id;
}

public void setId(String id) {
	this.id = id;
}

public String getPw() {
	return pw;
}

public void setPw(String pw) {
	this.pw = pw;
}

public String getName() {
	return name;
}

public void setName(String name) {
	this.name = name;
}

public Date getAge() {
	return age;
}

public void setAge(Date age) {
	this.age = age;
}

@Override
public String toString() {
	return "MemberVo [id=" + id + ", pw=" + pw + ", name=" + name + ", age=" + age + "]";
}

public String getBirthyy() {
	return birthyy;
}

public void setBirthyy(String birthyy) {
	this.birthyy = birthyy;
}

public String getBirthmm() {
	return birthmm;
}

public void setBirthmm(String birthmm) {
	this.birthmm = birthmm;
}

public String getBirthdd() {
	return birthdd;
}

public void setBirthdd(String birthdd) {
	this.birthdd = birthdd;
}



}
