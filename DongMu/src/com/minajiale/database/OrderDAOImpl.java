package com.minajiale.database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import object.order;

public class OrderDAOImpl implements OrderDAO {

	public void addOrder(order oneorder) {
		Connection conn = DBConnection.getConnection();
		String addSQL ="insert into productsorder(time,customer,totalamount,payway,debt,progress,products,owner) values(?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt = null;
		try{
			
			pstmt = conn.prepareStatement(addSQL);
			pstmt.setString(1,oneorder.getTime());
			pstmt.setString(2,oneorder.getCustomer());
			pstmt.setDouble(3, oneorder.getTotalamount());
			pstmt.setString(4, oneorder.getPayway());
			pstmt.setDouble(5, oneorder.getDebt());
			pstmt.setString(6,oneorder.getProgress());
			pstmt.setString(7,oneorder.getProducts());
			pstmt.setString(8,oneorder.getOwner());
			pstmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DBConnection.close(pstmt);
			DBConnection.close(conn);
		}

	}

	public void updateOrder(order oneorder) {
		// TODO Auto-generated method stub

	}

	public void deleteOrder(int orderId) {
		// TODO Auto-generated method stub

	}

	public List<order> findAllOrder() {
		// TODO Auto-generated method stub
		return null;
	}

	public order findOrderById(int orderId) {
		// TODO Auto-generated method stub
		return null;
	}

}
