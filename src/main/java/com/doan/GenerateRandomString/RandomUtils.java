package com.doan.GenerateRandomString;

import java.util.Random;

public class RandomUtils {
	
    private static final String dCase = "abcdefghijklmnopqrstuvwxyz";
    private static final String uCase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    private static final String intChar = "0123456789";
    private static Random r = new Random();
    private static StringBuilder pass = new StringBuilder();

    public static String GenerateString() {
    	while (pass.length () != 16){
            int rPick = r.nextInt(4);
            if (rPick == 0){
                int spot = r.nextInt(26);
                pass.append(dCase.charAt(spot));
            } else if (rPick == 1) {
                int spot = r.nextInt(26);
                pass.append(uCase.charAt(spot));
            } else {
                int spot = r.nextInt(10);
                pass.append(intChar.charAt(spot));
            }
        }
    	return pass.toString();
    }
}