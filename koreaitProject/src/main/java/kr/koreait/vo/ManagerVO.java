package kr.koreait.vo;

public class ManagerVO {
	private String id;
	private String password;
	private String name;
	private int phone;
	private int userNumber;
	private String ip;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPhone() {
		return phone;
	}
	public void setPhone(int phone) {
		this.phone = phone;
	}
	public int getUserNumber() {
		return userNumber;
	}
	public void setUserNumber(int userNumber) {
		this.userNumber = userNumber;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	@Override
	public String toString() {
		return "ManagerVO [id=" + id + ", password=" + password + ", name=" + name + ", phone=" + phone
				+ ", userNumber=" + userNumber + ", ip=" + ip + "]";
	}
	

}
