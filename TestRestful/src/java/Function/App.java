/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Function;

/**
 *
 * @author Admin
 */
 
import com.twilio.Twilio; 
import com.twilio.rest.api.v2010.account.Message; 
import com.twilio.rest.api.v2010.account.MessageCreator; 
import com.twilio.type.PhoneNumber; 
 
import java.math.BigDecimal; 
import java.net.URI; 
import java.util.ArrayList; 
import java.util.List; 
 
public class App { 
    private final static String ACCOUNT_SID = "AC216ef9c173a73f16d7f85b0bddb2eca9"; 
    private final static String AUTH_TOKEN = "066a2187357c1bb4168c2ba56c502405"; 
 
    public  void sendSMS(String mess, String number) { 
//        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);          
//        MessageCreator messageCreator = Message.creator( 
//            "AC216ef9c173a73f16d7f85b0bddb2eca9", 
//            new PhoneNumber("+84"+number), new PhoneNumber("+12676680539"),mess
//        ); 
//    
//         
//        Message message = messageCreator.create(); 
//        System.out.println(message.getSid()); 
//System.out.println(mess+number);
    } 
    
}