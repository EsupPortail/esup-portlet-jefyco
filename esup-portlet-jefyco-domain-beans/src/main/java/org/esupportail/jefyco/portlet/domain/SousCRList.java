package org.esupportail.jefyco.portlet.domain;
 
import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlTransient;
 
import org.esupportail.jefyco.portlet.domain.beans.CR;
import org.esupportail.jefyco.portlet.domain.beans.SousCR;
import org.esupportail.jefyco.portlet.domain.beans.Exercice;

import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.annotation.ModelAttribute;
 
@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name="NSMutableArrays")
public class SousCRList {
 
	@XmlElement(name = "NSDictionary")
	public List<SousCR> liste_souscr = new ArrayList<SousCR>();
	
	@XmlTransient
	public String exercice;
	
	@XmlTransient
	public String cr;
	
	@ModelAttribute("searchForm")
	public List<SousCR> getSousCR() {
		return liste_souscr;
	}
	 
	public void setSousCR(List<SousCR> souscr) {
		this.liste_souscr = souscr;
	}
	
	public String getExercice(){
		return exercice;
	}
	 
	public void setExercice(String exercice){
		this.exercice = exercice;
	}
	
	public String getCR(){
		 return cr;
	 }
	 
	 public void setCR(String cr){
		 this.cr = cr;
	 }
}