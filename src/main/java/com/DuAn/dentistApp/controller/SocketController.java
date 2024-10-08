package com.DuAn.dentistApp.controller;

import com.DuAn.dentistApp.model.request.MessageSendRequest;
import com.DuAn.dentistApp.service.service.AppointmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class SocketController {
    @Autowired
    AppointmentService appointmentService;
    @Autowired
    private SimpMessagingTemplate simpMessagingTemplate;
    @MessageMapping("/private-message")
    public MessageSendRequest recMessage(@Payload MessageSendRequest message){
        simpMessagingTemplate.convertAndSendToUser(message.getGetterMail(),"/private",message.getBody());
        return message;
    }

    @MessageMapping("/user/chatroom")
    public String getRealtimeBooking(String id) {
        try {
            int appointmentId = Integer.parseInt(id);

            var appointment = appointmentService.findByAppointmentId(appointmentId);
            simpMessagingTemplate.convertAndSend("/chatroom", appointment);
        } catch (NumberFormatException e) {
            simpMessagingTemplate.convertAndSend("/chatroom", id);
        }
        return id;
    }

}
