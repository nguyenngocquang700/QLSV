package com.doan.recaptcha;

import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;

import javax.net.ssl.HttpsURLConnection;
public class VerifyUtils {
	public static final String SITE_VERIFY_URL = "https://www.google.com/recaptcha/api/siteverify";
	
	public static boolean verify(String gRecaptchaResponse) {
		if(gRecaptchaResponse == null || gRecaptchaResponse.length() == 0) {
			return false;
		}
		try {
			URL verifyUrl = new URL(SITE_VERIFY_URL);
			
			HttpsURLConnection conn = (HttpsURLConnection) verifyUrl.openConnection();
			
			conn.setRequestMethod("POST");
			conn.setRequestProperty("User-Agent", "Mozilla/5.0");
			conn.setRequestProperty("Accept-Language", "en-US,en;q=0.5");
			
			String postParams = "secret=" + MyConstants.SECRET_KEY + "&response=" + gRecaptchaResponse;
			
			conn.setDoOutput(true);
			
			OutputStream outputStream = conn.getOutputStream();
			outputStream.write(postParams.getBytes());
			
			outputStream.flush();
			outputStream.close();
			
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode=" + responseCode);
			
			InputStream is = conn.getInputStream();
			JsonReader jsonReader = Json.createReader(is);
			JsonObject jsonObject = jsonReader.readObject();
			jsonReader.close();
			
			System.out.println("Response: " + jsonObject);
			
			boolean success = jsonObject.getBoolean("success");
			return success;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
	}
}
