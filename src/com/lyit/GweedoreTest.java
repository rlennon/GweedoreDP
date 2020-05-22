package com.lyit;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.PrintStream;

import javax.servlet.ServletException;

import org.junit.Test;

import main.java.com.lyit.Gweedore;

public class GweedoreTest {

	/**
	 * Sample test method for Gweedore doPost
	 * @throws IOException 
	 * @throws ServletException 
	 */
	@Test
	public void testGweedore() throws ServletException, IOException {
		final ByteArrayOutputStream outContent = new
				ByteArrayOutputStream();
				System.setOut(new PrintStream(outContent)); //make the output go to a stream instead of the console
				new Gweedore().doPost(null, null); //call main in the App file
				//check if the output is "You are posting to GweedoreDP" and a new line
				assertEquals("You are posting to GweedoreDP" + System.getProperty("line.separator"),
				outContent.toString());
	}

	private void assertEquals(String string, String string2) {
		// TODO Auto-generated method stub
		
	}

}
