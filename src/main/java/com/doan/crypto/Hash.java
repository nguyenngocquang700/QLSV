package com.doan.crypto;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Hash {
	
	public static String convertByteToHex(byte[] data, int length){
        BigInteger number = new BigInteger(1, data);
        String hashtext = number.toString(16);
        while (hashtext.length()<length){
            hashtext = "0" + hashtext;
        }
        return hashtext;
    }
	
    //Tạo mã băm SHA1
    public static byte[] convertSHA1(String text) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-1");
            md.update(text.getBytes("UTF-8"));
            byte[] hashData = md.digest();
            return hashData;
        } catch (NoSuchAlgorithmException | UnsupportedEncodingException ex) {
            Logger.getLogger(Hash.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    
    public static byte[] convertSHA1(byte[] text) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-1");
            md.update(text);
            byte[] hashData = md.digest();
            return hashData;
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(Hash.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
}
