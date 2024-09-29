		package controller;

		import java.io.IOException;
		import java.util.Properties;

		import javax.mail.Authenticator;
		import javax.mail.Message;
		import javax.mail.MessagingException;
		import javax.mail.PasswordAuthentication;
		import javax.mail.Session;
		import javax.mail.Transport;
		import javax.mail.internet.InternetAddress;
		import javax.mail.internet.MimeMessage;
		import javax.servlet.ServletException;
		import javax.servlet.annotation.WebServlet;
		import javax.servlet.http.HttpServlet;
		import javax.servlet.http.HttpServletRequest;
		import javax.servlet.http.HttpServletResponse;

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
		    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
		    */

		   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		      
		      // activation-1.1.jar , mail-1.4.7.jar 라이브러리 필요
			   String userEmail = request.getParameter("email");

		      // Property 객체에 SMTP 서버 정보 설정 
		      Properties props = new Properties();
		      props.put("mail.smtp.host", "smtp.naver.com");
		      props.put("mail.smtp.port", "465");      // SMTP 포트 
		      props.put("mail.smtp.auth", "true");
		      props.put("mail.smtp.ssl.enable", "true");
		      props.put("mail.smtp.ssl.trust", "smtp.naver.com");
		      props.put("mail.smtp.ssl.protocols", "TLSv1.2");

		      // SMTP 서버 정보와 사용자 정보를 기반으로 Session 클래스의 인스턴스를 생성
		       Session session = Session.getDefaultInstance(props, new Authenticator() {
		           protected PasswordAuthentication getPasswordAuthentication() {
		               return new PasswordAuthentication("allofyaeji@naver.com", "mvpmvp123");
		           }
		       });

		      // Message 객체에 수신자와 내용, 제목의 메시지를 작성 
		       try {

		           Message message = new MimeMessage(session);
		             
		           // 발신자 설정
		           message.setFrom(new InternetAddress("발신자계정@naver.com"));

		           // 수신자 메일주소 설정
		           message.addRecipient(Message.RecipientType.TO, new InternetAddress("회원가입페이지에서 사용자가 입력한 이메일"));

		           // 메일 제목 설정
		           message.setSubject("제목");
		           // 메일 내용 설정
		           message.setText("인증번호는 [ aaaa ] 입니다.");

		           // Send the message
		           Transport.send(message);

		           System.out.println(" NaverMailSend : Email sent successfully.");
		       } catch (MessagingException e) {
		           e.printStackTrace();
		       } 
		         
		       System.out.println(" NaverMailSend : sendEmail() 종료");
		       
		       response.getWriter().print("aaaa");
		    
		   }

		   /**
		    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
		    */
		   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		      // TODO Auto-generated method stub
		      doGet(request, response);
		   }

		}



