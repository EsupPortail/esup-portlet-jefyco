package org.esupportail.jefyco.portlet.domain;
 
import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlTransient;
 
import org.esupportail.jefyco.portlet.domain.beans.Convention;
import org.esupportail.jefyco.portlet.domain.beans.Exercice;

import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.annotation.ModelAttribute;
 
@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name="NSMutableArrays")
public class ConventionsList {
 
	@XmlElement(name = "NSDictionary")
	public List<Convention> liste_conventions = new ArrayList<Convention>();
	
	@XmlTransient
	public String exercice;
	
	@XmlTransient
	public String organigramme;
	
	@ModelAttribute("searchForm")
	public List<Convention> getConventions() {
		return liste_conventions;
	}
	 
	public void setConventions(List<Convention> conventions) {
		this.liste_conventions = conventions;
	}
	
	public String getExercice(){
		return exercice;
	}
	 
	public void setExercice(String exercice){
		this.exercice = exercice;
	}
	
	public String getOrganigramme(){
		return organigramme;
	}
	 
	public void setOrganigramme(String organigramme){
		this.organigramme = organigramme;
	}
}