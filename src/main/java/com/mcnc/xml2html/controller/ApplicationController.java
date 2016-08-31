package com.mcnc.xml2html.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Properties;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.map.util.JSONPObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.core.io.FileSystemResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mcnc.xml2html.form.Message;
import com.mcnc.xml2html.form.MultiUpload;
import com.mcnc.xml2html.service.Xml2HtmlService;
import com.mcnc.xml2html.web.model.Gesture;
import com.mcnc.xml2html.web.model.Page;
import com.mcnc.xml2html.web.model.Pages;
import com.mcnc.xml2html.web.model.Project;
import com.mcnc.xml2html.web.model.Projects;

@Controller
public class ApplicationController {

	final Logger logger = LoggerFactory.getLogger(ApplicationController.class);
	

	@Inject
	private FileSystemResource fsResource;
	
	@Autowired
	private Xml2HtmlService xml2HtmlService;
	
	@Autowired
	@Qualifier("props")
	private Properties properties;
	
	@RequestMapping("/")
	protected String index(ModelMap model) {

		model.addAttribute("multiUpload", new MultiUpload());
		
		
		return "application/index";
	}
	
	@RequestMapping(value = "/generate", method=RequestMethod.POST)
	@ResponseBody
	public Pages generate(@Valid MultiUpload multiUpload, BindingResult result,
			Model uiModel, Locale locale,
			RedirectAttributes redirectAttributes, HttpServletResponse response)
			throws IOException {

		if(result.hasErrors()) {
			StringBuffer sb = new StringBuffer();
			for(ObjectError error : result.getAllErrors()){
				logger.error("Error: " + error.getCode() +  " - " + error.getDefaultMessage());
				sb.append("Error: " + error.getCode() +  " - " + error.getDefaultMessage());
			}
			
			return new Pages(sb.toString());
		}
		
		xml2HtmlService.processFiles(multiUpload, fsResource);
		
		List<Page> pages = xml2HtmlService.getPages(multiUpload.getProjectNo());
		
		Pages model = new Pages("success");
		model.setPages(pages);
		
		return model;
	}

	@RequestMapping(value = "/upload", method = RequestMethod.POST) 
	protected String upload(@Valid MultiUpload multiUpload, BindingResult result, Model uiModel, Locale locale, RedirectAttributes redirectAttributes, HttpServletResponse response)  throws IOException{
		
		
		if(result.hasErrors()) {
			for(ObjectError error : result.getAllErrors()){
				logger.error("Error: " + error.getCode() +  " - " + error.getDefaultMessage());
			}
			
			return "application/index";
		}
		
		
		String wasFtpUrl = properties.getProperty("wasFtp") + multiUpload.getProjectNo();
		
		xml2HtmlService.processFiles(multiUpload, fsResource);
		redirectAttributes.addFlashAttribute("message", new Message("XML file extracted successfully. Preview it by URL: <a href='" + wasFtpUrl + "' target='_blank'>"+wasFtpUrl+"</a>", "success"));
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/upload", method = RequestMethod.GET)
	protected String upload(){
		return "redirect:/";
	}
	
	@RequestMapping(value = "/projects", method=RequestMethod.GET, produces="application/json")
	@ResponseBody
	public Projects getProjects() throws IOException{
		
		List<Project> projects = xml2HtmlService.getProjects();
		
		Projects model = new Projects("success");
		model.setProjects(projects);
		
		return model;
		
	}
	
	@RequestMapping(value="/pages", method=RequestMethod.GET, produces="application/json")
	@ResponseBody
	public Pages getPages(@RequestParam("projectNo") String projectNo)  throws IOException{
		
		List<Page> pages = xml2HtmlService.getPages(projectNo);
		Gesture gesture = xml2HtmlService.getGesture(projectNo);

    
		Pages model = new Pages("success");
		model.setPages(pages);
		model.setGesture(gesture);
		
		return model;
	}
	
	@RequestMapping(value = "/simulator", method=RequestMethod.GET)
	public String showSimulator(ModelMap model)  throws IOException{
		List<Project> projects = xml2HtmlService.getProjects();
		model.addAttribute("projects", projects);
		return "simulator/show";
	}
	
	@RequestMapping(value = "/rest/projects", method=RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String jsonpProjects(@RequestParam("callback")String callBack) throws Exception{
	    ObjectMapper objectMapper = new ObjectMapper();
	    Map<String, Object> map = new HashMap<String, Object>();
	    map.put("data", getProjects());
	    return objectMapper.writeValueAsString(new JSONPObject(callBack,map));
	}
	
	@RequestMapping(value = "/rest/pages", method=RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String jsonpPages(@RequestParam("callback")String callBack, @RequestParam("projectNo") String projectNo) throws Exception{
		ObjectMapper objectMapper = new ObjectMapper();
	    Map<String, Object> map = new HashMap<String, Object>();
	    map.put("data", getPages(projectNo));
	    return objectMapper.writeValueAsString(new JSONPObject(callBack,map));
	}
	
}
