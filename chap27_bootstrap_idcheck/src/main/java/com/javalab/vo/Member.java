package com.javalab.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Member {

	// 멤버변수
	private String id;
	private String pwd;
	private String name;
	private String email;
	private String joindate;

	// [추가]
	public Member(String id) {
		super();
		this.id = id;
	}
}
