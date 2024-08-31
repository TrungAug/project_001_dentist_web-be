package com.DuAn.dentistApp.service.service;

import com.DuAn.dentistApp.entities.MedicineCategory;
import com.DuAn.dentistApp.model.request.MedicineCategoryRequest;
import com.DuAn.dentistApp.model.response.MessageResponse;

import java.util.List;

public interface MedicinesCategoryService {
    MedicineCategory findByMedicineCategoryId(int categoryId) ;

    List<MedicineCategory> findAllMedicineCategories() ;

    List<MedicineCategory> findAllMedicineCategoriesExceptDeleted() ;

    MedicineCategory saveMedicineCategory(MedicineCategoryRequest categoryRequest) ;

    MedicineCategory updateMedicineCategory(int categoryId, MedicineCategoryRequest categoryRequest) ;

    MessageResponse deleteMedicineCategory(int categoryId) ;

    MessageResponse softDeleteMedicineCategory(int categoryId) ;
}
