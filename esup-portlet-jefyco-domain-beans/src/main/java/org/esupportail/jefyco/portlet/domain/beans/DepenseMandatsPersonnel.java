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
		"FOURNISSEUR",
		"LIBELLE",
		"MONTANT_HT_LIQUIDE",
		"TYPE_PIECE",
		"MONTANT_BUDGETAIRE_LIQUIDE",
		"NUMERO",
		"MONTANT_TTC_LIQUIDE",
		"BOR_DATE_VISAELSE__END"
})
public class DepenseMandatsPersonnel implements Serializable {
	
	/**
	 * For serialize.
	 */
	private static final long serialVersionUID = 7427732897404494181L;
	
	public String FOURNISSEUR;
	public String LIBELLE;
	public BigDecimal MONTANT_HT_LIQUIDE;
	public String TYPE_PIECE;
	public BigDecimal MONTANT_BUDGETAIRE_LIQUIDE ;
	public String NUMERO;
	public BigDecimal MONTANT_TTC_LIQUIDE;
	public String BOR_DATE_VISAELSE__END;
          
     /**
 	 * Bean constructor.
 	 */
 	public DepenseMandatsPersonnel() {
 		super();
 	}
     
     @PostConstruct
     public void init() {
     }

	public String getFOURNISSEUR() {
		return FOURNISSEUR;
	}

	public void setFOURNISSEUR(String fOURNISSEUR) {
		FOURNISSEUR = fOURNISSEUR;
	}

	public String getLIBELLE() {
		return LIBELLE;
	}

	public void setLIBELLE(String lIBELLE) {
		LIBELLE = lIBELLE;
	}

	public BigDecimal getMONTANT_HT_LIQUIDE() {
		return MONTANT_HT_LIQUIDE;
	}

	public void setMONTANT_HT_LIQUIDE(BigDecimal mONTANT_HT_LIQUIDE) {
		MONTANT_HT_LIQUIDE = mONTANT_HT_LIQUIDE;
	}

	public String getTYPE_PIECE() {
		return TYPE_PIECE;
	}

	public void setTYPE_PIECE(String tYPE_PIECE) {
		TYPE_PIECE = tYPE_PIECE;
	}

	public BigDecimal getMONTANT_BUDGETAIRE_LIQUIDE() {
		return MONTANT_BUDGETAIRE_LIQUIDE;
	}

	public void setMONTANT_BUDGETAIRE_LIQUIDE(BigDecimal mONTANT_BUDGETAIRE_LIQUIDE) {
		MONTANT_BUDGETAIRE_LIQUIDE = mONTANT_BUDGETAIRE_LIQUIDE;
	}

	public String getNUMERO() {
		return NUMERO;
	}

	public void setNUMERO(String nUMERO) {
		NUMERO = nUMERO;
	}

	public BigDecimal getMONTANT_TTC_LIQUIDE() {
		return MONTANT_TTC_LIQUIDE;
	}

	public void setMONTANT_TTC_LIQUIDE(BigDecimal mONTANT_TTC_LIQUIDE) {
		MONTANT_TTC_LIQUIDE = mONTANT_TTC_LIQUIDE;
	}

	public String getBOR_DATE_VISAELSE__END() {
		return BOR_DATE_VISAELSE__END;
	}

	public void setBOR_DATE_VISAELSE__END(String bOR_DATE_VISAELSE__END) {
		BOR_DATE_VISAELSE__END = bOR_DATE_VISAELSE__END;
	}

	

	
}