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
import org.esupportail.jefyco.portlet.domain.beans.DepenseDetails;
import org.esupportail.jefyco.portlet.domain.beans.DepenseMandats;
import org.esupportail.jefyco.portlet.domain.beans.Exercice;

import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.annotation.ModelAttribute;
 
@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name="NSMutableArrays")
public class DepenseMandatsPersonnelList {
 
	@XmlElement(name = "NSDictionary")
	public List<DepenseMandats> liste = new ArrayList<DepenseMandats>();
	
	@XmlTransient
	public String exercice;
	
	@XmlTransient
	public String organigramme;
	
	@XmlTransient
	public String typecredit;
	
	@XmlTransient
	public String convention;
	
	@XmlTransient
	public Boolean sousniveaux;
	
	@XmlTransient
	public String numeropage;
	
	@ModelAttribute("searchForm")
	public List<DepenseMandats> getDepenseMandats() {
		return liste;
	}
	 
	public void setDepenseMandats(List<DepenseMandats> depensedetails) {
		this.liste = depensedetails;
	}
	
	public String getExercice(){
		return exercice;
	}
	 
	public void setExercice(String exercice){
		this.exercice = exercice;
	}

	public Boolean getSousniveaux() {
		return sousniveaux;
	}

	public void setSousniveaux(Boolean sousniveaux) {
		this.sousniveaux = sousniveaux;
	}

	public String getNumeropage() {
		return numeropage;
	}

	public void setNumeropage(String numeropage) {
		this.numeropage = numeropage;
	}

	public String getTypecredit() {
		return typecredit;
	}

	public void setTypecredit(String typecredit) {
		this.typecredit = typecredit;
	}
	
	
}