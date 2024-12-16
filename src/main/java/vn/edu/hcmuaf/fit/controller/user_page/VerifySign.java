package vn.edu.hcmuaf.fit.controller.user_page;

import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.security.*;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.util.Base64;
import java.security.Signature;
import javax.crypto.Cipher;

public class VerifySign {
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

    public PublicKey convertBase64ToPublicKey(String base64PublicKey) throws Exception {
        // Giải mã Base64 thành mảng byte
        byte[] keyBytes = Base64.getDecoder().decode(base64PublicKey);

        // Tạo đối tượng PKCS8EncodedKeySpec từ mảng byte
        X509EncodedKeySpec keySpec = new X509EncodedKeySpec(keyBytes);

        // Sử dụng KeyFactory để chuyển đổi thành đối tượng PrivateKey
        KeyFactory keyFactory = KeyFactory.getInstance("RSA"); // Hoặc "EC", "DSA" tùy thuộc vào thuật toán của khóa
        return keyFactory.generatePublic(keySpec);
    }

    public String encryptBase64(String data) throws Exception {
        return Base64.getEncoder().encodeToString(encrypt(data));

    }
    private String signData(String data, PrivateKey privateKey) throws Exception {
        Signature signature = Signature.getInstance("SHA256withRSA");
        signature.initSign(privateKey);
        signature.update(data.getBytes());
        return Base64.getEncoder().encodeToString(signature.sign());
    }

    public boolean verify(String base64Signature, PublicKey publicKey, String data) throws Exception {
        Signature signature = Signature.getInstance("SHA256withRSA");
        signature.initVerify(publicKey);
        signature.update(data.getBytes());
        byte[] signBytes = Base64.getDecoder().decode(base64Signature);
        return signature.verify(signBytes);
    }

    public static void main(String[] args) throws Exception {
        String sign = "H7/vcxrTCQhXvT6H3k2ofAn3komIOHEPOJ6qt38i+CYesTtL3nZmzNwbiEZ8jYM5U3q+t8u9q8gKJ9rcrEIqNsUIC7RpoTO+e7OCbG41KjWbXSKtHK8ShiZ9yKyJfS1y07SzZfKvnsIwgzgL5+CdL7M/lJEj2OOstp+lVuBXdPBV9vfFaDTDssI+ZgR9ZVudSTbjd+QSrR0sjGodSVx6NoW3s93yNXa56297jLDAxv/NhgUAU6Dd2/SXEA8JhauglxKL4/xBASP7zTfewBDG1KBmhBi0SkehAlSoJoM59SetTdewbtItD8xL9GvpZ9Vgax5QqtYfdfyl6CpNffk0RQ==";
        VerifySign verifySign = new VerifySign();
        PublicKey publicKey = verifySign.convertBase64ToPublicKey("MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAqglG0attVDWgftuJmKMcPh7uqf+JAlgAANUBJtHVCltj80JeXk3UwREo+bUUZ5vdX3zPyGb6Lv1qidSwvvcdsp+wZHTYXsk6B3c2nI7XVAJoJrlkxoHsWZDrIaRfiaEA9PPndUrulybFWwBHt7L46Aspq6VUV3aE3iOxiKoWhFLxYjyipuHf0dhG0g4N0bMRsy5VXkaCOPtInhgimYrpZJ8Jm+IeeEWmsv4dHFwNwIdnSQYMKhKzXKgUfI3JyE1ah+W5j2d4TT5TTWOkVZI4v0WpYyh9XPHZS+oXR6R7j/yJtH90E963YNkSJK+hrleAAK+OYLPiwrIYme37uofHIwIDAQAB");
        String hash="901304f3b806cd342252c0a5c14f2fc";
        System.out.println(verifySign.verify(sign,publicKey,hash));
    }
}
