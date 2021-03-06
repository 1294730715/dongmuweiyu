package com.minajiale.database;
import java.util.List;
import object.Product;

public interface ProductsDAO {
	public void addProducts(Product commodity);
	public void updateProducts(Product commodity);
	public void deleteProducts(int commodityId);
	public List<Product> findAllCommodity(); //定义查询产品的方法
	public Product findCommdityById(int commodityId);// 定义按照ID查询产品的方法
}
