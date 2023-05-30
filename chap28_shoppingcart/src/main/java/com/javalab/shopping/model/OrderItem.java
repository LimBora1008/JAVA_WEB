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
public class OrderItem {

	private int orderItemId;
	private int orderId;
	private String productId;
	private String productName;
	private int quantity;
	private int unitPrice;
	private int amt;
	private Date createDate;
	

	
}
