package com.minajiale.database;
import java.util.List;
import object.order;

public interface OrderDAO {
	public void addOrder(order oneorder);
	public void updateOrder(order oneorder);
	public void deleteOrder(int orderId);
	public List<order> findAllOrder(); //�����ѯ��Ʒ�ķ���
	public order findOrderById(int orderId);// ���尴��ID��ѯ��Ʒ�ķ���
}