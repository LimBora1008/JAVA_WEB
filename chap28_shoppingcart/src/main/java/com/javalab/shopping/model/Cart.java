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
public class Cart extends Product {

	private String userId;
	private String productId;
	private int quantity;
	private int unitPrice;
	private Date createDate;
	
	// 사용 편의를 위한 변수(DB에는 없지만 조회할 때 필요)
	private String createDateFrom;
	private String createDateTO;
	
	public Cart(String userId, String productId, int quantity, int unitPrice) {
		super();
		this.userId = userId;
		this.productId = productId;
		this.quantity = quantity;
		this.unitPrice = unitPrice;
	}

	public Cart(String userId, String productId, String productName, int quantity, int unitPrice) {
		super();
		this.userId = userId;
		this.productId = productId;
		super.setProductName(productName);
		this.quantity = quantity;
		this.unitPrice = unitPrice;
	}

	
	
	
}
