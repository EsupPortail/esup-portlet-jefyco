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
		"MONTANT_BUDGETAIRE",
		"FOURNISSEUR",
		"MONTANT_TTC",
		"LIBELLE",
		"NUMERO",
		"TYPE_PIECE",
		"BOR_DATE_VISAELSE__END",
		"MONTANT_HT"
})
public class RecetteTitres implements Serializable {
	
	/**
	 * For serialize.
	 */
	private static final long serialVersionUID = 7427732897404494181L;
	
	public BigDecimal MONTANT_BUDGETAIRE;
	public String FOURNISSEUR;
	public BigDecimal MONTANT_TTC;
	public String LIBELLE;
	public String NUMERO;
	public String TYPE_PIECE;
	public String BOR_DATE_VISAELSE__END;
	public BigDecimal MONTANT_HT;

          
     /**
 	 * Bean constructor.
 	 */
 	public RecetteTitres() {
 		super();
 	}
     
     @PostConstruct
     public void init() {
     }

	public BigDecimal getMONTANT_BUDGETAIRE() {
		return MONTANT_BUDGETAIRE;
	}

	public void setMONTANT_BUDGETAIRE(BigDecimal mONTANT_BUDGETAIRE) {
		MONTANT_BUDGETAIRE = mONTANT_BUDGETAIRE;
	}

	public String getFOURNISSEUR() {
		return FOURNISSEUR;
	}

	public void setFOURNISSEUR(String fOURNISSEUR) {
		FOURNISSEUR = fOURNISSEUR;
	}

	public BigDecimal getMONTANT_TTC() {
		return MONTANT_TTC.setScale(2, BigDecimal.ROUND_HALF_UP);
	}

	public void setMONTANT_TTC(BigDecimal mONTANT_TTC) {
		MONTANT_TTC = mONTANT_TTC;
	}

	public String getLIBELLE() {
		return LIBELLE;
	}

	public void setLIBELLE(String lIBELLE) {
		LIBELLE = lIBELLE;
	}

	public String getNUMERO() {
		return NUMERO;
	}

	public void setNUMERO(String nUMERO) {
		NUMERO = nUMERO;
	}

	public String getTYPE_PIECE() {
		return TYPE_PIECE;
	}

	public void setTYPE_PIECE(String tYPE_PIECE) {
		TYPE_PIECE = tYPE_PIECE;
	}

	public String getBOR_DATE_VISAELSE__END() {
		return BOR_DATE_VISAELSE__END;
	}

	public void setBOR_DATE_VISAELSE__END(String bOR_DATE_VISAELSE__END) {
		BOR_DATE_VISAELSE__END = bOR_DATE_VISAELSE__END;
	}

	public BigDecimal getMONTANT_HT() {
		return MONTANT_HT.setScale(2, BigDecimal.ROUND_HALF_UP);
	}

	public void setMONTANT_HT(BigDecimal mONTANT_HT) {
		MONTANT_HT = mONTANT_HT;
	}
	
}