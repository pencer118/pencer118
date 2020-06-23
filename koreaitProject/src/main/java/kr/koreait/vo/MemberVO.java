package kr.koreait.vo;

public class MemberVO {
	int idx;
	String memberPhoto;
	String con;
	String name;
	String date;
	int age;
	String volume;
	String depart;
	
	
	
	
	
	public String getMemberPhoto() {
		return memberPhoto;
	}
	public void setMemberPhoto(String memberPhoto) {
		this.memberPhoto = memberPhoto;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getCon() {
		return con;
	}
	public void setCon(String con) {
		this.con = con;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}

	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getDepart() {
		return depart;
	}
	public void setDepart(String depart) {
		this.depart = depart;
	}
	public String getVolume() {
		return volume;
	}
	public void setVolume(String volume) {
		this.volume = volume;
	}
	@Override
	public String toString() {
		return "MemberVO [idx=" + idx + ", memberPhoto=" + memberPhoto + ", con=" + con + ", name=" + name + ", date="
				+ date + ", age=" + age + ", volume=" + volume + ", depart=" + depart + "]";
	}
	

	



}
