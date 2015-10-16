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
import org.esupportail.jefyco.portlet.domain.beans.UB;
import org.springframework.web.bind.annotation.ModelAttribute;
 
@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name="NSMutableArrays")
public class UBList {
 
	@XmlElement(name = "NSDictionary")
	public List<UB> liste_ub = new ArrayList<UB>();
	
	@XmlTransient
	public String exercice;
	
	@XmlTransient
	public String etablissement;
	
	@ModelAttribute("searchForm")
	public List<UB> getUB() {
	  return liste_ub;
	 }
	 
	 public void setUB(List<UB> ub) {
	  this.liste_ub = ub;
	 }
	 
	 public String getExercice(){
		 return exercice;
	 }
	 
	 public void setExercice(String exercice){
		 this.exercice = exercice;
	 }
	 
	 public String getEtablissement(){
		 return etablissement;
	 }
	 
	 public void setEtablissement(String etablissement){
		 this.etablissement = etablissement;
	 }
}