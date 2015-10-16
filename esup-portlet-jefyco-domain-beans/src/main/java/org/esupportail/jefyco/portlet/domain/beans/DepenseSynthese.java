package org.esupportail.jefyco.portlet.domain.beans;

import java.text.DecimalFormat;
import java.util.List;

import javax.annotation.PostConstruct;
import java.io.Serializable;
import java.math.BigDecimal;
import java.math.BigInteger;

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
		"LIBELLE_CREDITS",
		"MONTANT_ENGAGE",
		"MONTANT_DISPONIBLE",
		"ID_CREDITS",
		"MONTANT_CREDITS_OUVERTS",
		"MONTANT_MANDATE",
		"CREDITS"
})
public class DepenseSynthese implements Serializable {
	
	/**
	 * For serialize.
	 */
	private static final long serialVersionUID = 7427732897404494181L;
	
	public String LIBELLE_CREDITS;
	public BigDecimal MONTANT_ENGAGE;
	public BigDecimal MONTANT_DISPONIBLE;
	public String ID_CREDITS;
	public BigDecimal MONTANT_CREDITS_OUVERTS;
	public BigDecimal MONTANT_MANDATE;
	public String CREDITS;
	
	   @SuppressWarnings("unused")
	   @XmlTransient
		private final Logger logger = new LoggerImpl(getClass());
          
     /**
 	 * Bean constructor.
 	 */
 	public DepenseSynthese() {
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

	public BigDecimal getEngage() {
		return MONTANT_ENGAGE.setScale(2, BigDecimal.ROUND_HALF_UP);
	}

	public void setMONTANT_ENGAGE(BigDecimal mONTANT_ENGAGE) {
		MONTANT_ENGAGE = mONTANT_ENGAGE;
	}

	public BigDecimal getDisponible() {
		return MONTANT_DISPONIBLE.setScale(2, BigDecimal.ROUND_HALF_UP);
	}

	public void setMONTANT_DISPONIBLE(BigDecimal mONTANT_DISPONIBLE) {
		MONTANT_DISPONIBLE = mONTANT_DISPONIBLE;
	}

	public String getID_CREDITS() {
		return ID_CREDITS;
	}

	public void setID_CREDITS(String iD_CREDITS) {
		ID_CREDITS = iD_CREDITS;
	}
	
	public BigDecimal getCreditsouverts() {
		return MONTANT_CREDITS_OUVERTS.setScale(2, BigDecimal.ROUND_HALF_UP);
	}

	public void setMONTANT_CREDITS_OUVERTS(BigDecimal mONTANT_CREDITS_OUVERTS) {
		MONTANT_CREDITS_OUVERTS = mONTANT_CREDITS_OUVERTS;
	}

	public BigDecimal getMandate() {
		return MONTANT_MANDATE.setScale(2, BigDecimal.ROUND_HALF_UP);
	}

	public void setMONTANT_MANDATE(BigDecimal mONTANT_MANDATE) {
		MONTANT_MANDATE = mONTANT_MANDATE;
	}

	public String getCREDITS() {
		return CREDITS;
	}

	public void setCREDITS(String cREDITS) {
		CREDITS = cREDITS;
	}


	
}