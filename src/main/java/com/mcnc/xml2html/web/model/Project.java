package com.mcnc.xml2html.web.model;

public class Project {

	private String projectNo;
	private String xmlFile;

	public String getXmlFile() {
		return xmlFile;
	}

	public void setXmlFile(String xmlFile) {
		this.xmlFile = xmlFile;
	}

	public Project(String projectNo) {
		this.projectNo = projectNo;
	}
	
	public String getProjectNo() {
		return projectNo;
	}

	public void setProjectNo(String projectNo) {
		this.projectNo = projectNo;
	}
	
	
}
