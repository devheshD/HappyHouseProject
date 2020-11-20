package com.ssafy.house.dto;

public class ResidenceBuyDto {
	
	private int no;
	private String city;
	private String gugun;
	private String dong;
	private String bungi;
	private String bonbun;
	private String bubun;
	private String buildingName;
	private double area;
	private double daejiarea;
	private String dealYear;
	private String dealMonth;
	private String dealDay;
	private String dealAmount;
	private int floor;
	private int buildYear;
	private String roadname;
		
	public ResidenceBuyDto() {
		super();
	}

	public ResidenceBuyDto(int no, String city, String gugun, String dong, String bungi, String bonbun, String bubun,
			String buildingName, double area, double daejiarea, String dealYear, String dealMonth, String dealDay,
			String dealAmount, int floor, int buildYear, String roadname) {
		super();
		this.no = no;
		this.city = city;
		this.gugun = gugun;
		this.dong = dong;
		this.bungi = bungi;
		this.bonbun = bonbun;
		this.bubun = bubun;
		this.buildingName = buildingName;
		this.area = area;
		this.daejiarea = daejiarea;
		this.dealYear = dealYear;
		this.dealMonth = dealMonth;
		this.dealDay = dealDay;
		this.dealAmount = dealAmount;
		this.floor = floor;
		this.buildYear = buildYear;
		this.roadname = roadname;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getGugun() {
		return gugun;
	}

	public void setGugun(String gugun) {
		this.gugun = gugun;
	}

	public String getDong() {
		return dong;
	}

	public void setDong(String dong) {
		this.dong = dong;
	}

	public String getBungi() {
		return bungi;
	}

	public void setBungi(String bungi) {
		this.bungi = bungi;
	}

	public String getBonbun() {
		return bonbun;
	}

	public void setBonbun(String bonbun) {
		this.bonbun = bonbun;
	}

	public String getBubun() {
		return bubun;
	}

	public void setBubun(String bubun) {
		this.bubun = bubun;
	}

	public String getBuildingName() {
		return buildingName;
	}

	public void setBuildingName(String buildingName) {
		this.buildingName = buildingName;
	}

	public double getArea() {
		return area;
	}

	public void setArea(double area) {
		this.area = area;
	}

	public double getDaejiarea() {
		return daejiarea;
	}

	public void setDaejiarea(double daejiarea) {
		this.daejiarea = daejiarea;
	}

	public String getDealYear() {
		return dealYear;
	}

	public void setDealYear(String dealYear) {
		this.dealYear = dealYear;
	}

	public String getDealMonth() {
		return dealMonth;
	}

	public void setDealMonth(String dealMonth) {
		this.dealMonth = dealMonth;
	}

	public String getDealDay() {
		return dealDay;
	}

	public void setDealDay(String dealDay) {
		this.dealDay = dealDay;
	}

	public String getDealAmount() {
		return dealAmount;
	}

	public void setDealAmount(String dealAmount) {
		this.dealAmount = dealAmount;
	}

	public int getFloor() {
		return floor;
	}

	public void setFloor(int floor) {
		this.floor = floor;
	}

	public int getBuildYear() {
		return buildYear;
	}

	public void setBuildYear(int buildYear) {
		this.buildYear = buildYear;
	}

	public String getRoadname() {
		return roadname;
	}

	public void setRoadname(String roadname) {
		this.roadname = roadname;
	}

	@Override
	public String toString() {
		return "ResidenceBuyDto [no=" + no + ", city=" + city + ", gugun=" + gugun + ", dong=" + dong + ", bungi="
				+ bungi + ", bonbun=" + bonbun + ", bubun=" + bubun + ", buildingName=" + buildingName + ", area="
				+ area + ", daejiarea=" + daejiarea + ", dealYear=" + dealYear + ", dealMonth=" + dealMonth
				+ ", dealDay=" + dealDay + ", dealAmount=" + dealAmount + ", floor=" + floor + ", buildYear="
				+ buildYear + ", roadname=" + roadname + "]";
	}

	
}
