package org.esupportail.jefyco.portlet.domain.beans;

import java.util.List;

import javax.annotation.PostConstruct;
import java.io.Serializable;

import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlTransient;
import javax.xml.bind.annotation.XmlType;

import org.esupportail.commons.services.logging.Logger;
import org.esupportail.commons.services.logging.LoggerImpl;


@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = {
    "VALUE",
    "ID",
    "DAT"
})
public class Convention implements Serializable {

	
	@SuppressWarnings("unused")
	   @XmlTransient
		private final Logger logger = new LoggerImpl(getClass());
	
	/**
	 * For serialize.
	 */
	private static final long serialVersionUID = 7427732897404494181L;
	
    /**
     * Convention value
     */
     public String VALUE;
    /**
     * Convention id
     */
     public String ID;
     
     /**
      * Convention date
      */
      public String DAT;
          
     /**
 	 * Bean constructor.
 	 */
 	public Convention() {
 		super();
 	}
     
     @PostConstruct
     public void init() {
     } 
    /*
	 ******************* ACCESSORS ******************* */

     public String getID() {
		return String.valueOf((int)(Double.parseDouble(ID)));
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
	
	public String getDAT() {
		return DAT;
	}
	
	public void setDAT(String value) {
		this.DAT = value;
	}
	
}