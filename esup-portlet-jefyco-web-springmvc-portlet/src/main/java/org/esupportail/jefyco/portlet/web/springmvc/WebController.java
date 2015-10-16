package org.esupportail.jefyco.portlet.web.springmvc;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

import org.jasig.cas.client.validation.Assertion;
import org.jasig.cas.client.validation.TicketValidationException;
import org.jasig.cas.client.validation.TicketValidator;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import javax.faces.context.FacesContext;
import javax.portlet.PortletPreferences;
import javax.portlet.PortletRequest;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.esupportail.jefyco.portlet.domain.DomainService;
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
import org.esupportail.jefyco.portlet.domain.beans.SearchForm;
import org.esupportail.jefyco.portlet.domain.beans.SousCR;
import org.esupportail.jefyco.portlet.domain.beans.UB;
import org.esupportail.jefyco.portlet.domain.beans.User;
import org.esupportail.jefyco.portlet.services.auth.Authenticator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.client.RestTemplate;
import org.esupportail.commons.services.cas.CasException;
import org.esupportail.commons.services.cas.CasService;
import org.esupportail.commons.services.logging.Logger;
import org.esupportail.commons.services.logging.LoggerImpl;
import org.esupportail.commons.utils.ContextUtils;
import org.apache.myfaces.trinidad.util.ExternalContextUtils;


@Controller
@SessionAttributes("searchForm")
public class WebController extends AbastractExceptionController {
    
    private static final String PREF_NB_PAR_PAGE = "nb_par_page";
    
    private static final String PREF_MSG_ERR_AUTH = "message_erreur_authentification";
    
    private static final String PREF_EMAIL = "email_contact";
    
    public String token = "";
    
    public String anneeCourante = "";
    
    public String muscade_url = "";
    
    public String muscade_url_ext = "";
    
    public String service = "";
    
    public String caslogin_url = "";  
    
    public String nb_par_page = "";
    
    public String message_erreur_authentification = "";
    
    public String email_contact = "";
    
    public String org = "";
    
    public String sousniveaux = "";   
    
    public String exercice_debut = "";
    
    /**
     * Ajout UTT
     */
    private String affiche_convention = "";
    
    private String auth_param = "";
    
    private String auth_param_ticket = "";
    
    private String connection_mode = "";
    /** Fin UTT **/
    	
    @Autowired
	private Authenticator authenticator;
    
    @Autowired
    private DomainService domainService;
    
    @Autowired
    private TicketValidator ticketValidator;    
    
    @Autowired
    private CasService casService;
    
    @SuppressWarnings("unused")
	private final Logger logger = new LoggerImpl(getClass());
    
    @RequestMapping("VIEW")
    protected ModelAndView renderView(RenderRequest request, RenderResponse response,@ModelAttribute("searchForm") SearchForm searchForm) throws Exception {
        
    	String re = "";
    	ModelMap model = new ModelMap();
    	final PortletPreferences prefs = request.getPreferences();
    	
    	caslogin_url = domainService.getCaslogin_url();
    	muscade_url = domainService.getMuscade_url();
    	muscade_url_ext = domainService.getMuscade_url_ext();
    	exercice_debut = domainService.getExercice_debut();
    	affiche_convention = domainService.getAffiche_convention();
    	auth_param = domainService.getAuth_param();
    	auth_param_ticket = domainService.getAuth_param_ticket();
    	connection_mode = domainService.getConnection_mode();
    	service = domainService.getService();
    	
    	try {
    		logger.debug(connection_mode+request.getServerName()+request.getContextPath());
    		Assertion assertion = getAssertion(request, connection_mode+request.getServerName()+request.getContextPath());
    		re = assertion.getPrincipal().getProxyTicketFor(muscade_url+auth_param);
    		logger.debug("Proxy Ticket : "+re);
    	} catch (TicketValidationException e) {
    		logger.error("fail to validate a ticket");
    		throw new RuntimeException(e);
    	}
    	
    	token = getToken(re);    	
    	
    	if(formulaire(request, searchForm, response, model, token) == true){
    	
	    	List<DepenseSynthese> listeDepenseSyntheses;
	        List<RecetteSynthese> listeRecetteSyntheses;
		 	
		 	if(searchForm.getExercice() != "" && searchForm.getEtablissement() != "" && searchForm.getUB() != "" && searchForm.getExercice() != null && searchForm.getEtablissement() != null && searchForm.getUB() != null){
	   	 		org =  searchForm.getUB();
	   	 		String conv = "";
	   	 		sousniveaux = "0";

	   	 		if(searchForm.getCR() != "" && searchForm.getCR() != null) org =  searchForm.getCR();
	   	 		if(searchForm.getSousCR() != "" && searchForm.getSousCR() != null) org =  searchForm.getSousCR();
	   	 		if(searchForm.getConvention() != "" && searchForm.getConvention() != null) conv =  searchForm.getConvention();
	   	 		if(searchForm.getSousniveaux() != "" && searchForm.getSousniveaux() != null) sousniveaux =  searchForm.getSousniveaux();
	   	 	
		   	 	listeDepenseSyntheses = (this.domainService.getListeDepenseSynthese(conv, searchForm.getExercice(), "", org, sousniveaux, muscade_url_ext,token,nb_par_page));   	      
		 	 	model.put("listeDepenseSyntheses", listeDepenseSyntheses);
	
		 	 	listeRecetteSyntheses = (this.domainService.getListeRecetteSynthese(conv, searchForm.getExercice(), "", org, sousniveaux, muscade_url_ext,token,nb_par_page));   	      
		 	 	model.put("listeRecetteSyntheses", listeRecetteSyntheses);   		 	 	
		 	 	
	   	 	}
		 	return new ModelAndView("view", model);
    	}else{
    		return new ModelAndView("viewErreur", model);
    	}
    }
    
    
    @RequestMapping(value="VIEW",params="action=affichageDR")
    protected ModelAndView renderViewAffichageDR(RenderRequest request, @ModelAttribute("searchForm") SearchForm searchForm,   RenderResponse response) throws Exception {
    	
    	ModelMap model = new ModelMap();
    	
    	if(formulaire(request, searchForm, response, model, token) == true){
    	
    	List<DepenseSynthese> listeDepenseSyntheses;
        List<RecetteSynthese> listeRecetteSyntheses;
   	 	
   	 	if(searchForm.getExercice() != "" && searchForm.getEtablissement() != "" && searchForm.getUB() != "" && searchForm.getExercice() != null && searchForm.getEtablissement() != null && searchForm.getUB() != null){
   	 		org =  searchForm.getUB();
   	 		String conv = "";
   	 		sousniveaux = "0";

   	 		if(searchForm.getCR() != "" && searchForm.getCR() != null) org =  searchForm.getCR();
   	 		if(searchForm.getSousCR() != "" && searchForm.getSousCR() != null) org =  searchForm.getSousCR();
   	 		if(searchForm.getConvention() != "" && searchForm.getConvention() != null) conv =  searchForm.getConvention();
   	 		if(searchForm.getSousniveaux() != "" && searchForm.getSousniveaux() != null) sousniveaux =  searchForm.getSousniveaux();
   	 	
	   	 	listeDepenseSyntheses = (this.domainService.getListeDepenseSynthese(conv, searchForm.getExercice(), "", org, sousniveaux, muscade_url_ext,token,nb_par_page));   	      
	 	 	model.put("listeDepenseSyntheses", listeDepenseSyntheses);

	 	 	listeRecetteSyntheses = (this.domainService.getListeRecetteSynthese(conv, searchForm.getExercice(), "", org, sousniveaux, muscade_url_ext,token,nb_par_page));   	      
	 	 	model.put("listeRecetteSyntheses", listeRecetteSyntheses);   
	 	 	
	 	 	model.put("ongletC", "DR"); 
   	 	}
   	 		return new ModelAndView("viewDR", model);
    	}else{
    		return new ModelAndView("viewErreur", model);
    	}
    }
    
    @RequestMapping(value="VIEW",params="action=affichageD")	
   	 protected ModelAndView renderViewAffichageD(RenderRequest request, @ModelAttribute("searchForm") SearchForm searchForm,   RenderResponse response,@RequestParam("page") String page) throws Exception {
     	
     	ModelMap model = new ModelMap();
     	int nb = 0;
     	double nb_pages = 0;
     	if(page == null || page == "0" || page == "") page = "1";
     	
     	formulaire(request, searchForm, response, model, token);
     	
     	List<DepenseDetails> listeDepenseDetails;     	
    	 	
	 	if(searchForm.getExercice() != "" && searchForm.getEtablissement() != "" && searchForm.getUB() != "" && searchForm.getExercice() != null && searchForm.getEtablissement() != null && searchForm.getUB() != null){
	 		org =  searchForm.getUB();
	 		String conv = "";
	 		sousniveaux = "0";
	 		if(searchForm.getCR() != "" && searchForm.getCR() != null) org =  searchForm.getCR();
	 		if(searchForm.getSousCR() != "" && searchForm.getSousCR() != null) org =  searchForm.getSousCR();
	 		if(searchForm.getConvention() != "" && searchForm.getConvention() != null) conv =  searchForm.getConvention();
	 		if(searchForm.getSousniveaux() != "" && searchForm.getSousniveaux() != null) sousniveaux =  searchForm.getSousniveaux();
	 		
 			nb = (this.domainService.getCountDepenseDetail(conv, searchForm.getExercice(), "", org, sousniveaux, muscade_url_ext,token));
	 		
	 		if(nb_par_page != "" && nb_par_page != "0"){
	 			nb_pages = Math.ceil((float)nb / (float)Integer.parseInt(nb_par_page));
	 			listeDepenseDetails = (this.domainService.getListeDepenseDetail(conv, searchForm.getExercice(), page, org, sousniveaux, muscade_url_ext,token,nb_par_page));
	 		}else{
	 			listeDepenseDetails = (this.domainService.getListeDepenseDetail(conv, searchForm.getExercice(), "", org, sousniveaux, muscade_url_ext,token,""));
	 		}	 			 		   	      
	 		
	 		model.put("listeDepenseDetails", listeDepenseDetails);
	 		model.put("nb_pages", nb_pages); 
	 		model.put("pageC", Integer.parseInt(page)); 
	 		model.put("ongletC", "D");
	 		model.put("nb", nb);
	 		model.put("organigramme", org); 
	 	}

   	 return new ModelAndView("viewD", model);
    }

    @RequestMapping(value="VIEW",params="action=affichageR")	
  	 protected ModelAndView renderViewAffichageR(RenderRequest request, @ModelAttribute("searchForm") SearchForm searchForm,   RenderResponse response,@RequestParam("page") String page) throws Exception {
    	
    	ModelMap model = new ModelMap();
    	int nb = 0;
    	double nb_pages = 0;
    	if(page == null || page == "0" || page == "") page = "1";
    	
    	formulaire(request, searchForm, response, model, token);
    	
    	List<RecetteDetails> listeRecetteDetails;    	
   	 	
	 	if(searchForm.getExercice() != "" && searchForm.getEtablissement() != "" && searchForm.getUB() != "" && searchForm.getExercice() != null && searchForm.getEtablissement() != null && searchForm.getUB() != null){
	 		org =  searchForm.getUB();
	 		String conv = "";
	 		sousniveaux = "0";
	 		if(searchForm.getCR() != "" && searchForm.getCR() != null) org =  searchForm.getCR();
	 		if(searchForm.getSousCR() != "" && searchForm.getSousCR() != null) org =  searchForm.getSousCR();
	 		if(searchForm.getConvention() != "" && searchForm.getConvention() != null) conv =  searchForm.getConvention();
	 		if(searchForm.getSousniveaux() != "" && searchForm.getSousniveaux() != null) sousniveaux =  searchForm.getSousniveaux();
	 		
 			nb = (this.domainService.getCountRecetteDetails(conv, searchForm.getExercice(), "", org, sousniveaux, muscade_url_ext,token));   	      
	 		
	 		if(nb_par_page != "" && nb_par_page != "0"){
	 			nb_pages = Math.ceil((float)nb / (float)Integer.parseInt(nb_par_page));
	 			listeRecetteDetails = (this.domainService.getListeRecetteDetails(conv, searchForm.getExercice(), page, org, sousniveaux, muscade_url_ext,token,nb_par_page));
	 		}else{
	 			listeRecetteDetails = (this.domainService.getListeRecetteDetails(conv, searchForm.getExercice(), "", org, sousniveaux, muscade_url_ext,token,""));
	 		}

	 		model.put("listeRecetteDetails", listeRecetteDetails);
	 		model.put("nb_pages", nb_pages); 
	 		model.put("pageC", Integer.parseInt(page)); 
	 		model.put("ongletC", "R"); 
	 		model.put("nb", nb);
	 	}

  	 return new ModelAndView("viewR", model);
   }
    
    @RequestMapping(value="VIEW",params="action=detailsDM")	
  	 protected ModelAndView renderViewAffichageDM(RenderRequest request, @ModelAttribute("searchForm") SearchForm searchForm,   RenderResponse response,@RequestParam("page") String page,@RequestParam("credit") String credit,@RequestParam("organigramme") String organigramme,@RequestParam("colonne") String colonne,@RequestParam("sens") String sens,@RequestParam("libelle_credit") String libelle_credit,@RequestParam("ligne_budgetaire") String ligne_budgetaire,@RequestParam("pers") String pers) throws Exception {
    	
    	ModelMap model = new ModelMap();
    	int nb = 0;
    	double nb_pages = 0;
    	if(page == null || page == "0" || page == "") page = "1";
    	
    	formulaire(request, searchForm, response, model, token);
    	
    	List<DepenseMandats> listeDepenseMandats;     	
   	 	
	 		org =  organigramme;
	 		String conv = "";
	 		sousniveaux = "0";
	 		if(searchForm.getConvention() != "" && searchForm.getConvention() != null) conv =  searchForm.getConvention();
	 		if(searchForm.getSousniveaux() != "" && searchForm.getSousniveaux() != null) sousniveaux =  searchForm.getSousniveaux();
	 		
 			nb = (this.domainService.getCountDepenseMandats(conv, searchForm.getExercice(), "", org, sousniveaux, credit, muscade_url_ext,token,libelle_credit,pers));   	      
	 		
	 		if(nb_par_page != "" && nb_par_page != "0"){
	 			nb_pages = Math.ceil((float)nb / (float)Integer.parseInt(nb_par_page));
	 			listeDepenseMandats = (this.domainService.getListeDepenseMandats(conv, searchForm.getExercice(), page, org, sousniveaux, credit, muscade_url_ext,token,nb_par_page,colonne,sens,libelle_credit,pers));   	      
	 		}else{
	 			listeDepenseMandats = (this.domainService.getListeDepenseMandats(conv, searchForm.getExercice(), "", org, sousniveaux, credit, muscade_url_ext,token,"",colonne,sens,libelle_credit,pers));   	      
	 		}
	 		model.put("listeDepenseMandats", listeDepenseMandats);
	 		model.put("nb_pages", nb_pages); 
	 		model.put("pageC", Integer.parseInt(page)); 
	 		model.put("ongletC", "DM");
	 		model.put("organigramme", org);
	 		model.put("credit", credit); 
	 		model.put("colonne", colonne);
	 		model.put("sens", sens);
	 		model.put("libelle_credit", libelle_credit);
	 		model.put("nb", nb);
	 		model.put("ligne_budgetaire", ligne_budgetaire);
	 		model.put("pers", pers);

  	 return new ModelAndView("viewDM", model);
   }
    
    @RequestMapping(value="VIEW",params="action=detailsRE")	
 	 protected ModelAndView renderViewAffichageRE(RenderRequest request, @ModelAttribute("searchForm") SearchForm searchForm,   RenderResponse response,@RequestParam("page") String page,@RequestParam("credit") String credit,@RequestParam("organigramme") String organigramme,@RequestParam("colonne") String colonne,@RequestParam("sens") String sens,@RequestParam("libelle_credit") String libelle_credit,@RequestParam("ligne_budgetaire") String ligne_budgetaire) throws Exception {
   	
   	ModelMap model = new ModelMap();
   	int nb = 0;
   	double nb_pages = 0;
   	if(page == null || page == "0" || page == "") page = "1";
   	
   	formulaire(request, searchForm, response, model, token);
   	
   	List<ResteEngage> listeResteEngage;     	
  	 	
	 	    org =  organigramme;
	 		String conv = "";
	 		sousniveaux = "0";
	 		if(searchForm.getConvention() != "" && searchForm.getConvention() != null) conv =  searchForm.getConvention();
	 		if(searchForm.getSousniveaux() != "" && searchForm.getSousniveaux() != null) sousniveaux =  searchForm.getSousniveaux();

 			nb = (this.domainService.getCountResteEngage(conv, searchForm.getExercice(), "", org, sousniveaux, credit, muscade_url_ext,token));   	      

	 		if(nb_par_page != "" && nb_par_page != "0"){
	 			nb_pages = Math.ceil((float)nb / (float)Integer.parseInt(nb_par_page));
	 			listeResteEngage = (this.domainService.getListeResteEngage(conv, searchForm.getExercice(), page, org, sousniveaux, credit, muscade_url_ext,token,nb_par_page,colonne,sens));   	      
	 		}else{
	 			listeResteEngage = (this.domainService.getListeResteEngage(conv, searchForm.getExercice(), "", org, sousniveaux, credit, muscade_url_ext,token,"",colonne,sens));   	       			
	 		}
	 		model.put("listeResteEngage", listeResteEngage);
	 		model.put("nb_pages", nb_pages); 
	 		model.put("pageC", Integer.parseInt(page)); 
	 		model.put("ongletC", "RE");
	 		model.put("organigramme", org); 
	 		model.put("credit", credit); 
	 		model.put("colonne", colonne);
	 		model.put("sens", sens);
	 		model.put("libelle_credit", libelle_credit);
	 		model.put("nb", nb);
	 		model.put("ligne_budgetaire", ligne_budgetaire);
	 	//}

 	 return new ModelAndView("viewRE", model);
  }
    
    @RequestMapping(value="VIEW",params="action=detailsR")	
 	 protected ModelAndView renderViewAffichageRD(RenderRequest request, @ModelAttribute("searchForm") SearchForm searchForm,   RenderResponse response,@RequestParam("page") String page,@RequestParam("credits") String credits,@RequestParam("organigramme") String organigramme,@RequestParam("colonne") String colonne,@RequestParam("sens") String sens,@RequestParam("libelle_credit") String libelle_credit,@RequestParam("ligne_budgetaire") String ligne_budgetaire,@RequestParam("pers") String pers) throws Exception {
   	
   	ModelMap model = new ModelMap();
   	int nb = 0;
   	double nb_pages = 0;
   	if(page == null || page == "0" || page == "") page = "1";
   	
   	formulaire(request, searchForm, response, model, token);
   	
   	List<RecetteTitres> listeRecetteTitres;     	
  	 	
	 		org =  organigramme;
	 		String conv = "";
	 		sousniveaux = "0";
	 		if(searchForm.getConvention() != "" && searchForm.getConvention() != null) conv =  searchForm.getConvention();
	 		if(searchForm.getSousniveaux() != "" && searchForm.getSousniveaux() != null) sousniveaux =  searchForm.getSousniveaux();
	 			 		
			nb = (this.domainService.getCountRecetteTitres(conv, searchForm.getExercice(), "", org, sousniveaux, credits, muscade_url_ext,token,"",libelle_credit,pers));   	      
	 		
	 		if(nb_par_page != "" && nb_par_page != "0"){
	 			nb_pages = Math.ceil((float)nb / (float)Integer.parseInt(nb_par_page));
	 			listeRecetteTitres = (this.domainService.getListeRecetteTitres(conv, searchForm.getExercice(), page, org, sousniveaux, credits, muscade_url_ext,token,nb_par_page,libelle_credit,pers,colonne,sens));   	      
	 		}else{
	 			listeRecetteTitres = (this.domainService.getListeRecetteTitres(conv, searchForm.getExercice(), "", org, sousniveaux, credits, muscade_url_ext,token,"",libelle_credit,pers,colonne,sens));   	      
	 		}
	 		model.put("listeRecetteTitres", listeRecetteTitres);
	 		model.put("nb_pages", nb_pages); 
	 		model.put("pageC", Integer.parseInt(page)); 
	 		model.put("ongletC", "RD");
	 		model.put("organigramme", org);
	 		model.put("credits", credits); 
	 		model.put("libelle_credit", libelle_credit);
	 		model.put("nb", nb);
	 		model.put("ligne_budgetaire", ligne_budgetaire);
	 		model.put("pers", pers);
	 		model.put("colonne", colonne);
	 		model.put("sens", sens);

 	 return new ModelAndView("viewRD", model);
  }
    
    
    @RequestMapping(value="VIEW",params="action=affichageA")
    protected ModelAndView renderViewAffichageA(RenderRequest request, @ModelAttribute("searchForm") SearchForm searchForm,   RenderResponse response) throws Exception {
    	
    	ModelMap model = new ModelMap();
    	
    	if(formulaire(request, searchForm, response, model, token) == true){   
    		model.put("ongletC", "A");
    		return new ModelAndView("viewA", model);
    	}else{
    		return new ModelAndView("viewErreur", model);
    	}
    }
    
    @RequestMapping("ABOUT")
	public ModelAndView renderAboutView(RenderRequest request, RenderResponse response) throws Exception {
		ModelMap model = new ModelMap();
		return new ModelAndView("about", model);
	}
    

	@ModelAttribute("searchForm")
	public SearchForm createSearchForm() {
		return new SearchForm();
	}
 
	public String getToken(String ST){    	
    	
    	String cktlrestauthkey = "";
    	String url = muscade_url+auth_param_ticket+ST;
    	String auth = "";

	   	RestTemplate restTemplate = new RestTemplate();
		auth = restTemplate.getForObject(url, String.class);

		cktlrestauthkey = auth.replaceAll("\n",""); 
		cktlrestauthkey = cktlrestauthkey.replaceAll("\r","");
		cktlrestauthkey = cktlrestauthkey.replace("<html><body><p>{&quot;cktlrestauthkey&quot;:&quot;", "");	   	
	   	cktlrestauthkey = cktlrestauthkey.replace("&quot;}</p></body></html>", "");
	   	cktlrestauthkey = cktlrestauthkey.replace("{\"cktlrestauthkey\":\"", "");
	   	cktlrestauthkey = cktlrestauthkey.replace("\"}]", "");   
	   	cktlrestauthkey = cktlrestauthkey.replace("\"}", "");	   	
 
	    return cktlrestauthkey;
    }
	
	public boolean formulaire(RenderRequest request, SearchForm searchForm, RenderResponse response, ModelMap model,String token){
		
    	List<Exercice> listeExercices;        
        List<Etablissement> listeEtablissements;        
        List<UB> listeUB;
        List<CR> listeCR;
        List<SousCR> listeSousCr;
        List<Convention> listeConvention;
        
       	final PortletPreferences prefs = request.getPreferences();
    	nb_par_page = prefs.getValue(PREF_NB_PAR_PAGE, null);    	
    	message_erreur_authentification = prefs.getValue(PREF_MSG_ERR_AUTH, null);
    	email_contact = prefs.getValue(PREF_EMAIL, null);
    	
    	Calendar calendar = Calendar.getInstance();
   	 	int an = calendar.get( Calendar.YEAR );   	 	
   	 	anneeCourante = String.valueOf(an);
   	 	
   	 	model.put("token", token);
   	 	model.put("muscade_url", muscade_url_ext);
   	 	model.put("caslogin_url", caslogin_url);
   	 	model.put("message_erreur_authentification", message_erreur_authentification);
   	 	model.put("email_contact", email_contact);
   	 	
   	 	if(this.domainService.getTestDroit(muscade_url_ext,token) == true){
   	 	
	   	 	listeExercices = (this.domainService.getListeExercices(muscade_url_ext,token,exercice_debut));   	      
	   	 	model.put("listeExercices", listeExercices);  	 	
	   	 
	
	   	 	if(searchForm.getExercice() != "" && searchForm.getExercice() != null ) {
	   	 		listeEtablissements = (this.domainService.getListeEtablissements(searchForm.getExercice(),muscade_url_ext,token));   	      
	   	 	 	model.put("listeEtablissements", listeEtablissements);   	 	 	
	   	 	}
	   	 	
	   	 	if(searchForm.getEtablissement() != "" && searchForm.getEtablissement() != null) {
		 		listeUB = (this.domainService.getListeUB(searchForm.getExercice(),searchForm.getEtablissement(),muscade_url_ext,token));   	      
		 	 	model.put("listeUB", listeUB);   	 	 	
		 	}
	   	 	
	   	 	if(searchForm.getUB() != "" && searchForm.getUB() != null) {
		 		listeCR = (this.domainService.getListeCR(searchForm.getExercice(),searchForm.getUB(),muscade_url_ext,token));   	      
		 	 	model.put("listeCR", listeCR);   	 	 	
		 	}
	   	 	
	   	 	if(searchForm.getCR() != "" && searchForm.getCR() != null) {
		 		listeSousCr = (this.domainService.getListeSousCR(searchForm.getExercice(),searchForm.getCR(),muscade_url_ext,token));   	      
		 	 	model.put("listeSousCr", listeSousCr); 
		 	 	listeConvention = (this.domainService.getListeConvention(searchForm.getExercice(),searchForm.getCR(),muscade_url_ext,token));   	      
		 	 	model.put("listeConvention", listeConvention);
		 	}
	   	 	
	   	 	if(searchForm.getSousCR() != "" && searchForm.getSousCR() != null ) {
		 	 	listeConvention = (this.domainService.getListeConvention(searchForm.getExercice(),searchForm.getSousCR(),muscade_url_ext,token));   	      
		 	 	model.put("listeConvention", listeConvention);
		 	}
	   	 	
	   	 	String dateheure=new SimpleDateFormat("dd/MM/yyyy HH:mm", Locale.FRANCE).format(new Date());
	 	 	model.put("dateheure", dateheure);
 	 		model.put("afficherConvention", affiche_convention);
	   	 	
	   	 	return true;
   	 	}else{
   	 		return false;
   	 	}
	}
	

private Assertion getAssertion(PortletRequest request,String casTargetService) throws Exception {
	
	// Getting current user
	String user = request.getRemoteUser();
	
	// Getting portal CAS proxy ticket
	@SuppressWarnings("unchecked")
	String portalProxyTicket = (String)((Map<String, Object>)request.getAttribute(PortletRequest.USER_INFO)).get("casProxyTicket");
	logger.debug("PortletHandlerInterceptor::getAssertion() : got portal PT [" + portalProxyTicket + "] for user [" + user + "]");
	
	if(portalProxyTicket == null) {
		logger.error("PortletHandlerInterceptor::getAssertion() : no portal PT available for user [" + user + "]");
		throw new Exception();
	}
	
	// Portal PT validation
	try {
		return ticketValidator.validate(portalProxyTicket, casTargetService);
	}
	catch(TicketValidationException e) {
		logger.error("PortletHandlerInterceptor::getAssertion() : could not validate portal PT [" + portalProxyTicket + "]", e);
		throw new Exception();
	}
}

}

