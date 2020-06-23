package test.java.com.lyit;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotSame;

import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;
import org.junit.Test;
public class SecurityUtlisTest {
	   @Test	
	   public void testSecurityUtils() {
			StandardPBEStringEncryptor encryptor = new StandardPBEStringEncryptor();
			String privateData = "sjn496gpDh0jM5N4r6Ib";
			encryptor.setPassword("password");
			encryptor.setAlgorithm("PBEWithMD5AndTripleDES");
			
			String encryptedText = encryptor.encrypt(privateData);
			assertNotSame(privateData, encryptedText);
			 
			String plainText = encryptor.decrypt(encryptedText);
			assertEquals(plainText, privateData);
		}

}
