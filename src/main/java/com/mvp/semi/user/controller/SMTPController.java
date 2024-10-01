package com.mvp.semi.user.controller;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.*;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mvp.semi.user.model.vo.User;

/**
 * Servlet implementation class SMTPMailSendTest
 */
@WebServlet("/smtpTest.do")
public class SMTPController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SMTPController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession serSession = request.getSession();
		User u = (User)serSession.getAttribute("userId");
		String reSetPassword = (String)serSession.getAttribute("reSetPwd");
		String userEmail = u.getEmail();
		
		System.out.println("SMTP 수신 데이터 : "+ reSetPassword + " | " + userEmail);
		
//		String host = "smtp.naver.com";
//		 
//		final String username = "semi_mvp";		//나의 메일계정 입력, @gmail.com 은 작성하지않는다.
//		final String password = "mvpmvp123!";		//나의 메일계정 비밀번호 입력
//		int port = 465;										//포트 번호
// 
//		String recipient = userEmail;			//받는사람 메일주소
//		String subject = "메일테스트";								//받는사람 메일제목
//		String body = username+ "님으로 부터 메일을 받았습니다.";	//받는사람 메일내용
// 
//		Properties props = System.getProperties();		//정보를담기위한 객체생성
// 
//		//smtp 서버 정보 설정
//		props.put("mail.smtp.host", host);
//		props.put("mail.smtp.port", port);
//		props.put("mail.smtp.auth", "true");
//		props.put("mail.smtp.ssl.enable", "true");
//		props.put("mail.smtp.ssl.trust", host);
// 
//		//session 생성
//		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
//			String un=username;
//			String pw=password;
//			protected javax.mail.PasswordAuthentication getPasswordAuthentication(){
//				return new javax.mail.PasswordAuthentication(un, pw);
//			}
//		});
//		session.setDebug(true);
// 
//		Message mimeMessage = new MimeMessage(session);	//MimeMessage 생성
//		//발신자 셋팅 , 보내는 사람의 이메일주소를 한번 더 입력. 이때는 이메일 풀 주소를 다 작성
//		try {
//			mimeMessage.setFrom(new InternetAddress("yechan9981@naver.com"));
//			//수신자셋팅 //.TO 외에 .CC(참조) .BCC(숨은참조) 도 있음
//			mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
//
//			mimeMessage.setSubject(subject);			//제목세팅
//			mimeMessage.setText(body);				//내용세팅
//			Transport.send(mimeMessage);				//javax.mail.Transport.send() 이용
//		} catch (AddressException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (MessagingException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
		
		// activation-1.1.jar , mail-1.4.7.jar 라이브러리 필요
		
		
		// Property 객체에 SMTP 서버 정보 설정
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.naver.com");
		props.put("mail.smtp.port", "465"); // SMTP 포트
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", "smtp.naver.com");
		props.put("mail.smtp.ssl.protocols", "TLSv1.2");

		// SMTP 서버 정보와 사용자 정보를 기반으로 Session 클래스의 인스턴스를 생성
		Session session = Session.getDefaultInstance(props, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("semi_mvp", "mvpmvp123!");
			}
		});
//
		// Message 객체에 수신자와 내용, 제목의 메시지를 작성
		try {

			Message message = new MimeMessage(session);

			// 발신자 설정
			message.setFrom(new InternetAddress("semi_mvp@naver.com"));

			// 수신자 메일주소 설정
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(userEmail));

			// 메일 제목 설정
			message.setSubject("MVP 사이트");
			// 메일 내용 설정
			message.setText("변경된 비밀번호는 [ 테스트 ] 입니다.");

			// Send the message
			Transport.send(message);

			System.out.println(" NaverMailSend : Email sent successfully.");
		} catch (MessagingException e) {
			System.out.println("안됨~~~~");
			e.printStackTrace();
		}

		System.out.println(" NaverMailSend : sendEmail() 종료");

		response.getWriter().print("aaaa");
		
		request.getRequestDispatcher("/views/account/findPwdSuc.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
