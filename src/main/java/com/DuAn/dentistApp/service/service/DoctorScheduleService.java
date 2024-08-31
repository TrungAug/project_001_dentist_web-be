package com.DuAn.dentistApp.service.service;

import com.DuAn.dentistApp.entities.AppointmentStatus;
import com.DuAn.dentistApp.entities.DoctorSchedule;
import com.DuAn.dentistApp.model.request.DoctorScheduleRequest;
import com.DuAn.dentistApp.model.response.MessageResponse;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface DoctorScheduleService {
    DoctorSchedule findByDoctorScheduleId(int doctorScheduleId);

    List<DoctorSchedule> findAllDoctorScheduleByDoctor(int doctorId);
    List<DoctorSchedule> findAllDoctorScheduleByDate(Date date);

    List<Object> findDoctorFromDoctorSchedule();

    List<Object> findShiftOfDoctorFromDoctorSchedule(Date date,int doctorId);

    List<Object> findDoctorScheduleByTimeRange(Date startDate, Date endDate);

    List<DoctorSchedule> findAllDoctorSchedule();

    List<DoctorSchedule> findAllDoctorScheduleExceptDeleted();

    DoctorSchedule saveDoctorSchedule(DoctorScheduleRequest doctorscheduleRequest);

    DoctorSchedule updateDoctorSchedule(int DoctorScheduleId, DoctorScheduleRequest doctorScheduleRequest);

    MessageResponse delete(int doctorScheduleId);

    MessageResponse softDeleteDoctorSchedule(int doctorScheduleId);

    Map<String,List<AppointmentStatus>> findDSWithAppointmentStatus(Date date);

    List<Object> findDsAndTos();

    List<DoctorSchedule> findDSByTimeRange(Date startDate, Date endDate);

    Map<Integer,List<DoctorSchedule>> findDoctorSchedulesMap(Date startStr, Date endStr);

    List<DoctorSchedule> findDSByTimeRangeAndDoctor(Date startDate, Date endDate, Integer doctorId);

    List<Object> findDateDoctorScheduleInTimeRange(Date startDate, Date endDate);

    Map<Date,List<DoctorSchedule>> findDSByTimeRangeAndDateMap(Date startDate, Date endDate);
}
