package com.javalab.shopping.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Product {

	private String productId;
	private String productName;
	private String caregoryId;
	private int unitPrice;
	private String image;
	private Date createDate;
	
	// 사용 편의를 위한 변수
	private String categoryName;
	private String categoryDateFrom;
	private String categoryDateTo;
	
}
