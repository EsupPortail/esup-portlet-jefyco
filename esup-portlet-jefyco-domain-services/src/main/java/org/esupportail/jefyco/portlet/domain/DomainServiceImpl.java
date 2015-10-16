/**
 * ESUP-Portail Blank Application - Copyright (c) 2010 ESUP-Portail consortium.
 */
package org.esupportail.jefyco.portlet.domain;

import java.util.ArrayList;
import java.util.List;

import org.esupportail.jefyco.portlet.domain.beans.User;
import org.esupportail.commons.services.logging.Logger;
import org.esupportail.commons.services.logging.LoggerImpl;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.esupportail.jefyco.portlet.domain.beans.CR;
import org.esupportail.jefyco.portlet.domain.beans.Convention;
import org.esupportail.jefyco.portlet.domain.beans.DepenseDetails;
import org.esupportail.jefyco.portlet.domain.beans.DepenseMandats;
import org.esupportail.jefyco.portlet.domain.beans.DepenseSynthese;
import org.esupportail.jefyco.portlet.domain.beans.Etablissement;
import org.esupportail.jefyco.portlet.domain.beans.Exercice;
import org.esupportail.jefyco.portlet.domain.beans.RecetteDetails;
import org.esupportail.jefyco.portlet.domain.beans.RecetteSynthese;
import org.esupportail.jefyco.portlet.domain.beans.RecetteTitres;
import org.esupportail.jefyco.portlet.domain.beans.ResteEngage;
import org.esupportail.jefyco.portlet.domain.beans.SousCR;
import org.esupportail.jefyco.portlet.domain.beans.UB;
import org.esupportail.jefyco.portlet.domain.ExercicesList;

import javax.inject.Named;
import javax.inject.Inject;
/**
 * @author Yves Deschamps (Universite de Lille 1) - 2010
 * 
 */
public class DomainServiceImpl implements DomainService, InitializingBean {

	/**
	 * For Serialize.
	 */
	private static final long serialVersionUID = 5562208937407153456L;

	/**
	 * For Logging.
	 */
	@SuppressWarnings("unused")
	private final Logger logger = new LoggerImpl(getClass());

	/**
	 * En l'absence de Dao et de Ldap, on constitue ici une liste... limitee de
	 * fait a l'utilisateur courant.
	 */
	private List<User> users;
	
	@Inject
	@Named("restTemplate")
	private RestTemplate restTemplate;
	
	@Autowired
	private String caslogin_url;
        
    @Autowired
	private String muscade_url; 
    
    @Autowired
	private String muscade_url_ext;     

    @Autowired
    private String exercice_debut;
    
    @Autowired
    private String affiche_convention;
    
    @Autowired
    private String auth_param;
    
    @Autowired
    private String auth_param_ticket;
    
    @Autowired
    private String connection_mode;
    
    @Autowired
    private String exercice_list;
    
    @Autowired
    private String ub_list;
    
    @Autowired
    private String etablissement_list;
    
    @Autowired
    private String cr_list;
    
    @Autowired
    private String souscr_list;
    
    @Autowired
    private String convention_list;
    
    @Autowired
    private String depense_details_list;
    
    @Autowired
    private String depense_mandat_list;
    
    @Autowired
    private String depense_synthese_list;
    
    @Autowired
    private String recette_details_list;
    
    @Autowired
    private String recette_synthese_list;
    
    @Autowired
    private String recette_titres_list;
    
    @Autowired
    private String reste_engage_list;
    
    @Autowired
    private String depense_details_count;
    
    @Autowired
    private String depense_mandat_count;
    
    @Autowired
    private String depense_synthese_count;
    
    @Autowired
    private String recette_details_count;
    
    @Autowired
    private String recette_synthese_count;
    
    @Autowired
    private String recette_titres_count;
    
    @Autowired
    private String reste_engage_count;
    
    @Autowired
    private String test_droit_list;
    
    @Autowired
    private String service;
    
	/**
	 * Constructor.
	 */
	public DomainServiceImpl() {
		super();
		users = new ArrayList<User>();
	}

	@Override
	public void afterPropertiesSet() throws Exception {
		// nothing to do yet.
	}

	@Override
	public User getUser(String uid) {
		User user = null;
		for (User userInList : users) {
			if (userInList.getLogin().equals(uid)) {
				user = userInList;
				break;
			}
		}
		if (user == null) {
			user = new User();
			user.setLogin(uid);
			// On cree l'utilisateur, son nom complet prend la valeur de
			// l'Uid.
			user.setDisplayName(uid);
			user.setLanguage("fr");
			users.add(user);
		}
		return user;
	}
	
	@Override
    public List<Exercice> getListeExercices(String muscadeUrl,String token,String debut) {       	

		String parametres = "cktlrestauthkey="+token;
		if( debut != "") parametres += "&exercice.debut="+debut;
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_XML);
		HttpEntity<String> entity = new HttpEntity<String>(headers);
		restTemplate = new RestTemplate();
		ResponseEntity<ExercicesList> response = restTemplate.exchange(muscadeUrl+getExercice_list()+parametres, 
		HttpMethod.GET, entity, ExercicesList.class);
		List<Exercice> liste_exercice = response.getBody().getExercices();

        return liste_exercice;
    }
	
	
	@Override
    public List<UB> getListeUB(String exercice, String etablissement, String muscadeUrl,String token) {       	
		
		String parametres = "cktlrestauthkey="+token+"&exercice.id="+exercice+"&organigramme_etab.id="+etablissement;
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_XML);
		HttpEntity<String> entity = new HttpEntity<String>(headers);
		restTemplate = new RestTemplate();
		ResponseEntity<UBList> response = restTemplate.exchange(muscadeUrl+getUb_list()+parametres, 
		HttpMethod.GET, entity, UBList.class);
		List<UB> liste = response.getBody().getUB();
		
        return liste;
    }
	
	@Override
    public List<Etablissement> getListeEtablissements(String exercice, String muscadeUrl, String token) {  
		
		String parametres = "cktlrestauthkey="+token+"&exercice.id="+exercice;
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_XML);
		HttpEntity<String> entity = new HttpEntity<String>(headers);
		restTemplate = new RestTemplate();
		ResponseEntity<EtablissementsList> response = restTemplate.exchange(muscadeUrl+getEtablissement_list()+parametres, 
		HttpMethod.GET, entity, EtablissementsList.class);
		List<Etablissement> liste = response.getBody().getEtablissements();
		
        return liste;
    }

	@Override
	public List<CR> getListeCR(String exercice, String ub, String muscadeUrl,
			String token) {
		
		String parametres = "cktlrestauthkey="+token+"&exercice.id="+exercice+"&organigramme_ub.id="+ub;
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_XML);
		HttpEntity<String> entity = new HttpEntity<String>(headers);
		restTemplate = new RestTemplate();
		ResponseEntity<CRList> response = restTemplate.exchange(muscadeUrl+getCr_list()+parametres, 
		HttpMethod.GET, entity, CRList.class);
		List<CR> liste = response.getBody().getCR();
		
        return liste;
	}

	@Override
	public List<SousCR> getListeSousCR(String exercice, String cr, String muscadeUrl,
			String token) {
		
		String parametres = "cktlrestauthkey="+token+"&exercice.id="+exercice+"&organigramme_cr.id="+cr;
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_XML);
		HttpEntity<String> entity = new HttpEntity<String>(headers);
		restTemplate = new RestTemplate();
		ResponseEntity<SousCRList> response = restTemplate.exchange(muscadeUrl+getSouscr_list()+parametres, 
		HttpMethod.GET, entity, SousCRList.class);
		List<SousCR> liste = response.getBody().getSousCR();
		
        return liste;
	}

	@Override
	public List<Convention> getListeConvention(String exercice, String organigramme, String muscadeUrl,
			String token) {
		
		String parametres = "cktlrestauthkey="+token+"&exercice.id="+exercice+"&organigramme.id="+organigramme;
				
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_XML);
		HttpEntity<String> entity = new HttpEntity<String>(headers);
		restTemplate = new RestTemplate();
		ResponseEntity<ConventionsList> response = restTemplate.exchange(muscadeUrl+getConvention_list()+parametres, 
		HttpMethod.GET, entity, ConventionsList.class);
		List<Convention> liste = response.getBody().getConventions();
		
        return liste;
	}

	@Override
	public List<DepenseDetails> getListeDepenseDetail(String convention,
			String exercice, String numeropage, String organigramme,
			String sousniveaux, String muscadeUrl, String token, String taille) {
		
		String parametres = "exercice.id="+exercice+"&organigramme.id="+organigramme+"&cktlrestauthkey="+token;
		
		if( sousniveaux != "") parametres += "&inclure.sousniveaux="+sousniveaux;
		if( convention != "") parametres += "&convention.id="+convention;
		if( numeropage != "") parametres += "&page.num="+numeropage;
		if( taille != "") parametres += "&page.size="+taille;
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_XML);
		HttpEntity<String> entity = new HttpEntity<String>(headers);
		restTemplate = new RestTemplate();
		ResponseEntity<DepenseDetailsList> response = restTemplate.exchange(muscadeUrl+getDepense_details_list()+parametres, 
		HttpMethod.GET, entity, DepenseDetailsList.class);
		List<DepenseDetails> liste = response.getBody().getDepenseDetails();
		
        return liste;
		
	}

	@Override
	public List<DepenseMandats> getListeDepenseMandats(String convention,
			String exercice, String numeropage, String organigramme,
			String sousniveaux, String typecredit, String muscadeUrl,
			String token, String taille, String colonne, String sens, String credit, String salaire) {
		
		String parametres = "exercice.id="+exercice+"&organigramme.id="+organigramme+"&cktlrestauthkey="+token+"&typeCredit.id="+typecredit;
		String depensemandats = "";
		
		if( sousniveaux != "") parametres += "&inclure.sousniveaux="+sousniveaux;
		if( convention != "") parametres += "&convention.id="+convention;
		if( numeropage != "") parametres += "&page.num="+numeropage;
		if( taille != "") parametres += "&page.size="+taille;
		if( colonne != "") parametres += "&ordre.colonne="+colonne;
		if( sens != "") parametres += "&ordre.sens="+sens;
		
		if(salaire != "") salaire = "."+salaire;

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_XML);
		HttpEntity<String> entity = new HttpEntity<String>(headers);
		restTemplate = new RestTemplate();
		ResponseEntity<DepenseMandatsList> response = restTemplate.exchange(muscadeUrl+getDepense_mandat_list()+salaire+"/list.xml?"+parametres, 
		HttpMethod.GET, entity, DepenseMandatsList.class);
		List<DepenseMandats> liste = response.getBody().getDepenseMandats();
		
        return liste;
		
	}
	

	@Override
	public List<DepenseSynthese> getListeDepenseSynthese(String convention,
			String exercice, String numeropage, String organigramme,
			String sousniveaux, String muscadeUrl, String token, String taille) {

		String parametres = "exercice.id="+exercice+"&organigramme.id="+organigramme+"&cktlrestauthkey="+token;
		
		if( sousniveaux != "") parametres += "&inclure.sousniveaux="+sousniveaux;
		if( convention != "") parametres += "&convention.id="+convention;
		if( numeropage != "") parametres += "&page.num="+numeropage;
		if( taille != "") parametres += "&page.size="+taille;
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_XML);
		HttpEntity<String> entity = new HttpEntity<String>(headers);
		restTemplate = new RestTemplate();
		ResponseEntity<DepenseSyntheseList> response = restTemplate.exchange(muscadeUrl+getDepense_synthese_list()+parametres, 
		HttpMethod.GET, entity, DepenseSyntheseList.class);
		List<DepenseSynthese> liste = response.getBody().getDepenseSynthese();
		
        return liste;
		
	}

	@Override
	public List<RecetteDetails> getListeRecetteDetails(String convention,
			String exercice, String numeropage, String organigramme,
			String sousniveaux, String muscadeUrl, String token, String taille) {
		
		String parametres = "exercice.id="+exercice+"&organigramme.id="+organigramme+"&cktlrestauthkey="+token;
		
		if( sousniveaux != "") parametres += "&inclure.sousniveaux="+sousniveaux;
		if( convention != "") parametres += "&convention.id="+convention;
		if( numeropage != "") parametres += "&page.num="+numeropage;
		if( taille != "") parametres += "&page.size="+taille;
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_XML);
		HttpEntity<String> entity = new HttpEntity<String>(headers);
		restTemplate = new RestTemplate();
		ResponseEntity<RecetteDetailsList> response = restTemplate.exchange(muscadeUrl+getRecette_details_list()+parametres, 
		HttpMethod.GET, entity, RecetteDetailsList.class);
		List<RecetteDetails> liste = response.getBody().getRecetteDetails();
		
        return liste;
	}

	@Override
	public List<RecetteSynthese> getListeRecetteSynthese(String convention,
			String exercice, String numeropage, String organigramme,
			String sousniveaux, String muscadeUrl, String token, String taille) {
		
		String parametres = "exercice.id="+exercice+"&organigramme.id="+organigramme+"&cktlrestauthkey="+token;
		
		if( sousniveaux != "") parametres += "&inclure.sousniveaux="+sousniveaux;
		if( convention != "") parametres += "&convention.id="+convention;
		if( numeropage != "") parametres += "&page.num="+numeropage;
		if( taille != "") parametres += "&page.size="+taille;
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_XML);
		HttpEntity<String> entity = new HttpEntity<String>(headers);
		restTemplate = new RestTemplate();
		ResponseEntity<RecetteSyntheseList> response = restTemplate.exchange(muscadeUrl+getRecette_synthese_list()+parametres, 
		HttpMethod.GET, entity, RecetteSyntheseList.class);
		List<RecetteSynthese> liste = response.getBody().getRecetteSynthese();
		
        return liste;
		
	}
	
	@Override
	public List<RecetteTitres> getListeRecetteTitres(String convention,
			String exercice, String numeropage, String organigramme,
			String sousniveaux, String credits, String muscadeUrl,
			String token, String taille, String libelle_credit, String salaire, String colonne, String sens) {
		
		String parametres = "exercice.id="+exercice+"&organigramme.id="+organigramme+"&cktlrestauthkey="+token+"&typeCredit.id="+credits;
		String depensemandats = "";
		
		if( sousniveaux != "") parametres += "&inclure.sousniveaux="+sousniveaux;
		if( convention != "") parametres += "&convention.id="+convention;
		if( numeropage != "") parametres += "&page.num="+numeropage;
		if( taille != "") parametres += "&page.size="+taille;
		if( colonne != "") parametres += "&ordre.colonne="+colonne;
		if( sens != "") parametres += "&ordre.sens="+sens;
		if( libelle_credit != "") parametres += "&libelle_credit="+libelle_credit;
		if(salaire != "") salaire = "."+salaire;

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_XML);
		HttpEntity<String> entity = new HttpEntity<String>(headers);
		restTemplate = new RestTemplate();
		ResponseEntity<RecetteTitresList> response = restTemplate.exchange(muscadeUrl+getRecette_titres_list()+salaire+parametres, 
		HttpMethod.GET, entity, RecetteTitresList.class);
		List<RecetteTitres> liste = response.getBody().getRecetteTitres();
		
        return liste;
		
	}

	

	@Override
	public List<ResteEngage> getListeResteEngage(String convention,
			String exercice, String numeropage, String organigramme,
			String sousniveaux, String typecredit, String muscadeUrl,
			String token, String taille, String colonne, String sens) {
		
		String parametres = "exercice.id="+exercice+"&organigramme.id="+organigramme+"&cktlrestauthkey="+token+"&typeCredit.id="+typecredit;
		
		if( sousniveaux != "") parametres += "&inclure.sousniveaux="+sousniveaux;
		if( convention != "") parametres += "&convention.id="+convention;
		if( numeropage != "") parametres += "&page.num="+numeropage;
		if( taille != "") parametres += "&page.size="+taille;
		if( colonne != "") parametres += "&ordre.colonne="+colonne;
		if( sens != "") parametres += "&ordre.sens="+sens;
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_XML);
		HttpEntity<String> entity = new HttpEntity<String>(headers);
		restTemplate = new RestTemplate();
		ResponseEntity<ResteEngageList> response = restTemplate.exchange(muscadeUrl+getReste_engage_list()+parametres, 
		HttpMethod.GET, entity, ResteEngageList.class);
		List<ResteEngage> liste = response.getBody().getResteEngage();
		
        return liste;
		
	}
	
	
	/********** ***********/
	
	@Override
	public Integer getCountDepenseDetail(String convention,
			String exercice, String numeropage, String organigramme,
			String sousniveaux, String muscadeUrl, String token) {
		
		String parametres = "exercice.id="+exercice+"&organigramme.id="+organigramme+"&cktlrestauthkey="+token;
		
		if( sousniveaux != "") parametres += "&inclure.sousniveaux="+sousniveaux;
		if( convention != "") parametres += "&convention.id="+convention;
		if( numeropage != "") parametres += "&page.num="+numeropage;
		
		RestTemplate template = new RestTemplate();

		String comptage = template.getForObject(muscadeUrl+getDepense_details_count()+parametres, String.class); 
		Integer count = Integer.parseInt(comptage.replaceAll("[\r\n]+", ""));
	   	
        return count;		
	}
	
	@Override
	public Integer getCountDepenseMandats(String convention,
			String exercice, String numeropage, String organigramme,
			String sousniveaux, String typecredit, String muscadeUrl,
			String token, String credit, String salaire) {
		
		String parametres = "exercice.id="+exercice+"&organigramme.id="+organigramme+"&cktlrestauthkey="+token+"&typeCredit.id="+typecredit;
		String depensemandats = "";
		
		if( sousniveaux != "") parametres += "&inclure.sousniveaux="+sousniveaux;
		if( convention != "") parametres += "&convention.id="+convention;
		if( numeropage != "") parametres += "&page.num="+numeropage;
		
		RestTemplate template = new RestTemplate();
		
		if(salaire != "") salaire = "."+salaire;
		
	   	String comptage = template.getForObject(muscadeUrl+getDepense_mandat_count()+salaire+"/count.json?"+parametres, String.class);
	   	Integer count = Integer.parseInt(comptage.replaceAll("[\r\n]+", ""));
	   	
        return count;
		
	}

	@Override
	public Integer getCountDepenseSynthese(String convention,
			String exercice, String numeropage, String organigramme,
			String sousniveaux, String muscadeUrl, String token) {

		String parametres = "exercice.id="+exercice+"&organigramme.id="+organigramme+"&cktlrestauthkey="+token;
		
		if( sousniveaux != "") parametres += "&inclure.sousniveaux="+sousniveaux;
		if( convention != "") parametres += "&convention.id="+convention;
		if( numeropage != "") parametres += "&page.num="+numeropage;
		
		RestTemplate template = new RestTemplate();

		String comptage = template.getForObject(muscadeUrl+getDepense_synthese_count()+parametres, String.class);
		Integer count = Integer.parseInt(comptage);
	   	
        return count;		
	}

	@Override
	public Integer getCountRecetteDetails(String convention,
			String exercice, String numeropage, String organigramme,
			String sousniveaux, String muscadeUrl, String token) {
		
		String parametres = "exercice.id="+exercice+"&organigramme.id="+organigramme+"&cktlrestauthkey="+token;
		
		if( sousniveaux != "") parametres += "&inclure.sousniveaux="+sousniveaux;
		if( convention != "") parametres += "&convention.id="+convention;
		if( numeropage != "") parametres += "&page.num="+numeropage;
		
		RestTemplate template = new RestTemplate();

		String comptage = template.getForObject(muscadeUrl+getRecette_details_count()+parametres, String.class); 
		Integer count = Integer.parseInt(comptage.replaceAll("[\r\n]+", ""));
	   	
        return count;
	}

	@Override
	public Integer getCountRecetteSynthese(String convention,
			String exercice, String numeropage, String organigramme,
			String sousniveaux, String muscadeUrl, String token) {
		
		String parametres = "exercice.id="+exercice+"&organigramme.id="+organigramme+"&cktlrestauthkey="+token;
		
		if( sousniveaux != "") parametres += "&inclure.sousniveaux="+sousniveaux;
		if( convention != "") parametres += "&convention.id="+convention;
		if( numeropage != "") parametres += "&page.num="+numeropage;
		
		RestTemplate template = new RestTemplate();
		
		String comptage = template.getForObject(muscadeUrl+getRecette_synthese_count()+parametres, String.class); 
		Integer count = Integer.parseInt(comptage);
	   	
        return count;		
	}

	@Override
	public Integer getCountResteEngage(String convention,
			String exercice, String numeropage, String organigramme,
			String sousniveaux, String typecredit, String muscadeUrl,
			String token) {
		
		String parametres = "exercice.id="+exercice+"&organigramme.id="+organigramme+"&cktlrestauthkey="+token+"&typeCredit.id="+typecredit;
		
		if( sousniveaux != "") parametres += "&inclure.sousniveaux="+sousniveaux;
		if( convention != "") parametres += "&convention.id="+convention;
		if( numeropage != "") parametres += "&page.num="+numeropage;
		
		RestTemplate template = new RestTemplate();

		String comptage = template.getForObject(muscadeUrl+getReste_engage_count()+parametres, String.class); 
		Integer count = Integer.parseInt(comptage.replaceAll("[\r\n]+", ""));
	   	
        return count;		
	}
	
	@Override
	public Integer getCountRecetteTitres(String convention,
			String exercice, String numeropage, String organigramme,
			String sousniveaux, String credits, String muscadeUrl,
			String token, String taille, String libelle_credit, String salaire) {
		
		String parametres = "exercice.id="+exercice+"&organigramme.id="+organigramme+"&cktlrestauthkey="+token+"&typeCredit.id="+credits;
				
		if( sousniveaux != "") parametres += "&inclure.sousniveaux="+sousniveaux;
		if( convention != "") parametres += "&convention.id="+convention;
		if( numeropage != "") parametres += "&page.num="+numeropage;
		if( taille != "") parametres += "&page.size="+taille;
		//if( colonne != "") parametres += "&ordre.colonne="+colonne;
		//if( sens != "") parametres += "&ordre.sens="+sens;
		if( libelle_credit != "") parametres += "&libelle_credit="+libelle_credit;
		if(salaire != "") salaire = "."+salaire;

		RestTemplate template = new RestTemplate();
		
		String comptage = template.getForObject(muscadeUrl+getRecette_titres_count()+parametres, String.class); 
		Integer count = Integer.parseInt(comptage.replaceAll("[\r\n]+", ""));
	   	
        return count;			
	}
	

	public boolean getTestDroit(String muscadeUrl,
			String token) {
		
		String parametres = "&cktlrestauthkey="+token;
		boolean ok = true;
		
		RestTemplate template = new RestTemplate();

		String test = "";
		
		try {            
            test = template.getForObject(muscadeUrl+getTest_droit_list()+parametres, String.class); 
    	} 
        catch (RestClientException ex) {
        	ok = false;		
    	}
		
        return ok;		
	}

	public void setCaslogin_url(String caslogin_url) {
		this.caslogin_url = caslogin_url;
	}

	public String getCaslogin_url() {
		return caslogin_url;
	}

	public void setMuscade_url(String muscade_url) {
		this.muscade_url = muscade_url;
	}

	public String getMuscade_url() {
		return muscade_url;
	}
	
	public void setMuscade_url_ext(String muscade_url_ext) {
		this.muscade_url_ext= muscade_url_ext;
	}

	public String getMuscade_url_ext() {
		return muscade_url_ext;
	}
	
	/**
	 * @param affiche_convention the affiche_convention to set
	 */
	public void setAffiche_convention(String affiche_convention) {
		this.affiche_convention = affiche_convention;
	}
	
	/* (non-Javadoc)
	 * @see org.esupportail.jefyco.portlet.domain.DomainService#getAffiche_convention()
	 */
	@Override
	public String getAffiche_convention() {
		// TODO Auto-generated method stub
		return affiche_convention;
	}
	
	/**
	 * @param auth_param the auth_param to set
	 */
	public void setAuth_param(String auth_param) {
		this.auth_param = auth_param;
	}
	
	/* (non-Javadoc)
	 * @see org.esupportail.jefyco.portlet.domain.DomainService#getAuth_param()
	 */
	@Override
	public String getAuth_param() {
		// TODO Auto-generated method stub
		return auth_param;
	}
	
	/**
	 * @param auth_param_ticket the auth_param_ticket to set
	 */
	public void setAuth_param_ticket(String auth_param_ticket) {
		this.auth_param_ticket = auth_param_ticket;
	}
	
	/* (non-Javadoc)
	 * @see org.esupportail.jefyco.portlet.domain.DomainService#getAuth_param_ticket()
	 */
	@Override
	public String getAuth_param_ticket() {
		// TODO Auto-generated method stub
		return auth_param_ticket;
	}
	
	public void setExercice_debut(String exercice_debut) {
		this.exercice_debut = exercice_debut;
	}

	public String getExercice_debut() {
		return exercice_debut;
	}
	
	/**
	 * @param connection_mode the connection_mode to set
	 */
	public void setConnection_mode(String connection_mode) {
		this.connection_mode = connection_mode;
	}
	
	/* (non-Javadoc)
	 * @see org.esupportail.jefyco.portlet.domain.DomainService#getConnection_mode()
	 */
	@Override
	public String getConnection_mode() {
		// TODO Auto-generated method stub
		return connection_mode;
	}
	
	/**
	 * @param exercice_list the exercice_list to set
	 */
	public void setExercice_list(String exercice_list) {
		this.exercice_list = exercice_list;
	}

	/* (non-Javadoc)
	 * @see org.esupportail.jefyco.portlet.domain.DomainService#getExercice_list()
	 */
	@Override
	public String getExercice_list() {
		// TODO Auto-generated method stub
		return exercice_list;
	}
	
	/**
	 * @param ub_list the ub_list to set
	 */
	public void setUb_list(String ub_list) {
		this.ub_list = ub_list;
	}

	/* (non-Javadoc)
	 * @see org.esupportail.jefyco.portlet.domain.DomainService#getUb_list()
	 */
	@Override
	public String getUb_list() {
		// TODO Auto-generated method stub
		return ub_list;
	}
	
	/**
	 * @param etablissement_list the etablissement_list to set
	 */
	public void setEtablissement_list(String etablissement_list) {
		this.etablissement_list = etablissement_list;
	}

	/* (non-Javadoc)
	 * @see org.esupportail.jefyco.portlet.domain.DomainService#getEtablissement_list()
	 */
	@Override
	public String getEtablissement_list() {
		// TODO Auto-generated method stub
		return etablissement_list;
	}
	
	/**
	 * @param cr_list the cr_list to set
	 */
	public void setCr_list(String cr_list) {
		this.cr_list = cr_list;
	}

	/* (non-Javadoc)
	 * @see org.esupportail.jefyco.portlet.domain.DomainService#getCr_list()
	 */
	@Override
	public String getCr_list() {
		// TODO Auto-generated method stub
		return cr_list;
	}
	
	/**
	 * @param souscr_list the souscr_list to set
	 */
	public void setSouscr_list(String souscr_list) {
		this.souscr_list = souscr_list;
	}

	/* (non-Javadoc)
	 * @see org.esupportail.jefyco.portlet.domain.DomainService#getSouscr_list()
	 */
	@Override
	public String getSouscr_list() {
		// TODO Auto-generated method stub
		return souscr_list;
	}
	
	/**
	 * @param convention_list the convention_list to set
	 */
	public void setConvention_list(String convention_list) {
		this.convention_list = convention_list;
	}

	/* (non-Javadoc)
	 * @see org.esupportail.jefyco.portlet.domain.DomainService#getConvention_list()
	 */
	@Override
	public String getConvention_list() {
		// TODO Auto-generated method stub
		return convention_list;
	}
	
	/**
	 * @param depense_details_list the depense_details_list to set
	 */
	public void setDepense_details_list(String depense_details_list) {
		this.depense_details_list = depense_details_list;
	}

	/* (non-Javadoc)
	 * @see org.esupportail.jefyco.portlet.domain.DomainService#getDepense_details_list()
	 */
	@Override
	public String getDepense_details_list() {
		// TODO Auto-generated method stub
		return depense_details_list;
	}
	
	/**
	 * @param depense_mandat_list the depense_mandat_list to set
	 */
	public void setDepense_mandat_list(String depense_mandat_list) {
		this.depense_mandat_list = depense_mandat_list;
	}

	/* (non-Javadoc)
	 * @see org.esupportail.jefyco.portlet.domain.DomainService#getDepense_mandat_list()
	 */
	@Override
	public String getDepense_mandat_list() {
		// TODO Auto-generated method stub
		return depense_mandat_list;
	}
	
	/**
	 * @param depense_synthese_list the depense_synthese_list to set
	 */
	public void setDepense_synthese_list(String depense_synthese_list) {
		this.depense_synthese_list = depense_synthese_list;
	}

	/* (non-Javadoc)
	 * @see org.esupportail.jefyco.portlet.domain.DomainService#getDepense_synthese_list()
	 */
	@Override
	public String getDepense_synthese_list() {
		// TODO Auto-generated method stub
		return depense_synthese_list;
	}
	
	/**
	 * @param recette_details_list the recette_details_list to set
	 */
	public void setRecette_details_list(String recette_details_list) {
		this.recette_details_list = recette_details_list;
	}

	/* (non-Javadoc)
	 * @see org.esupportail.jefyco.portlet.domain.DomainService#getRecette_details_list()
	 */
	@Override
	public String getRecette_details_list() {
		// TODO Auto-generated method stub
		return recette_details_list;
	}
	
	/**
	 * @param recette_synthese_list the recette_synthese_list to set
	 */
	public void setRecette_synthese_list(String recette_synthese_list) {
		this.recette_synthese_list = recette_synthese_list;
	}

	/* (non-Javadoc)
	 * @see org.esupportail.jefyco.portlet.domain.DomainService#getRecette_synthese_list()
	 */
	@Override
	public String getRecette_synthese_list() {
		// TODO Auto-generated method stub
		return recette_synthese_list;
	}
	
	/**
	 * @param reste_engage_list the reste_engage_list to set
	 */
	public void setReste_engage_list(String reste_engage_list) {
		this.reste_engage_list = reste_engage_list;
	}

	/* (non-Javadoc)
	 * @see org.esupportail.jefyco.portlet.domain.DomainService#getReste_engage_list()
	 */
	@Override
	public String getReste_engage_list() {
		// TODO Auto-generated method stub
		return reste_engage_list;
	}
	
	/**
	 * @param depense_details_count the depense_details_count to set
	 */
	public void setDepense_details_count(String depense_details_count) {
		this.depense_details_count = depense_details_count;
	}

	/* (non-Javadoc)
	 * @see org.esupportail.jefyco.portlet.domain.DomainService#getDepense_details_count()
	 */
	@Override
	public String getDepense_details_count() {
		// TODO Auto-generated method stub
		return depense_details_count;
	}
	
	/**
	 * @param depense_mandat_count the depense_mandat_count to set
	 */
	public void setDepense_mandat_count(String depense_mandat_count) {
		this.depense_mandat_count = depense_mandat_count;
	}

	/* (non-Javadoc)
	 * @see org.esupportail.jefyco.portlet.domain.DomainService#getDepense_mandat_count()
	 */
	@Override
	public String getDepense_mandat_count() {
		// TODO Auto-generated method stub
		return depense_mandat_count;
	}
	
	/**
	 * @param depense_synthese_count the depense_synthese_count to set
	 */
	public void setDepense_synthese_count(String depense_synthese_count) {
		this.depense_synthese_count = depense_synthese_count;
	}

	/* (non-Javadoc)
	 * @see org.esupportail.jefyco.portlet.domain.DomainService#getDepense_synthese_count()
	 */
	@Override
	public String getDepense_synthese_count() {
		// TODO Auto-generated method stub
		return depense_synthese_count;
	}
	
	/**
	 * @param recette_details_count the recette_details_count to set
	 */
	public void setRecette_details_count(String recette_details_count) {
		this.recette_details_count = recette_details_count;
	}

	/* (non-Javadoc)
	 * @see org.esupportail.jefyco.portlet.domain.DomainService#getRecette_details_count()
	 */
	@Override
	public String getRecette_details_count() {
		// TODO Auto-generated method stub
		return recette_details_count;
	}
	
	/**
	 * @param recette_titres_count the recette_titres_count to set
	 */
	public void setRecette_titres_count(String recette_titres_count) {
		this.recette_titres_count = recette_titres_count;
	}

	/* (non-Javadoc)
	 * @see org.esupportail.jefyco.portlet.domain.DomainService#getRecette_titres_count()
	 */
	@Override
	public String getRecette_titres_count() {
		// TODO Auto-generated method stub
		return recette_titres_count;
	}
	
	/* (non-Javadoc)
	 * @see org.esupportail.jefyco.portlet.domain.DomainService#getRecette_details_count()
	 */
	@Override
	public String getRecette_titres_list() {
		return recette_titres_list;
	}

	public void setRecette_titres_list(String recette_titres_list) {
		this.recette_titres_list = recette_titres_list;
	}
	
	/**
	 * @param recette_synthese_count the recette_synthese_count to set
	 */
	public void setRecette_synthese_count(String recette_synthese_count) {
		this.recette_synthese_count = recette_synthese_count;
	}

	/* (non-Javadoc)
	 * @see org.esupportail.jefyco.portlet.domain.DomainService#getRecette_synthese_count()
	 */
	@Override
	public String getRecette_synthese_count() {
		// TODO Auto-generated method stub
		return recette_synthese_count;
	}
	
	/**
	 * @param reste_engage_count the reste_engage_count to set
	 */
	public void setReste_engage_count(String reste_engage_count) {
		this.reste_engage_count = reste_engage_count;
	}

	/* (non-Javadoc)
	 * @see org.esupportail.jefyco.portlet.domain.DomainService#getReste_engage_count()
	 */
	@Override
	public String getReste_engage_count() {
		// TODO Auto-generated method stub
		return reste_engage_count;
	}
	
	/**
	 * @param test_droit_list the test_droit_list to set
	 */
	public void setTest_droit_list(String test_droit_list) {
		this.test_droit_list = test_droit_list;
	}

	/* (non-Javadoc)
	 * @see org.esupportail.jefyco.portlet.domain.DomainService#getTest_droit_list()
	 */
	@Override
	public String getTest_droit_list() {
		// TODO Auto-generated method stub
		return test_droit_list;
	}
	
	public void setService(String service) {
		this.service = service;
	}

	public String getService() {
		return service;
	}

}
