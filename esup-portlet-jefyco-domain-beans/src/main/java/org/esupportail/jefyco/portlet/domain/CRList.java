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
import org.esupportail.jefyco.portlet.domain.beans.UB;
import org.esupportail.jefyco.portlet.domain.beans.Exercice;

import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.annotation.ModelAttribute;
 
@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name="NSMutableArrays")
public class CRList {
 
	@XmlElement(name = "NSDictionary")
	public List<CR> liste_cr = new ArrayList<CR>();
	
	@XmlTransient
	public String exercice;
	
	@XmlTransient
	public String ub;
	
	@ModelAttribute("searchForm")
	public List<CR> getCR() {
		return liste_cr;
	}
	 
	public void setCR(List<CR> cr) {
		this.liste_cr = cr;
	}
	
	public String getExercice(){
		return exercice;
	}
	 
	public void setExercice(String exercice){
		this.exercice = exercice;
	}
	
	public String getUB(){
		 return ub;
	 }
	 
	 public void setUB(String ub){
		 this.ub = ub;
	 }
}