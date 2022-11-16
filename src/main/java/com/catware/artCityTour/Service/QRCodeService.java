package com.catware.artCityTour.Service;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;
import org.springframework.stereotype.Service;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Map;

@Service
public class QRCodeService {
    private String charset = "UTF-8";
    private Map<EncodeHintType, ErrorCorrectionLevel> map = new HashMap<EncodeHintType, ErrorCorrectionLevel>();
    private Integer height = 200;
    private Integer weight = 200;

    public void generateQRCode(String data, String path) throws WriterException, IOException {
        this.map.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.L);

        BitMatrix matrix = new MultiFormatWriter().encode(new String(data.getBytes(charset), charset), BarcodeFormat.QR_CODE, this.weight, this.height);
        MatrixToImageWriter.writeToStream(matrix, path.substring(path.lastIndexOf('.') + 1), Files.newOutputStream(Paths.get(path)));
    }
}
