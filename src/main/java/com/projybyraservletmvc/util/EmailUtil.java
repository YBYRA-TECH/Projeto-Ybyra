package com.projybyraservletmvc.util;

import jakarta.mail.*;
import jakarta.mail.internet.*;
import java.util.Properties;

public class EmailUtil {

    // Configurações do email
    private static final String SMTP_HOST = "smtp.gmail.com";
    private static final String SMTP_PORT = "587";
    private static final String EMAIL_FROM = "ybyratech@gmail.com";
    private static final String EMAIL_PASSWORD = System.getenv("EMAIL_PASSWORD");
    private static final String EMAIL_TO = "ybyratech@gmail.com";

    public static boolean enviarEmailParceria(String nome, String email, String telefone, String tipoIndustria) {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", SMTP_HOST);
        props.put("mail.smtp.port", SMTP_PORT);
        props.put("mail.smtp.ssl.protocols", "TLSv1.2");

        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(EMAIL_FROM, EMAIL_PASSWORD);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(EMAIL_FROM));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(EMAIL_TO));
            message.setSubject("Nova solicitação de parceria - Ybyra Tech");

            String conteudoHtml = String.format(
                    "<html><body>" +
                            "<h2>Nova Solicitação de Parceria</h2>" +
                            "<p><strong>Nome:</strong> %s</p>" +
                            "<p><strong>Email:</strong> %s</p>" +
                            "<p><strong>Telefone:</strong> %s</p>" +
                            "<p><strong>Tipo de Indústria:</strong> %s</p>" +
                            "<br><p>Mensagem enviada através do site Ybyra Tech</p>" +
                            "</body></html>",
                    nome, email, telefone, tipoIndustria
            );

            message.setContent(conteudoHtml, "text/html; charset=utf-8");

            Transport.send(message); //Esse transporte envia o email
            return true;

        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
    }
}