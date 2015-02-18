package guestbook2;

import java.io.IOException;
import java.util.List;
import java.util.Properties;
import java.util.logging.Logger;

import javax.mail.Address;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.googlecode.objectify.ObjectifyService;
import com.googlecode.objectify.cmd.Query;

import static com.googlecode.objectify.ObjectifyService.ofy;


@SuppressWarnings("serial")
public class CronServlet extends HttpServlet {
private static final Logger _logger = Logger.getLogger(CronServlet.class.getName());
public void doGet(HttpServletRequest req, HttpServletResponse resp)
throws IOException {

	Properties props = new Properties();
	Session session = Session.getDefaultInstance(props, null);
	
try {
_logger.info("Cron has been executed");

//get list of emails
ObjectifyService.register(Email.class);
Query<Email> query = ofy().load().type(Email.class);
List<Email> emailList = query.list();

//get blog posts
ObjectifyService.register(Greeting.class);
List<Greeting> greetings = ObjectifyService.ofy().load().type(Greeting.class).list();   

//if(!emailList.isEmpty()){
//	System.out.println("Tester");
//}
//for(Email email : emailList){
//	System.out.println(email.getEmail());
//}
String strCallResult = "";

//Body of the email

for(Greeting body: greetings){
strCallResult += "Testing" + "\r\n";
strCallResult += body.getTitle() + "\r\n"; 
strCallResult += body.getContent() + "\r\n"; 
strCallResult += "==============================================" + "\r\n";
strCallResult += "Thank you for subscribing to our daily blog updates" + "\r\n";
}

/*
ExamResult ER = ExamResultDAO.INSTANCE.getExamResult(studentID);
strCallResult = "Student ID Number : " + ER.getIdNumber().getName() + "\r\n";
strCallResult += "Student Name : " + ER.getName() + "\r\n";
strCallResult += "Exam 1 Grade : " + ER.getExam1() + "\r\n";
strCallResult += "Exam 2 Grade : " + ER.getExam2() + "\r\n";
strCallResult += "=================================" + "\r\n";
strCallResult += "Thank you for using the Exam Helper Bot" + "\r\n";
*/
	
//Send out Email

for(Email email: emailList){
MimeMessage outMessage = new MimeMessage(session);
outMessage.setFrom(new InternetAddress("admin@blogpostblogging.appspotmail.com"));
outMessage.addRecipient(MimeMessage.RecipientType.TO, new InternetAddress(email.getEmail()));
outMessage.setSubject("Daily Blog Updates");
outMessage.setText(strCallResult);
Transport.send(outMessage);
}


//testing
//MimeMessage outMessage = new MimeMessage(session);
//outMessage.setFrom(new InternetAddress("admin@blogpostblogging.appspotmail.com"));
//outMessage.addRecipient(MimeMessage.RecipientType.TO, new InternetAddress(emailList.get(0).getEmail()));
//outMessage.setSubject("Daily Blog Updates");
//outMessage.setText("testingggg");
//Transport.send(outMessage);


}
catch (Exception ex) {
	_logger.info("ERROR: Could not send out Email Results response : " + ex.getMessage());
}

}

@Override
public void doPost(HttpServletRequest req, HttpServletResponse resp)
throws ServletException, IOException {
doGet(req, resp);
}

}