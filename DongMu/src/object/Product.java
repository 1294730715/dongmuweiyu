package object;

public class Product {
	private String name;//商品名称
	private String calss;//商品分类  0为门，1为浴室用品
	private Double buyprice;//进价
	private Double sellprice;//卖价
	private String location;//放置地点.打算为一张带标记的图片
	private String picture;//产品图片
	private Double number;//库存
	private Double minnumber;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCalss() {
		return calss;
	}
	public void setCalss(String calss) {
		this.calss = calss;
	}
	public Double getBuyprice() {
		return buyprice;
	}
	public void setBuyprice(Double buyprice) {
		this.buyprice = buyprice;
	}
	public Double getSellprice() {
		return sellprice;
	}
	public void setSellprice(Double sellprice) {
		this.sellprice = sellprice;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public Double getNumber() {
		return number;
	}
	public void setNumber(Double number) {
		this.number = number;
	}
	public Double getMinnumber() {
		return minnumber;
	}
	public void setMinnumber(Double minnumber) {
		this.minnumber = minnumber;
	}


	
}
