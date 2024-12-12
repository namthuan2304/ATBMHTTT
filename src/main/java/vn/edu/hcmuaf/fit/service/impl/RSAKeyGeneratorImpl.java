package vn.edu.hcmuaf.fit.service.impl;

import vn.edu.hcmuaf.fit.service.IKeyGenerator;

import javax.crypto.KeyGenerator;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.util.Base64;

public class RSAKeyGeneratorImpl implements IKeyGenerator {

    @Override
    public KeyPair generateKeyPair() throws Exception {
        // Khởi tạo đối tượng KeyPairGenerator cho RSA
        KeyPairGenerator keyPairGenerator = KeyPairGenerator.getInstance("RSA");
        keyPairGenerator.initialize(2048);  // Đặt độ dài khóa là 2048 bit
        return keyPairGenerator.generateKeyPair();  // Phát sinh cặp khóa
    }

    @Override
    public String encodePrivateKey(PrivateKey privateKey) {
        // Mã hóa private key thành chuỗi base64
        return Base64.getEncoder().encodeToString(privateKey.getEncoded());
    }

    @Override
    public String encodePublicKey(PublicKey publicKey) {
        // Mã hóa public key thành chuỗi base64
        return Base64.getEncoder().encodeToString(publicKey.getEncoded());
    }
}
