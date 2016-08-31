package com.mcnc.xml2html.form;

public class Message {
	private String type;
	private String text;
	
	public Message(){}
	
	public Message(String text, String type){
		this.text = text;
		this.type = type;
	}
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	
}
