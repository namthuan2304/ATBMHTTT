package vn.edu.hcmuaf.fit.service;

import java.security.KeyPair;

public interface IKeyGenerator {
    /**
     * Phát sinh cặp khóa RSA (private và public).
     * @return KeyPair cặp khóa gồm private và public key
     * @throws Exception Nếu có lỗi trong quá trình phát sinh khóa
     */
    KeyPair generateKeyPair() throws Exception;

    /**
     * Mã hóa private key thành chuỗi base64.
     * @param privateKey Khóa riêng (private key)
     * @return Chuỗi base64 của private key
     */
    String encodePrivateKey(java.security.PrivateKey privateKey);

    /**
     * Mã hóa public key thành chuỗi base64.
     * @param publicKey Khóa công khai (public key)
     * @return Chuỗi base64 của public key
     */
    String encodePublicKey(java.security.PublicKey publicKey);
}
