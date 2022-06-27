package com.sp.dev.member;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.dev.common.MyUtil;

@Service("mail.myMailSender")
public class MailSender {
	@Autowired
	private MyUtil myUtil;
	
	private String mailType; // 메일 타입
	private String encType;

	public MailSender() {
		this.encType = "utf-8";
		this.mailType = "text/html; charset=utf-8";
	}

	public void setMailType(String mailType, String encType) {
		this.mailType = mailType;
		this.encType = encType;
	}

	
	// 네이버를 이용하여 메일을 보내는 경우 보내는사람의 이메일이 아래 계정(SMTP 권한 계정)과 다르면 메일 전송이 안된다.
	// SMTP 권한
	private class SMTPAuthenticator extends javax.mail.Authenticator {
		@Override
		public PasswordAuthentication getPasswordAuthentication() {
			// 네이버 : 메일 아래부분 환경설정 클릭후 POP3등을 허용
			String username = ""; 	// 네이버 사용자;
			String password = ""; 				// 패스워드;
			return new PasswordAuthentication(username, password);
		}
	}

	// 메시지 생성
	private void makeMessage(Message msg, Mail dto) throws MessagingException {
		msg.setText(dto.getContent());
		msg.setHeader("Content-Type", mailType);
	}
	

	// 메일 보내기
	public boolean mailSend(Mail dto) {
		boolean b = false;

		Properties p = new Properties();

		// SMTP 서버의 계정 설정
		// Naver와 연결할 경우 네이버 아이디
		p.put("mail.smtp.user", "limchae157@naver.com");

		// SMTP 서버 정보 설정
		String host = "smtp.naver.com"; // 네이버
		
		p.put("mail.smtp.host", host);

		// 네이버와 지메일 동일
		p.put("mail.smtp.port", "465");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");

		p.put("mail.smtp.ssl.enable", "true");
		p.put("mail.smtp.ssl.trust", host);
		
		try {
			Authenticator auth = new SMTPAuthenticator();
			Session session = Session.getDefaultInstance(p, auth);
			// 메일 전송시 상세 정보 콘솔에 출력 여부
			session.setDebug(true);

			Message msg = new MimeMessage(session);

			// 보내는 사람
			msg.setFrom(new InternetAddress("limchae157@naver.com", "관리자", encType));
			
			// 받는 사람
			msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(dto.getReceiverEmail()));

			// 제목
			msg.setSubject(dto.getSubject());

			if (mailType.indexOf("text/html") == -1) {
				dto.setContent(myUtil.htmlSymbols(dto.getContent()));
			}

			makeMessage(msg, dto);
			msg.setHeader("X-Mailer", "관리자");

			// 메일 보낸 날짜
			msg.setSentDate(new Date());

			// 메일 전송
			Transport.send(msg);

			b = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return b;
	}
}
