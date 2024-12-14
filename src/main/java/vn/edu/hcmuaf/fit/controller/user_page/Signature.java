package vn.edu.hcmuaf.fit.controller.user_page;

import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.security.*;
import java.security.spec.PKCS8EncodedKeySpec;
import java.util.Base64;

import javax.crypto.Cipher;

public class Signature {
    PrivateKey privateKey;
    PublicKey publicKey;


    public byte[] encrypt(String data) throws Exception {
        Cipher cipher = Cipher.getInstance("RSA");
        byte in[] = data.getBytes(Charset.defaultCharset());
        cipher.init(Cipher.ENCRYPT_MODE, privateKey);
        byte[] out = cipher.doFinal(in);
        return out;
    }

    public PrivateKey convertBase64ToPrivateKey(String base64PrivateKey) throws Exception {
        // Giải mã Base64 thành mảng byte
        byte[] keyBytes = Base64.getDecoder().decode(base64PrivateKey);

        // Tạo đối tượng PKCS8EncodedKeySpec từ mảng byte
        PKCS8EncodedKeySpec keySpec = new PKCS8EncodedKeySpec(keyBytes);

        // Sử dụng KeyFactory để chuyển đổi thành đối tượng PrivateKey
        KeyFactory keyFactory = KeyFactory.getInstance("RSA"); // Hoặc "EC", "DSA" tùy thuộc vào thuật toán của khóa
        return keyFactory.generatePrivate(keySpec);
    }

    public String encryptBase64(String data) throws Exception {
        return Base64.getEncoder().encodeToString(encrypt(data));

    }

    public String decrypt(String base64) throws Exception {
        Cipher cipher = Cipher.getInstance("RSA");
        byte[] in = Base64.getDecoder().decode(base64);
        cipher.init(Cipher.DECRYPT_MODE, publicKey);
        byte[] out = cipher.doFinal(in);
        return new String(out, StandardCharsets.UTF_8);
    }
}
