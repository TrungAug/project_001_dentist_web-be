package com.DuAn.dentistApp.controller;


import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/auth")
@CrossOrigin(origins = "*")
@Validated
public class PDFExportController {

/*    private final PDFGeneratorService pdfGeneratorService;

    public PDFExportController(PDFGeneratorService pdfGeneratorService) {
        this.pdfGeneratorService = pdfGeneratorService;
    }*/
  /*  @GetMapping("/pdf/generate")
    @Operation(summary = "PDF")*/
//    public void generatePDF() throws IOException {
//        PDFGeneratorService exporter = new PDFGeneratorService();
//        try {
//            exporter.export("files", "invoice.pdf",Invoic);
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
    //}
}