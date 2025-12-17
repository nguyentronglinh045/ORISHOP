package vn.orishop.utils;

import java.util.Properties;
import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

public class EmailUtils {
    // Thay đổi thông tin của bạn ở đây
    private static final String HOST_NAME = "smtp.gmail.com";
    private static final int SSL_PORT = 465;
    private static final String APP_EMAIL = "ngocvosr4@gmail.com"; // Email của bạn
    private static final String APP_PASSWORD = "rksi dfbz mbdz huor"; // Mật khẩu ứng dụng Gmail

    public static void send(String to, String subject, String body) throws Exception {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.host", HOST_NAME);
        props.put("mail.smtp.socketFactory.port", SSL_PORT);
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.port", SSL_PORT);

        Session session = Session.getDefaultInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(APP_EMAIL, APP_PASSWORD);
            }
        });

        MimeMessage message = new MimeMessage(session);
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
        message.setSubject(subject, "UTF-8");
        message.setContent(body, "text/html; charset=UTF-8");

        Transport.send(message);
    }
}