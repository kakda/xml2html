package com.mcnc.xml2html.validate;

import java.io.ByteArrayInputStream;
import java.io.IOException;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.xml.sax.SAXException;

public class ValidXmlValidator implements ConstraintValidator<ValidXml, CommonsMultipartFile> {


	public void initialize(ValidXml constraintAnnotation) {		
	}

	public boolean isValid(CommonsMultipartFile commonsMultipartFile, ConstraintValidatorContext context) {
		try {
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			dBuilder.parse(new ByteArrayInputStream(commonsMultipartFile.getBytes()));
			return true;
		} catch (SAXException e) {
			System.out.println(e.getMessage().toString());
		} catch (IOException e) {
			System.out.println(e.getMessage().toString());
		} catch (ParserConfigurationException e) {
			System.out.println(e.getMessage().toString());
		}
		return false;
	}
}
