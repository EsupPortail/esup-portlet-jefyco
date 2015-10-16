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
		"CMDE_NUMERO",
		"FOURNISSEUR",
		"STATUS",
		"MTTTC",
		"MTBUD",
		"ENGAGE_LIBELLE",
		"MTHT",
		"ENG_MONTANT_BUDGETAIRE_RESTE"
})
public class ResteEngage implements Serializable {
	
	/**
	 * For serialize.
	 */
	private static final long serialVersionUID = 7427732897404494181L;

	public String CMDE_NUMERO;
	public String FOURNISSEUR;
	public String STATUS;
	public BigDecimal MTTTC;
	public BigDecimal MTBUD;
	public String ENGAGE_LIBELLE;
	public BigDecimal MTHT;
	public BigDecimal ENG_MONTANT_BUDGETAIRE_RESTE;
	
     /**
 	 * Bean constructor.
 	 */
 	public ResteEngage() {
 		super();
 	}
     
     @PostConstruct
     public void init() {
     }

	public String getCMDE_NUMERO() {
		return CMDE_NUMERO;
	}

	public void setCMDE_NUMERO(String cMDE_NUMERO) {
		CMDE_NUMERO = cMDE_NUMERO;
	}

	public String getFOURNISSEUR() {
		return FOURNISSEUR;
	}

	public void setFOURNISSEUR(String fOURNISSEUR) {
		FOURNISSEUR = fOURNISSEUR;
	}

	public String getSTATUS() {
		return STATUS;
	}

	public void setSTATUS(String sTATUS) {
		STATUS = sTATUS;
	}

	public BigDecimal getMTTTC() {
		return MTTTC;
	}

	public void setMTTTC_(BigDecimal mTTTC) {
		MTTTC = mTTTC;
	}

	public BigDecimal getMTBUD() {
		return MTBUD;
	}

	public void setMTBUD_(BigDecimal mTBUD) {
		MTBUD = mTBUD;
	}

	public String getENGAGE_LIBELLE() {
		return ENGAGE_LIBELLE;
	}

	public void setENGAGE_LIBELLE(String eNGAGE_LIBELLE) {
		ENGAGE_LIBELLE = eNGAGE_LIBELLE;
	}

	public BigDecimal getMTHT() {
		return MTHT;
	}

	public void setMTHT_(BigDecimal mTHT) {
		MTHT = mTHT;
	}

	public BigDecimal getReste() {
		return ENG_MONTANT_BUDGETAIRE_RESTE.setScale(2, BigDecimal.ROUND_HALF_UP);
	}

	public void setENG_MONTANT_BUDGETAIRE_RESTE(BigDecimal eNG_MONTANT_BUDGETAIRE_RESTE) {
		ENG_MONTANT_BUDGETAIRE_RESTE = eNG_MONTANT_BUDGETAIRE_RESTE;
	}
}