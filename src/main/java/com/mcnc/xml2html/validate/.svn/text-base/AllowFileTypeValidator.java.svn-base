package com.mcnc.xml2html.validate;

import java.util.Arrays;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class AllowFileTypeValidator implements ConstraintValidator<AllowFileType, CommonsMultipartFile> {

	private String[] extension;

	public void initialize(AllowFileType constraintAnnotation) {
		extension = constraintAnnotation.extension();
	}

	public boolean isValid(CommonsMultipartFile commonsMultipartFile, ConstraintValidatorContext context) {
		boolean isValidated = true;
		try {
			String fileName = commonsMultipartFile.getOriginalFilename();
			String fileExt = fileName.substring(fileName.lastIndexOf(".")+1, fileName.length());

			if(Arrays.asList(extension).contains(fileExt)){
				return isValidated;
			}
			
		} catch (final Exception e) {
			System.out.println(e.toString());
		}
		return false;
	}
}
