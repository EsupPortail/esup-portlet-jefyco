package org.esupportail.jefyco.portlet.domain.beans;

import java.util.List;

import javax.annotation.PostConstruct;
import java.io.Serializable;
import java.math.BigDecimal;

import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlType;


@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = {
		"LIBELLE_CREDITS",
		"MONTANT_RESTE_A_REALISER",
		"MONTANT_TITRE",
		"CREDITS",
		"MONTANT_CREDITS_OUVERTS"
})
public class RecetteSynthese implements Serializable {
	
	/**
	 * For serialize.
	 */
	private static final long serialVersionUID = 7427732897404494181L;
	
	public String LIBELLE_CREDITS;
	public BigDecimal MONTANT_RESTE_A_REALISER;
	public BigDecimal MONTANT_TITRE;
	public Integer CREDITS;
	public BigDecimal MONTANT_CREDITS_OUVERTS;
          
     /**
 	 * Bean constructor.
 	 */
 	public RecetteSynthese() {
 		super();
 	}
     
     @PostConstruct
     public void init() {
     }

	public String getLIBELLE_CREDITS() {
		return LIBELLE_CREDITS;
	}

	public void setLIBELLE_CREDITS(String lIBELLE_CREDITS) {
		LIBELLE_CREDITS = lIBELLE_CREDITS;
	}

	public BigDecimal getRestearealiser() {
		return MONTANT_RESTE_A_REALISER.setScale(2, BigDecimal.ROUND_HALF_UP);
	}

	public void setMONTANT_RESTE_A_REALISER(BigDecimal mONTANT_RESTE_A_REALISER) {
		MONTANT_RESTE_A_REALISER = mONTANT_RESTE_A_REALISER;
	}

	public BigDecimal getTitre() {
		return MONTANT_TITRE.setScale(2, BigDecimal.ROUND_HALF_UP);
	}

	public void setMONTANT_TITRE(BigDecimal mONTANT_TITRE) {
		MONTANT_TITRE = mONTANT_TITRE;
	}

	public Integer getCREDITS() {
		return CREDITS;
	}

	public void setCREDITS(Integer cREDITS) {
		CREDITS = cREDITS;
	}

	public BigDecimal getCreditsouverts() {
		return MONTANT_CREDITS_OUVERTS.setScale(2, BigDecimal.ROUND_HALF_UP);
	}

	public void setMONTANT_CREDITS_OUVERTS(BigDecimal mONTANT_CREDITS_OUVERTS) {
		MONTANT_CREDITS_OUVERTS = mONTANT_CREDITS_OUVERTS;
	}

	
}