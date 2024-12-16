package vn.edu.hcmuaf.fit.model;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Hash {
    public String hash(String input) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("MD5");
        byte[] bytes = input.getBytes();
        byte[] digest = md.digest(bytes);
        BigInteger re = new BigInteger(1, digest);
        return re.toString(16);
    }
}
