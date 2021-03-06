package com.minajiale.database;
import java.util.List;
import object.order;

public interface OrderDAO {
	public void addOrder(order oneorder);
	public void updateOrder(order oneorder);
	public void deleteOrder(int orderId);
	public List<order> findAllOrder(); //定义查询产品的方法
	public order findOrderById(int orderId);// 定义按照ID查询产品的方法
}
