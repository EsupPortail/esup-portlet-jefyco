package org.esupportail.jefyco.portlet.domain.beans;

import java.util.List;

import javax.annotation.PostConstruct;
import java.io.Serializable;

import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlType;


@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = {
    "VALUE",
    "ID"
})
public class Exercice implements Serializable {
	
	/**
	 * For serialize.
	 */
	private static final long serialVersionUID = 7427732897404494181L;
	
    /**
     * Exercice value
     */
     public String VALUE;
    /**
     * Exercice id
     */
     public String ID;
          
     /**
 	 * Bean constructor.
 	 */
 	public Exercice() {
 		super();
 	}
     
     @PostConstruct
     public void init() {
     } 
    /*
	 ******************* ACCESSORS ******************* */

     public String getID() {
		return ID;
	}
	
     public void setID(String id) {
		this.ID = id;
	}
	

	public String getVALUE() {
		return VALUE;
	}
	
	public void setVALUE(String value) {
		this.VALUE = value;
	}
	
}