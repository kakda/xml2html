package com.mcnc.xml2html.web.model;


public class Page {

	private String url;
	
	private String name;
	
	private String htmlFile;

	private String width;
	
	private String height;
	
	public Page(String url) {
		this.url = url;
	}
	
	public Page(String url, String name) {
		this.url = url;
		this.name = name;
	}
	

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}

	public String getWidth() {
		return width;
	}

	public void setWidth(String width) {
		this.width = width;
	}

	public String getHeight() {
		return height;
	}

	public void setHeight(String height) {
		this.height = height;
	}

	@Override
	public String toString() {
		return "Page [url=" + url + ", name=" + name + ", htmlFile=" + htmlFile
				+ ", width=" + width + ", height=" + height + "]";
	}

	public String getHtmlFile() {
		return htmlFile;
	}

	public void setHtmlFile(String htmlFile) {
		this.htmlFile = htmlFile;
	}
}
