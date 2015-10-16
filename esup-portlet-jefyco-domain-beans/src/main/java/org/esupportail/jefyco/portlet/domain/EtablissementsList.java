package org.esupportail.jefyco.portlet.domain;
 
import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlTransient;
 
import org.esupportail.jefyco.portlet.domain.beans.Etablissement;
import org.esupportail.jefyco.portlet.domain.beans.Exercice;

import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.annotation.ModelAttribute;
 
@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name="NSMutableArrays")
public class EtablissementsList {
 
	@XmlElement(name = "NSDictionary")
	public List<Etablissement> liste_etablissements = new ArrayList<Etablissement>();
	
	@XmlTransient
	public String exercice;
	
	@ModelAttribute("searchForm")
	public List<Etablissement> getEtablissements() {
		return liste_etablissements;
	}
	 
	public void setEtablissements(List<Etablissement> etablissements) {
		this.liste_etablissements = etablissements;
	}
	
	public String getExercice(){
		return exercice;
	}
	 
	public void setExercice(String exercice){
		this.exercice = exercice;
	}
}