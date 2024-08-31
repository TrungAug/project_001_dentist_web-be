package com.DuAn.dentistApp.service.service;

import com.DuAn.dentistApp.entities.DoctorUnavailability;
import com.DuAn.dentistApp.model.request.DoctorUnavailabilityRequest;
import com.DuAn.dentistApp.model.response.MessageResponse;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface DoctorUnavailabilityService {

    DoctorUnavailability findDoctorUnavailabilityById(int doctorUnavailabilityId);

    List<DoctorUnavailability> findAllDoctorUnavailability();

    List<DoctorUnavailability> findAllDoctorUnavailabilityByDoctor(int doctorId);

    List<Object> findShiftOfDoctorFromDoctorUnavailability(Date date, int doctorId);

    List<DoctorUnavailability> findDoctorUnavailabilityByAppId(Integer appointmentId);

    List<DoctorUnavailability> findAllDoctorUnavailabilityExceptDeleted();

    DoctorUnavailability saveDoctorUnavailability(DoctorUnavailabilityRequest doctorUnavailabilityRequest);

    DoctorUnavailability updateDoctorUnavailability(int doctorUnavailabilityId, DoctorUnavailabilityRequest doctorUnavailabilityRequest);

    MessageResponse delete(int abnormalityId);

    MessageResponse softDeleteDoctorUnavailability(int doctorUnavailabilityId);

    List<Object> findDistinctDateOfDuByTimeRange(Date startDate,Date endDate,Integer doctorId);

    List<DoctorUnavailability> findDoctorUnavailabilityByDate(Date date);
    public Map<Date, List<DoctorUnavailability>> findDUByTimeRangeAndDateMap(Date startDate, Date endDate,Integer doctorId);
}
