package com.DuAn.dentistApp.service.service;

import com.DuAn.dentistApp.entities.Shift;
import com.DuAn.dentistApp.model.request.ShiftRequest;
import com.DuAn.dentistApp.model.response.MessageResponse;

import java.util.List;

public interface ShiftService {
    Shift findByShiftId(int shift);

    List<Shift> findAllShift();

    List<Shift> findAllShiftExceptDeleted();

    Shift saveShift(ShiftRequest shiftRequest);

    Shift updateShift(int shiftId, ShiftRequest shiftRequest);

    MessageResponse delete(int ShiftId);

    MessageResponse softDeleteShift(int ShiftId);
}
