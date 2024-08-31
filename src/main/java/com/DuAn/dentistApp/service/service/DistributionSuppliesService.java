package com.DuAn.dentistApp.service.service;

import com.DuAn.dentistApp.entities.DistributionSupplies;
import com.DuAn.dentistApp.model.request.DistributionSuppliesRequest;
import com.DuAn.dentistApp.model.response.MessageResponse;

import java.util.List;

public interface DistributionSuppliesService {
    DistributionSupplies findByDistributionSuppliesId(int distributionSuppliesId);

    List<DistributionSupplies> findAllDistributionSupplies();

    List<DistributionSupplies> findAllDistributionSuppliesExceptDeleted();

    DistributionSupplies saveDistributionSupplies(DistributionSuppliesRequest distributionSuppliesRequest);

    DistributionSupplies updateDistributionSupplies(int distributionSuppliesId, DistributionSuppliesRequest distributionSuppliesRequest);

    MessageResponse delete(int distributionSuppliesId);

    MessageResponse softDeleteDistributionSupplies(int distributionSuppliesId);
}
