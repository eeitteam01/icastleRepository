package com.icastle.orderfollowers.model;

public interface OrderFollowersDAO_interface {
	
//	新增訂單同行人
	public void insert(OrderFollowersVO orderFollowersVO);
	
//	搜尋出訂單同行人
	public void select_By_OrderId(Integer orderId);

}
