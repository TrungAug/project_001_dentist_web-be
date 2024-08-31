package com.DuAn.dentistApp.service.impl.utils;


import com.DuAn.dentistApp.config.AppUtils;
import com.DuAn.dentistApp.model.request.Data;
import com.DuAn.dentistApp.service.service.utils.QrCodeService;
import org.springframework.stereotype.Service;


@Service
public class QrCodeServiceImpl implements QrCodeService {

    private String qrCodeDirectory;
    private static final int ORDER_QR_CODE_SIZE_WIDTH = 300;
    private static final int ORDER_QR_CODE_SIZE_HEIGHT = 300;

    @Override
    public String generateQrCode(Data sdi) {
        String prettyData = AppUtils.prettyObject(sdi);

        String qrCode = AppUtils.generateQrCode(prettyData, ORDER_QR_CODE_SIZE_WIDTH, ORDER_QR_CODE_SIZE_HEIGHT);
        return qrCode;
    }
}
