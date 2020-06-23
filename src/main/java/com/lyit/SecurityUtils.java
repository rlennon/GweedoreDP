package com.lyit;

import org.jasypt.util.text.BasicTextEncryptor;

public class SecurityUtils {

    public String encryptString()  {

        BasicTextEncryptor textEncryptor = new BasicTextEncryptor();
        textEncryptor.setPassword("random");

        String myEncryptedText = textEncryptor.encrypt("sjn496gpDh0jM5N4r6Ib");

        return myEncryptedText;
    }

    public String decryptString()  {

        BasicTextEncryptor textEncryptor = new BasicTextEncryptor();
        textEncryptor.setPassword("random");

        String decryptedText = textEncryptor.decrypt("sjn496gpDh0jM5N4r6Ib");

        return decryptedText;
    }
}
