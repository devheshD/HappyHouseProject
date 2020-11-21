package com.ssafy.house.dto;

public class ClinicHospitalDto {
	private String update_date;
	private String city;
	private String gugun;
	private String hospital_name;
	private String address;
	private String type;
	private String phone_number;
	
	public String getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(String update_date) {
		this.update_date = update_date;
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
	public String getHospital_name() {
		return hospital_name;
	}
	public void setHospital_name(String hospital_name) {
		this.hospital_name = hospital_name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getPhone_number() {
		return phone_number;
	}
	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}
	@Override
	public String toString() {
		return "CoronaHospitalDto [update_date=" + update_date + ", city=" + city + ", gugun=" + gugun
				+ ", hospital_name=" + hospital_name + ", address=" + address + ", type=" + type + ", phone_number="
				+ phone_number + "]";
	}
}
