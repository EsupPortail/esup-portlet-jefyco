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
		"ORGANIGRAMME_SOUSCR",
		"MONTANT_TITRE",
		"ORGANIGRAMME_ID",
		"ORGANIGRAMME_UB",
		"ORGANIGRAMME_CR",
		"ORGANIGRAMME_ETAB",
		"CREDITS",
		"ORGANIGRAMME_LIBELLE",
		"MONTANT_CREDITS_OUVERTS",
		"MONTANT_RESTE_A_REALISER"
})
public class RecetteDetails implements Serializable {
	
	/**
	 * For serialize.
	 */
	private static final long serialVersionUID = 7427732897404494181L;
	
	public String LIBELLE_CREDITS;
	public String ORGANIGRAMME_SOUSCR;
	public BigDecimal MONTANT_TITRE;
	public String ORGANIGRAMME_ID;
	public String ORGANIGRAMME_UB;
	public String ORGANIGRAMME_CR;
	public String ORGANIGRAMME_ETAB;
	public BigDecimal CREDITS;
	public String ORGANIGRAMME_LIBELLE;
	public BigDecimal MONTANT_CREDITS_OUVERTS;
	public BigDecimal MONTANT_RESTE_A_REALISER;
          
     /**
 	 * Bean constructor.
 	 */
 	public RecetteDetails() {
 		super();
 	}
     
     @PostConstruct
     public void init() {
     }

	public String getLIBELLE_CREDITS() {
		return LIBELLE_CREDITS.replaceAll(" ", "");
	}

	public void setLIBELLE_CREDITS(String lIBELLE_CREDITS) {
		LIBELLE_CREDITS = lIBELLE_CREDITS;
	}

	public String getORGANIGRAMME_SOUSCR() {
		return ORGANIGRAMME_SOUSCR;
	}

	public void setORGANIGRAMME_SOUSCR(String oRGANIGRAMME_SOUSCR) {
		ORGANIGRAMME_SOUSCR = oRGANIGRAMME_SOUSCR;
	}

	public BigDecimal getMONTANT_TITRE() {
		return MONTANT_TITRE.setScale(2, BigDecimal.ROUND_HALF_UP);
	}

	public void setMONTANT_TITRE(BigDecimal mONTANT_TITRE) {
		MONTANT_TITRE = mONTANT_TITRE;
	}

	public String getORGANIGRAMME_ID() {
		return ORGANIGRAMME_ID;
	}

	public void setORGANIGRAMME_ID(String oRGANIGRAMME_ID) {
		ORGANIGRAMME_ID = oRGANIGRAMME_ID;
	}

	public String getORGANIGRAMME_UB() {
		return ORGANIGRAMME_UB;
	}

	public void setORGANIGRAMME_UB(String oRGANIGRAMME_UB) {
		ORGANIGRAMME_UB = oRGANIGRAMME_UB;
	}

	public String getORGANIGRAMME_CR() {
		return ORGANIGRAMME_CR;
	}

	public void setORGANIGRAMME_CR(String oRGANIGRAMME_CR) {
		ORGANIGRAMME_CR = oRGANIGRAMME_CR;
	}

	public String getORGANIGRAMME_ETAB() {
		return ORGANIGRAMME_ETAB;
	}

	public void setORGANIGRAMME_ETAB(String oRGANIGRAMME_ETAB) {
		ORGANIGRAMME_ETAB = oRGANIGRAMME_ETAB;
	}

	public BigDecimal getCREDITS() {
		return CREDITS;
	}

	public void setCREDITS(BigDecimal cREDITS) {
		CREDITS = cREDITS;
	}

	public String getORGANIGRAMME_LIBELLE() {
		return ORGANIGRAMME_LIBELLE;
	}

	public void setORGANIGRAMME_LIBELLE(String oRGANIGRAMME_LIBELLE) {
		ORGANIGRAMME_LIBELLE = oRGANIGRAMME_LIBELLE;
	}

	public BigDecimal getMONTANT_CREDITS_OUVERTS() {
		return MONTANT_CREDITS_OUVERTS.setScale(2, BigDecimal.ROUND_HALF_UP);
	}

	public void setMONTANT_CREDITS_OUVERTS(BigDecimal mONTANT_CREDITS_OUVERTS) {
		MONTANT_CREDITS_OUVERTS = mONTANT_CREDITS_OUVERTS;
	}

	public BigDecimal getMONTANT_RESTE_A_REALISER() {
		return MONTANT_RESTE_A_REALISER.setScale(2, BigDecimal.ROUND_HALF_UP);
	}

	public void setMONTANT_RESTE_A_REALISER(BigDecimal mONTANT_RESTE_A_REALISER) {
		MONTANT_RESTE_A_REALISER = mONTANT_RESTE_A_REALISER;
	}

	
	
}