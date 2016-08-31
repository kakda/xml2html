package com.mcnc.xml2html.generate;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.StringWriter;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

import net.lingala.zip4j.core.ZipFile;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.FileSystemResource;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.mcnc.xml2html.form.MultiUpload;

public class Xml2Html {
	
	final Logger logger = LoggerFactory.getLogger(Xml2Html.class);

	private MultiUpload multiUpload;
	private FileSystemResource fileSystemResource;
	
	public void setMultiUpload(MultiUpload multiUpload) {
		this.multiUpload = multiUpload;
	}

	public void setFileSystemResource(FileSystemResource fileSystemResource) {
		this.fileSystemResource = fileSystemResource;
	}

	public Xml2Html(){}
	
	public Xml2Html(MultiUpload multiUpload, FileSystemResource fileSystemResource){
		this.multiUpload = multiUpload;
		this.fileSystemResource = fileSystemResource;
	}
	
	
	public void generate() {

		String tempDir = String.valueOf(System.currentTimeMillis());
		
		// Store Temporary Files
		String tempXml = storeTempFile(multiUpload.getFileXml(), fileSystemResource, multiUpload.getProjectNo(), tempDir);
		String tempImg = storeTempFile(multiUpload.getFileImage(), fileSystemResource, multiUpload.getProjectNo(), tempDir);

		extractTempFile(fileSystemResource, multiUpload.getProjectNo(), tempXml, tempImg);

		// Delete Temporary Files
		//removeTempFile(tempXml);
		//removeTempFile(tempImg);
	}

	public String storeTempFile(CommonsMultipartFile commonsMultipartFile,
			FileSystemResource fsResource, String projectNo, String tempDir) {

		String filename = commonsMultipartFile.getOriginalFilename();
		
		String fileSave = fsResource.getPath() + File.separator + projectNo + File.separator + tempDir + File.separator + filename;

		byte[] bytes = commonsMultipartFile.getBytes();
		try {
			new File(fsResource.getPath() + File.separator + projectNo + File.separator + tempDir).mkdirs();
			File lOutFile = new File(fileSave);
			FileOutputStream fos = new FileOutputStream(lOutFile);
			fos.write(bytes);
			fos.close();
			if(filename.endsWith(".xml"))
				FileCopyUtils.copy(lOutFile, new File(fsResource.getPath() + File.separator + projectNo+File.separator + "waple.xml"));
		} catch (IOException e) {
			logger.error(e.getMessage(), e);
		}
		
		

		return fileSave;
	}

	public boolean removeTempFile(String fileUrl) {
		boolean bool = false;
		try {
			File file = new File(fileUrl);
			if (file.exists()) {
				if (file.delete())
					bool = true;
				else
					bool = false;
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return bool;
	}

	public void extractTempFile(FileSystemResource fsResource,
			String projectCode, String tempXml, String tempImg) {

		String newPath = fsResource.getPath() + File.separator + projectCode;
		String imgDir = fsResource.getPath() + File.separator + projectCode + File.separator + "images";
		String xslTemplate = getClass().getClassLoader().getResource("base.xsl").getPath();
		
		File tempPath = new File(imgDir);
		
		if(!tempPath.isDirectory()) {
			tempPath.mkdirs();
		}
		
		try {
			ZipFile zipFile = new ZipFile(tempImg);
			
			if(zipFile.isValidZipFile())
				zipFile.extractAll(imgDir);
			
		} catch (Exception e) {
			logger.warn("Zip File is not valid");
			logger.warn(e.getMessage(), e);
		}
		
		// delete html files in project direcotry
		deleteHtmlFiles(new File(newPath));
		transformXml(tempXml, newPath, xslTemplate);
		/*
		if (tempPath.mkdirs()) {

			try {
				ZipFile zipFile = new ZipFile(tempImg);
				zipFile.extractAll(imgDir);
				transformXml(tempXml, newPath, xslTemplate);
			} catch (Exception e) {

				logger.error(e.getMessage(), e);
			}

		} else {
			logger.error("Directory Exists");
		}
		*/
	}

	public void transformXml(String xmlSource, String htmlOutput, String xslTemplate) {
		try {
			
			DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder documentBuilder = documentBuilderFactory.newDocumentBuilder();
		
			Document document = documentBuilder.parse(xmlSource);
			NodeList nodeList = document.getElementsByTagName("pages");
			
			Node node = nodeList.item(0);
			if (node.getNodeType() == Node.ELEMENT_NODE) {
				nodeList = node.getChildNodes();
				if(nodeList.getLength() > 0){
					for (int i = 0 ; i < nodeList.getLength(); i++) {
						node = nodeList.item(i);
						if(node.getNodeName().equalsIgnoreCase("PAGE")){

							TransformerFactory tFactory = TransformerFactory.newInstance();
							
							tFactory.setURIResolver(new ClasspathResourceURIResolver());
							
							Transformer transformer = tFactory.newTransformer(new StreamSource(xslTemplate));

							DOMSource source = new DOMSource(node);
							
							
							
							source.setSystemId(xslTemplate);
							StringWriter writer = new StringWriter();
							transformer.transform(source, new StreamResult(writer));
							
							
							File file = new File(htmlOutput + File.separator + node.getAttributes().getNamedItem("id").getNodeValue() + ".html");

							// if file doesnt exists, then create it
							if (!file.exists()) {
								file.createNewFile();
							}

							FileWriter fw = new FileWriter(file.getAbsoluteFile());
							BufferedWriter bw = new BufferedWriter(fw);
							bw.write(writer.toString());
							bw.close();
						}
					}
				}
			}
			
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
	}

	private void deleteHtmlFiles(File directory) {
		if(directory == null) return;
		
		if(! directory.isDirectory()) return;
		
		File [] files = directory.listFiles();
		for(File file : files) {
			deleteHtmlFile(file);
		}
	}
	
	private void deleteHtmlFile(File file) {
		
		if(file != null
				&& file.isFile()) {
			
			if(file.getName().endsWith(".html")) {
				file.delete();
			}
		}
			
	}
	
	public void deleteAll(File file) throws IOException {
		if (file.isDirectory()) {
			// directory is empty, then delete it
			if (file.list().length == 0) {
				file.delete();
				logger.debug("Directory is deleted : " + file.getAbsolutePath());

			} else {

				// list all the directory contents
				String files[] = file.list();
				for (String temp : files) {
					// construct the file structure
					File fileDelete = new File(file, temp);
					// recursive delete
					deleteAll(fileDelete);
				}
				// check the directory again, if empty then delete it
				if (file.list().length == 0) {
					file.delete();
					logger.debug("Directory is deleted : " + file.getAbsolutePath());
				}
			}

		} else {
			// if file, then delete it
			file.delete();
			logger.debug("File is deleted : " + file.getAbsolutePath());
		}
	}
}
