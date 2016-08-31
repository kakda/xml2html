package com.mcnc.xml2html.form;

import java.io.Serializable;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.mcnc.xml2html.validate.AllowFileType;
import com.mcnc.xml2html.validate.ValidXml;

public class MultiUpload implements Serializable{
	

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 
	 */

	@NotBlank (message = "Project No is not allow empty value") 
	private String projectNo;
	
	@AllowFileType (message = "Please upload a correct xml file", extension = {"xml"})
	@ValidXml
	private CommonsMultipartFile fileXml;
	
	@AllowFileType (message = "Please upload a correct zip file", extension = {"zip"})
	private CommonsMultipartFile fileImage;
	
	
	public String getProjectNo() {
		return projectNo;
	}
	
	public void setProjectNo(String projectNo) {
		this.projectNo = projectNo;
	}
	
	public CommonsMultipartFile getFileXml() {
		return fileXml;
	}
	
	public void setFileXml(CommonsMultipartFile fileXml) {
		this.fileXml = fileXml;
	}
	
	public CommonsMultipartFile getFileImage() {
		return fileImage;
	}
	
	public void setFileImage(CommonsMultipartFile fileImage) {
		this.fileImage = fileImage;
	}
	
	
}
