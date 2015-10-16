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
		"ORGANIGRAMME_UB",
		"ORGANIGRAMME_CR",
		"ORGANIGRAMME_ETAB",
		"MONTANT_MANDATE",
		"ORGANIGRAMME_ID",
		"TYPECREDIT_ID",
		"MONTANT_DISPONIBLE",
		"MONTANT_CREDITS_OUVERTS",
		"CREDITS",
		"MONTANT_ENGAGE"
})
public class DepenseDetails implements Serializable {
	
	/**
	 * For serialize.
	 */
	private static final long serialVersionUID = 7427732897404494181L;
	
	public String LIBELLE_CREDITS;
	public String ORGANIGRAMME_SOUSCR;
	public String ORGANIGRAMME_UB;
	public String ORGANIGRAMME_CR;
	public String ORGANIGRAMME_ETAB;
	public BigDecimal MONTANT_MANDATE;
	public String ORGANIGRAMME_ID;
	public String TYPECREDIT_ID;
	public BigDecimal MONTANT_DISPONIBLE;
	public BigDecimal MONTANT_CREDITS_OUVERTS;
	public BigDecimal CREDITS;
	public BigDecimal MONTANT_ENGAGE;
          
     /**
 	 * Bean constructor.
 	 */
 	public DepenseDetails() {
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

	public String getORGANIGRAMME_SOUSCR() {
		return ORGANIGRAMME_SOUSCR;
	}

	public void setORGANIGRAMME_SOUSCR(String oRGANIGRAMME_SOUSCR) {
		ORGANIGRAMME_SOUSCR = oRGANIGRAMME_SOUSCR;
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

	public BigDecimal getMandate() {
		return MONTANT_MANDATE.setScale(2, BigDecimal.ROUND_HALF_UP);
	}

	public void setMONTANT_MANDATE(BigDecimal mONTANT_MANDATE) {
		MONTANT_MANDATE = mONTANT_MANDATE;
	}

	public String getORGANIGRAMME_ID() {
		return ORGANIGRAMME_ID;
	}

	public void setORGANIGRAMME_ID(String oRGANIGRAMME_ID) {
		ORGANIGRAMME_ID = oRGANIGRAMME_ID;
	}

	public String getTYPECREDIT_ID() {
		return TYPECREDIT_ID;
	}

	public void setTYPECREDIT_ID(String tYPECREDIT_ID) {
		TYPECREDIT_ID = tYPECREDIT_ID;
	}

	public BigDecimal getDisponible() {
		return MONTANT_DISPONIBLE.setScale(2, BigDecimal.ROUND_HALF_UP);
	}

	public void setMONTANT_DISPONIBLE(BigDecimal mONTANT_DISPONIBLE) {
		MONTANT_DISPONIBLE = mONTANT_DISPONIBLE;
	}

	public BigDecimal getCreditsouverts() {
		return MONTANT_CREDITS_OUVERTS.setScale(2, BigDecimal.ROUND_HALF_UP);
	}

	public void setMONTANT_CREDITS_OUVERTS(BigDecimal mONTANT_CREDITS_OUVERTS) {
		MONTANT_CREDITS_OUVERTS = mONTANT_CREDITS_OUVERTS;
	}

	public BigDecimal getCredits() {
		return CREDITS.setScale(2, BigDecimal.ROUND_HALF_UP);
	}

	public void setCREDITS(BigDecimal cREDITS) {
		CREDITS = cREDITS;
	}

	public BigDecimal getEngage() {
		return MONTANT_ENGAGE.setScale(2, BigDecimal.ROUND_HALF_UP);
	}

	public void setMONTANT_ENGAGE(BigDecimal mONTANT_ENGAGE) {
		MONTANT_ENGAGE = mONTANT_ENGAGE;
	} 

	
}