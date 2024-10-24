package study2.database;
//8.VO생성 (원래순서 : 데이터 생성후 vo먼저 생성)
public class DbTestVO {
	//데이터 테이블 필드의 갯수/이름/타입이 같아야 함
	private int idx; 
	private String name;
	private int age;
	private String gender;
	private String address;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	@Override
	public String toString() {
		return "DbTestVO [address=" + address + ", age=" + age + ", gender=" + gender + ", idx=" + idx + ", name=" + name
				+ "]";
	}
}
