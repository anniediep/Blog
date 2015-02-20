package guestbook2;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

import com.google.appengine.api.users.User;
import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;

@Entity
public class Greeting implements Comparable<Greeting> {
    @Id Long id;
    User user;
    String content;
    Date date;
    String title;
    private Greeting() {}
    public Greeting(User user, String content, String title) {
        this.user = user;
        this.content = content;
        this.title = title;
        date = new Date();
    }
    public User getUser() {
        return user;
    }
    public String getContent() {
        return content;
    }
    public String getTitle() {
    	return title;
    }
    
    /*
    SimpleDateFormat f = new SimpleDateFormat("yyyy-MMM-dd HH:mm:ss");
	f.setTimeZone(TimeZone.getTimeZone("UTC"));
	System.out.println(f.format(new Date()));
    */
    
    public Date getDate(){
    	SimpleDateFormat f = new SimpleDateFormat("MMM-dd-yyyy HH:mm:ss");
    	f.setTimeZone(TimeZone.getTimeZone("US/Central"));
    	
    	return date;
    }
    
    @Override
    public int compareTo(Greeting other) {
        if (date.after(other.date)) {
            return -1;
        } else if (date.before(other.date)) {
            return 1;
        }
        return 0;
    }
}