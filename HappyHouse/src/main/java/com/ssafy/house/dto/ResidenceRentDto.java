package com.ssafy.house.dto;

public class ResidenceRentDto {

	private int no;
	private String city;
	private String gugun;
	private String dong;
	private String bunji;
	private String bonbun;
	private String bubun;
	private String buildingName;
	private String type;
	private double area;
	private String contractYear;
	private String contractMonth;
	private String contractDay;
	private int bondFee;
	private int rentMoney;
	private int floor;
	private int buildYear;
	private String address;
	
	public ResidenceRentDto() {
		super();
	}

	public ResidenceRentDto(int no, String city, String gugun, String dong, String bunji, String bonbun, String bubun,
			String buildingName, String type, double area, String contractYear, String contractMonth,
			String contractDay, int bondFee, int rentMoney, int floor, int buildYear, String address) {
		super();
		this.no = no;
		this.city = city;
		this.gugun = gugun;
		this.dong = dong;
		this.bunji = bunji;
		this.bonbun = bonbun;
		this.bubun = bubun;
		this.buildingName = buildingName;
		this.type = type;
		this.area = area;
		this.contractYear = contractYear;
		this.contractMonth = contractMonth;
		this.contractDay = contractDay;
		this.bondFee = bondFee;
		this.rentMoney = rentMoney;
		this.floor = floor;
		this.buildYear = buildYear;
		this.address = address;
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

	public String getBunji() {
		return bunji;
	}

	public void setBunji(String bunji) {
		this.bunji = bunji;
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public double getArea() {
		return area;
	}

	public void setArea(double area) {
		this.area = area;
	}

	public String getContractYear() {
		return contractYear;
	}

	public void setContractYear(String contractYear) {
		this.contractYear = contractYear;
	}

	public String getContractMonth() {
		return contractMonth;
	}

	public void setContractMonth(String contractMonth) {
		this.contractMonth = contractMonth;
	}

	public String getContractDay() {
		return contractDay;
	}

	public void setContractDay(String contractDay) {
		this.contractDay = contractDay;
	}

	public int getBondFee() {
		return bondFee;
	}

	public void setBondFee(int bondFee) {
		this.bondFee = bondFee;
	}

	public int getRentMoney() {
		return rentMoney;
	}

	public void setRentMoney(int rentMoney) {
		this.rentMoney = rentMoney;
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "ResidenceRentDto [no=" + no + ", city=" + city + ", gugun=" + gugun + ", dong=" + dong + ", bunji="
				+ bunji + ", bonbun=" + bonbun + ", bubun=" + bubun + ", buildingName=" + buildingName + ", type="
				+ type + ", area=" + area + ", contractYear=" + contractYear + ", contractMonth=" + contractMonth
				+ ", contractDay=" + contractDay + ", bondFee=" + bondFee + ", rentMoney=" + rentMoney + ", floor="
				+ floor + ", buildYear=" + buildYear + ", address=" + address + "]";
	}
	
	
}
