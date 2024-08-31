package com.DuAn.dentistApp.service.service;

import com.DuAn.dentistApp.entities.Bill;
import com.DuAn.dentistApp.model.request.BillRequest;
import com.DuAn.dentistApp.model.response.MessageResponse;
import com.DuAn.dentistApp.model.response.TransactionResponse;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface BillService {

    Bill findByBillId(int bilId);

    List<Bill> findAllBill();

    List<Bill> findAllBillExceptDeleted();

    Bill saveBill(BillRequest billRequest);

    Bill updateBill(int billId, BillRequest billRequest);

    MessageResponse deleteBillId(int billId);

    MessageResponse softDeleteBillId(int billId);

    List<Bill> findByAppointmentAndPatient(Integer appointmentId, Integer patientId);

    Double getRevenue(Date date,Integer month,Integer year);

    Map<String,Object> getRevenueAndDate(String monthParam,Integer month,Integer year);

    Object[] getRevenueAndDateAsArray(String monthParam,Integer month,Integer year);

    List<Object[]> findTop5Service(Integer day,Integer month,Integer year);

    TransactionResponse getTransactionSuccess(String accountNumber, String transactionDateMin, int limit);

}
