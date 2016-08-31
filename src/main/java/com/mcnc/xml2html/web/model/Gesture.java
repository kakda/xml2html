package com.mcnc.xml2html.web.model;

import java.io.Serializable;

public class Gesture implements Serializable {

	private static final long serialVersionUID = -8912053707209118238L;

	private String airGesture;
	private String airJump;
	private String airBrowse;
	
	public String getAirGesture() {
		return airGesture;
	}
	public void setAirGesture(String airGesture) {
		this.airGesture = airGesture;
	}
	public String getAirJump() {
		return airJump;
	}
	public void setAirJump(String airJump) {
		this.airJump = airJump;
	}
	public String getAirBrowse() {
		return airBrowse;
	}
	public void setAirBrowse(String airBrowse) {
		this.airBrowse = airBrowse;
	}
	
	
}
