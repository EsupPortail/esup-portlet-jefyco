package org.esupportail.jefyco.portlet.domain;

 
import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlElement;
 
import org.esupportail.jefyco.portlet.domain.beans.Exercice;
 
@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name="NSMutableArrays")
public class ExercicesList {
 
	@XmlElement(name = "NSDictionary")
	public List<Exercice> liste_exercices = new ArrayList<Exercice>();
	 
	public List<Exercice> getExercices() {
	  return liste_exercices;
	 }
	 
	 public void setExercices(List<Exercice> exercices) {
	  this.liste_exercices = exercices;
	 }
}