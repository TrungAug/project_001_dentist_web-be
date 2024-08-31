package com.DuAn.dentistApp.service.service;

import com.DuAn.dentistApp.entities.TimeOfShift;
import com.DuAn.dentistApp.model.request.TimeOfShiftRequest;
import com.DuAn.dentistApp.model.response.MessageResponse;

import java.time.LocalTime;
import java.util.Date;
import java.util.List;

public interface TimeOfShiftService {

    TimeOfShift findByTimeOfShiftId(int timeOfShift);

    List<TimeOfShift> findAllTimeOfShift();

    List<TimeOfShift> findAllTimeOfShiftByShift(int ShiftId);

    List<Object> findAllTimeOfShiftAvailable(int shiftId, Date date, int doctorId);
    List<Object> getAvailableShiftsByMonth(int doctorId, int month, int year);
    List<TimeOfShift> findAllTimeOfShiftExceptDeleted();

    TimeOfShift saveTimeOfShift(TimeOfShiftRequest timeOfShiftRequest);

    TimeOfShift updateTimeOfShift(int timeOfShiftId, TimeOfShiftRequest timeOfShiftRequest);

    MessageResponse delete(int timeOfShiftId);

    MessageResponse softDeleteTimeOfShift(int timeOfShiftId);

    List<Object> findAllTimeOfShiftDetails(int shiftId, Date date, int doctorId);

    List<TimeOfShift> findTimeOfShiftByRangeTime(LocalTime startStr, LocalTime endStr);
}
