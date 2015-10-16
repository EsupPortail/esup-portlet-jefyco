/**
 * ESUP-Portail Blank Application - Copyright (c) 2010 ESUP-Portail consortium.
 */
package org.esupportail.jefyco.portlet.domain;

import java.io.Serializable;
import java.util.List;

import org.esupportail.jefyco.portlet.domain.beans.CR;
import org.esupportail.jefyco.portlet.domain.beans.Convention;
import org.esupportail.jefyco.portlet.domain.beans.DepenseDetails;
import org.esupportail.jefyco.portlet.domain.beans.DepenseMandats;
import org.esupportail.jefyco.portlet.domain.beans.DepenseSynthese;
import org.esupportail.jefyco.portlet.domain.beans.Etablissement;
import org.esupportail.jefyco.portlet.domain.beans.RecetteDetails;
import org.esupportail.jefyco.portlet.domain.beans.RecetteSynthese;
import org.esupportail.jefyco.portlet.domain.beans.RecetteTitres;
import org.esupportail.jefyco.portlet.domain.beans.ResteEngage;
import org.esupportail.jefyco.portlet.domain.beans.SousCR;
import org.esupportail.jefyco.portlet.domain.beans.UB;
import org.esupportail.jefyco.portlet.domain.beans.User;
import org.esupportail.jefyco.portlet.domain.beans.Exercice;
import org.esupportail.jefyco.portlet.domain.ExercicesList;
import org.springframework.http.ResponseEntity;

/**
 * @author Yves Deschamps (Universite de Lille 1) - 2010
 * 
 */
public interface DomainService extends Serializable {
	
	/**
	 * @param uid
	 * @return a user.
	 */
	User getUser(String uid);
	
    public List<Exercice> getListeExercices(String muscadeUrl,String token, String debut);

    public List<UB> getListeUB(String exercice, String etablissement,
			String muscadeUrl, String token);

    public List<Etablissement> getListeEtablissements(String exercice,
			String muscadeUrl, String token);
    
    public List<CR> getListeCR(String exercice, String ub,
			String muscadeUrl, String token);
    
    public List<SousCR> getListeSousCR(String exercice, String cr,
			String muscadeUrl, String token);
    
    public List<Convention> getListeConvention(String exercice, String organigramme,
			String muscadeUrl, String token);
    
    
    public Integer getCountDepenseDetail(String convention, String exercice, String numeropage, String organigramme, String sousniveaux,
			String muscadeUrl, String token);
    
    public Integer getCountDepenseMandats(String convention, String exercice, String numeropage, String organigramme, String sousniveaux, String typecredit,
			String muscadeUrl, String token, String credit, String pers);
    
    public Integer getCountDepenseSynthese(String convention, String exercice, String numeropage, String organigramme, String sousniveaux,
			String muscadeUrl, String token);
    
    public Integer getCountRecetteDetails(String convention, String exercice, String numeropage, String organigramme, String sousniveaux,
			String muscadeUrl, String token);
    
    public Integer getCountRecetteSynthese(String convention, String exercice, String numeropage, String organigramme, String sousniveaux,
			String muscadeUrl, String token);
    
    public Integer getCountResteEngage(String convention, String exercice, String numeropage, String organigramme, String sousniveaux, String typecredit,
			String muscadeUrl, String token);
    
    
	public Integer getCountRecetteTitres(String convention, String exercice,
			String numeropage, String organigramme, String sousniveaux,
			String credits, String muscadeUrl, String token, String taille,
			String libelle_credit, String salaire);
    
    
    
    public List<DepenseDetails> getListeDepenseDetail(String convention, String exercice, String numeropage, String organigramme, String sousniveaux,
			String muscadeUrl, String token, String taille);
    
    public List<DepenseMandats> getListeDepenseMandats(String convention, String exercice, String numeropage, String organigramme, String sousniveaux, String typecredit,
			String muscadeUrl, String token, String taille, String colonne, String sens, String credit, String pers);
    
    public List<DepenseSynthese> getListeDepenseSynthese(String convention, String exercice, String numeropage, String organigramme, String sousniveaux,
			String muscadeUrl, String token, String taille);
    
    public List<RecetteDetails> getListeRecetteDetails(String convention, String exercice, String numeropage, String organigramme, String sousniveaux,
			String muscadeUrl, String token, String taille);
    
    public List<RecetteSynthese> getListeRecetteSynthese(String convention, String exercice, String numeropage, String organigramme, String sousniveaux,
			String muscadeUrl, String token, String taille);
    
    public List<ResteEngage> getListeResteEngage(String convention, String exercice, String numeropage, String organigramme, String sousniveaux, String typecredit,
			String muscadeUrl, String token, String taille, String colonne, String sens);
    
    public List<RecetteTitres> getListeRecetteTitres(String convention,
			String exercice, String numeropage, String organigramme,
			String sousniveaux, String typecredit, String muscadeUrl,
			String token, String taille, String credit, String salaire, String colonne, String sens);

	boolean getTestDroit(String muscadeUrl, String token);
	
	public String getCaslogin_url();
	
	public String getMuscade_url();
	
	public String getMuscade_url_ext();
	
	public String getExercice_debut();
	
	public String getAffiche_convention();
	
	public String getAuth_param();
	
	public String getAuth_param_ticket();
	
	public String getConnection_mode();
	
	public String getExercice_list();
	
	public String getUb_list();
	
	public String getEtablissement_list();
	
	public String getCr_list();
	
	public String getSouscr_list();
	
	public String getConvention_list();
	
	public String getDepense_details_list();
	
	public String getDepense_mandat_list();
	
	public String getDepense_synthese_list();
	
	public String getRecette_details_list();
	
	public String getRecette_synthese_list();
	
	public String getReste_engage_list();
	
	public String getDepense_details_count();
	
	public String getDepense_mandat_count();
	
	public String getDepense_synthese_count();
	
	public String getRecette_details_count();
	
	public String getRecette_synthese_count();
	
	public String getRecette_titres_count();
	
	public String getReste_engage_count();
	
	public String getTest_droit_list();
	
	public String getService();

	public String getRecette_titres_list();

	



	

}
