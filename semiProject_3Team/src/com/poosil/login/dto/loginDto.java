package com.poosil.login.dto;

public class loginDto {
	
	private String userid;
	private String password;
	private String useremail;
	private int userphone;
	private String address ;
	private String addresslatitude;
	private String addresslongitude;
	private String userrole;
	private String isseller;
	private String sellersOpt;
	private String avatar;
	private String usernickname;
	private String username;
	
	
	public loginDto() {
		
		
	}


	public loginDto(String userid, String password, String useremail, int userphone, String address,
			String addresslatitude, String addresslongitude, String userrole, String isseller, String sellersOpt,
			String avatar, String usernickname, String username) {
		super();
		this.userid = userid;
		this.password = password;
		this.useremail = useremail;
		this.userphone = userphone;
		this.address = address;
		this.addresslatitude = addresslatitude;
		this.addresslongitude = addresslongitude;
		this.userrole = userrole;
		this.isseller = isseller;
		this.sellersOpt = sellersOpt;
		this.avatar = avatar;
		this.usernickname = usernickname;
		this.username = username;
	}


	public String getUserid() {
		return userid;
	}


	public void setUserid(String userid) {
		this.userid = userid;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getUseremail() {
		return useremail;
	}


	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}


	public int getUserphone() {
		return userphone;
	}


	public void setUserphone(int userphone) {
		this.userphone = userphone;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getAddresslatitude() {
		return addresslatitude;
	}


	public void setAddresslatitude(String addresslatitude) {
		this.addresslatitude = addresslatitude;
	}


	public String getAddresslongitude() {
		return addresslongitude;
	}


	public void setAddresslongitude(String addresslongitude) {
		this.addresslongitude = addresslongitude;
	}


	public String getUserrole() {
		return userrole;
	}


	public void setUserrole(String userrole) {
		this.userrole = userrole;
	}


	public String getIsseller() {
		return isseller;
	}


	public void setIsseller(String isseller) {
		this.isseller = isseller;
	}


	public String getSellersOpt() {
		return sellersOpt;
	}


	public void setSellersOpt(String sellersOpt) {
		this.sellersOpt = sellersOpt;
	}


	public String getAvatar() {
		return avatar;
	}


	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}


	public String getUsernickname() {
		return usernickname;
	}


	public void setUsernickname(String usernickname) {
		this.usernickname = usernickname;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}

	

}