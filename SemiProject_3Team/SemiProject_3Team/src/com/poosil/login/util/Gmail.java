package com.poosil.login.util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator {
	
	protected  PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("semi03poosil@gmail.com", "1q2w3e4r!@");
		
	}
	
	
	

}
