package uniandes.cupi2.impuestosCarro.aspectos;

import java.util.Properties;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Mail {
	
	public Mail(){
		final String username = "shdomotics@gmail.com";
		final String password = "uniandes123";
 
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
 
		Session session = Session.getInstance(props,
		  new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		  });
 
		try {
 
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("shdomotics@gmail.com"));
			message.setRecipients(Message.RecipientType.TO,
				InternetAddress.parse("nobmann88@gmail.com"));
			message.setSubject("Impuesto mayor a 2.000.000");
			message.setText("El impuesto es mayor a 2.000.000");
 
			Transport.send(message);
 
			System.out.println("Done");
 
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}
		

//	public static void main(String[] args) {
//		Mail m = new Mail();
//	}

}
