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

    public static void main(String[] args) throws Exception {
        Signature signature = new Signature();

        PrivateKey privateKey1 = signature.convertBase64ToPrivateKey("MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCqCUbRq21UNaB+24mYoxw+Hu6p/4kCWAAA1QEm0dUKW2PzQl5eTdTBESj5tRRnm91ffM/IZvou/WqJ1LC+9x2yn7BkdNheyToHdzacjtdUAmgmuWTGgexZkOshpF+JoQD08+d1Su6XJsVbAEe3svjoCymrpVRXdoTeI7GIqhaEUvFiPKKm4d/R2EbSDg3RsxGzLlVeRoI4+0ieGCKZiulknwmb4h54Raay/h0cXA3Ah2dJBgwqErNcqBR8jcnITVqH5bmPZ3hNPlNNY6RVkji/RaljKH1c8dlL6hdHpHuP/Im0f3QT3rdg2RIkr6GuV4AAr45gs+LCshiZ7fu6h8cjAgMBAAECgf84dNwOwdyLGUMw27PT+lRmS97ykuXq4U0e+ZpoSUNzLOUC4AZ1SWJauFfikT01KYtXKRnUcFyhPYMiQHxu653wsRTgReuRjT63O93mHYdhXWs3cFcFkh3nnzZy9SDDkbG/ozw2taqChV0B2hX16Ha8lPhBBaP7Zl63YyKPPeo8BMNFlIrc767h12JhN1OzUVB0ywJCHjiFbi+w/5wRGTx0CBNJFoJXYkL21w7296GXXHNrxLD9IOZCoxejxhKtPDffQktMlRMPTwFKGFGPAOgh2SMlouEuhNuVgGF19JwJFHAssitszvzqK2lNDGwDJS/YFjjz8IYPZw7WK+FlJ9ECgYEAwyps4O2O73ETUSYXwrVg08aiU1KoO3cX4dpt0dvVm4Zf5L0NW+xqXNpYNnp4wf3wZn035W081MrsqN268zyAkwfXNHc0H4RqRy+J6Cp25MoeH9DEvALuAGowr99rh8qONkSuRvsRXz8tRUA31VwQJN6IOp1NtyfVNkRy/R9v7CkCgYEA3wmaGr3n4d2vEx+c0uQrC2e0xafZEaHPMzKLSoVdDPWI2J8XoyLEY+dmlecUs31XoRNtb8BjwkrYedhzU68DTrTUy7IsMrWaoOdWZd7XquPSZXHxOl7WjUcK0/HARR21LoeB1WQpdxUmTPstVq3vajlsZbbdNKQeyYT6V0ChwmsCgYEAvHcgs0jUqebhB5Eois9KlNeRc7MzYFFOT7z2Jh0LNufZfHMQDn/L6qSzYNB+Ap+t4drz+mq1vqvDRALzAOahJtsAd9rRC8p8Mwf2PaucKq3/zyt0gDa4DNB++adgGL6C/GbwgPz8tqS0m9Y61J/VuzTmCuxS2xbtLz2EaWlNVJkCgYEAse87HjJ7F9p/ncYOmsClBohJ05ZAuqxYXQPp1B3pSjloX0ks1l0aSImHcffUsA1DJ6IUIJ9f9tU3Np3UA+MPxG7HhWozkJEJN2zXpJXPgOoYJA5u4J5glH0kykmHlpxIu0In9lHeMr6Qu8F3PjutURVWwR7OAv0cArEv9wP9CNkCgYBSE34LMVbVTO0Yb7T8NanY7xaJD3o3JC6S0dtR3hZ+frhbEtu0lZiv/l3Qv6jG6bMIl8EaHtGF9zd4hfwyxqIwWH+fcj3mxMFB7cPVErX98NGXgKlednBUjFJ3iuGC8pScy1zZKxop7DMm1Jf2VgZMmy5tTGkfsXgiLl6nzHq3Kg==");
        System.out.println(Base64.getEncoder().encodeToString(privateKey1.getEncoded()));
        signature.privateKey=privateKey1;
        System.out.println(signature.encryptBase64("abc"));
    }
}
