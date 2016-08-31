package com.mcnc.xml2html.service.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.core.io.FileSystemResource;
import org.springframework.stereotype.Service;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import com.mcnc.xml2html.form.MultiUpload;
import com.mcnc.xml2html.generate.Xml2Html;
import com.mcnc.xml2html.service.Xml2HtmlService;
import com.mcnc.xml2html.web.model.Gesture;
import com.mcnc.xml2html.web.model.Page;
import com.mcnc.xml2html.web.model.Project;

@Service("xml2HtmlService")
public class Xml2HtmlServiceImpl implements Xml2HtmlService{

	@Autowired
	private FileSystemResource fileSystemResource;
	
	@Autowired
	@Qualifier("props")
	private Properties properties;
	
	public void processFiles(MultiUpload multiUpload, FileSystemResource fsResource){
		
		Xml2Html xml2Html = new Xml2Html(multiUpload, fsResource);
		xml2Html.generate();
	}

	@Override
	public List<Project> getProjects() throws IOException {
		
		
		File base = new File(fileSystemResource.getPath());
		if(! base.isDirectory() ) return null;
		
		String [] paths = base.list();
		
		List<Project> list = new ArrayList<Project>();
		for(String path : paths) {
			Project p = new Project(path);
			
			FileSystemResource resource = new FileSystemResource(fileSystemResource.getPath() + File.separator + path + File.separator + "waple.xml");
			
			byte[] bytes = IOUtils.toByteArray(resource.getInputStream());
			p.setXmlFile(new String(bytes, Charset.forName("UTF-8")));
			
			list.add(p);
		}
		return list;
	}

	@Override
	public List<Page> getPages(String projectNo) throws IOException{
		
		String url = properties.getProperty("url");
		File base = new File(fileSystemResource.getPath() + projectNo);
		
		String [] files = base.list();
		
		List<Page> list = new ArrayList<Page>();
		String xmlFile = null;
		
		
		int i = 0;
		for(String s : files) {
			if(s.endsWith(".html")) {
				InputStream is = new FileInputStream(base.listFiles()[i]);
				byte[] b = IOUtils.toByteArray(is);
				
				Page p = new Page(url + projectNo + "/" + s, s);
				p.setHtmlFile(new String(b, Charset.forName("UTF-8")));
				
				list.add(p);
			} else if(s.endsWith(".xml")) {
				xmlFile = s;
			}
			i++;
		}
//		list.clear();
//		List<String> pageNames = parseXML(base, xmlFile);
//		for(String s : pageNames) {
//			Page p = new Page(url + projectNo + "/" + s + ".html", s.concat(".html"));
//			list.add(p);
//		}
		
		
		return parseXMLForPage(base, xmlFile, url, projectNo, list);
	}
	
	private List<Page> parseXMLForPage(File directory, String xmlFile, String url, String projectNo, List<Page> pages) {
		
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		
		InputStream input = null;
		try {
			DocumentBuilder docBuilder = factory.newDocumentBuilder();
			
			input = new FileInputStream(new File(directory, xmlFile));
			
			Document document = docBuilder.parse(input);
			
			NodeList pageList = document.getElementsByTagName("page");
			
			Element pageElement = null;
			
			for(int i = 0; i < pageList.getLength(); i++) {
				pageElement = (Element) pageList.item(i);
				

				String width = pageElement.getAttribute("width");
				String height = pageElement.getAttribute("height");
				
				
				pages.get(i).setWidth(width);
				pages.get(i).setHeight(height);
			}
			
			return pages;
			
		} catch(Exception e) {
			e.printStackTrace();
			
		} finally {
			try {
				input.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
/*	
	private List<String> parseXML(File directory, String xmlFile) {
		
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		
		InputStream input = null;
		try {
			DocumentBuilder docBuilder = factory.newDocumentBuilder();
			
			input = new FileInputStream(new File(directory, xmlFile));
			
			Document document = docBuilder.parse(input);
			
			NodeList pageList = document.getElementsByTagName("page");
			
			Element pageElement = null;
			List<String> pageNames = new ArrayList<String>();
			for(int i = 0; i < pageList.getLength(); i++) {
				pageElement = (Element) pageList.item(i);
				pageNames.add(pageElement.getAttribute("id"));
			}
			
			return pageNames;
		} catch(Exception e) {
			e.printStackTrace();
			
		} finally {
			try {
				input.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
*/	
	private Gesture parseXMLforGesture(File directory, String xmlFile) {
		
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		
		InputStream input = null;
		try {
			DocumentBuilder docBuilder = factory.newDocumentBuilder();
			
			input = new FileInputStream(new File(directory, xmlFile));
			
			Document document = docBuilder.parse(input);
			
			NodeList pagesList = document.getElementsByTagName("pages");
			Element element = null;
			Gesture gesture = new Gesture();
			for(int i = 0; i < pagesList.getLength(); i++) {
				element = (Element) pagesList.item(i);
				gesture.setAirGesture(element.getAttribute("AirGesture"));
				gesture.setAirJump(element.getAttribute("AirJump"));
				gesture.setAirBrowse(element.getAttribute("AirBrowse"));
			}
			
			return gesture;
		} catch(Exception e) {
			e.printStackTrace();
			
		} finally {
			try {
				input.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	@Override
	public Gesture getGesture(String projectNo) {
		
		File base = new File(fileSystemResource.getPath() + File.separator + projectNo);
		
		String [] files = base.list();
		
		
		String xmlFile = null;
		for(String s : files) {
			if(s.endsWith(".xml")) {
				xmlFile = s;
			}
		}
		
		Gesture gesture = parseXMLforGesture(base, xmlFile);
		
		return gesture;
	}
}
