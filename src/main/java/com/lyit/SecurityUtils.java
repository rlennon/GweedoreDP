package com.lyit;

import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;

public class SecurityUtils {

    public String encryptString(String strToEncrypt)  {

    	StandardPBEStringEncryptor encryptor = new StandardPBEStringEncryptor();
    	encryptor.setPassword("password");
    	encryptor.setAlgorithm("PBEWithMD5AndTripleDES");

    	String encryptedText = encryptor.encrypt(strToEncrypt);

        return encryptedText;
    }

    public String decryptString(String strToDecrypt)  {

    	StandardPBEStringEncryptor encryptor = new StandardPBEStringEncryptor();
    	encryptor.setPassword("password");
    	encryptor.setAlgorithm("PBEWithMD5AndTripleDES");
    	
    	String decryptedText = encryptor.decrypt(strToDecrypt);

        return decryptedText;
    }
}
