package vn.edu.hcmuaf.fit.model;

import java.nio.charset.Charset;
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
        String sign = "sjAkLKpD5/vR62Axui11m4iykpl1t/dWymQyuj8Xi+faF7kMNgeRncHVIskhXjFuYigr7I0GgujiTmKAbDuPTaMD7wbcSa6zAtU1b6MMgL9PpaxmOOZzie/hk465o79vusF16nPrZI1OEupYKrO2ZOdT0wyU4hpIhsp1iYONZZiCRcSJrmCYvbAyOYGrmwYpq7h0IXQfAW341V1q2eBMVhBY67C8jDj9q2z2XWXpg1afy2XleOT2+5nOUEDXxiIm5kVAEYd31aONjukciyWLR6J4Yww1QrsCvLAFKyOvwZZ6aEPCegLpj/Sp9SHhXYnR5W096Oqv8XOfv5HlB08upWbET0LPBKyDLHQlXGY8Vb3rop5xanF4LvfOuZ3YTgha5par+g88jlxqu8QLbva2KP6e/yaRPyW9IPWRqzPymngBDqb11masORpAkEAmlNTo890MsUuQsAG4l3RBo5h6Ol3giGruMmtwnPHy7aJm5DeueeAy1o/2CkSik3fg+0ZbBPAx8yiAEB3tRFH7xFFCEo2ytOyJv0nwCt1Fj4jlpKrR5QNQKjxwYYRFAYm8rQEI0fLMIJI8S/ysACoZs6zAKODQMqow1Um0eTygy/ohRqqe31fjZNikWyZ9VC+oeXCm0opa1n6N06NZA6OuN2WX9oebx3aVxDabtztltgVxvp4=";
        VerifySign verifySign = new VerifySign();
        PublicKey publicKey = verifySign.convertBase64ToPublicKey("MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA2+xDVKdU1RVt8DI2lmSbeRvqM62xB2i9yjq/7fkr8ORJ1nNjF7OWIyqFK9s6raM942wQnms5VKfjHiztr1uGZqAvxzm1PU4wAmf/zVEbn4ZGzwg41aV/98iWwlZ2vlTJ3M32o49zlXmxVnsWXZ7H1MYHdzDusjSFsvFfLs7xCQbmsm2Ylmit5i8FuGEwkB9sZ3C+zRyUtgk/l8BgUjcTohQsEzZe3X5jmRXMZrWJDOOFMAdqYWa/XdX2Imo7M3JsMY+T/kQr/1vDw95E/ZuOztCPZVUYfu01vKH0HkKw+w1+wOBsRoEY/ZKqb/PCHwKAtHJIXjiaa+ohbfJJK4zCEGWRAFng68Ftqx0mCTpPnw1DHqFFiPs1BPKNNB40BKElPvYND0vgsJNuxBz+yEToDLby8vuUdj2uRxQVa5E/sLMe6Ac5wW7MjUJwSpwJpa9GlVUo2gT+3xY0R89VL52cSd7YUMmYHGhD9Fm4Q+a4oIgrFxcv5ZwHFqvJY14UtPvpNaiLvsWBxxMCiQCREQa7QYfhqXc4dLtAgajjyX5k0o8mFIWUBW5w5Pe9SZrzG+l3cgF3V5RBi+AgYCHtsk6UaoTQq/VXNSVEmz1HFRfMiZo4HMyS29e493pIygQW+xwr5AFXFpILHHd/ZuhJr1TtBQmqBPtb9tYTAIrDmCZ8/QUCAwEAAQ==");
        String hash="d13bfe7c87915851c0a998415fd77ba7";
        System.out.println(verifySign.verify(sign,publicKey,hash));
//        System.out.println("Key length: " + publicKey);
    }
}
