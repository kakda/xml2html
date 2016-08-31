package com.mcnc.xml2html.service;

import java.io.IOException;
import java.util.List;

import org.springframework.core.io.FileSystemResource;

import com.mcnc.xml2html.form.MultiUpload;
import com.mcnc.xml2html.web.model.Gesture;
import com.mcnc.xml2html.web.model.Page;
import com.mcnc.xml2html.web.model.Project;

public interface Xml2HtmlService {
	
	public void processFiles(MultiUpload multiUpload, FileSystemResource fsResource);
	
	public List<Project> getProjects() throws IOException;
	
	public List<Page> getPages(String projectNo) throws IOException;
	
	public Gesture getGesture(String projectNo);
}
