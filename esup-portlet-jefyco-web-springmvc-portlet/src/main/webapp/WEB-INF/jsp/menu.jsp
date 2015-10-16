<script type="text/javascript"> 
//<![CDATA[
    var jQuery = up.jQuery.noConflict(true); 
    
    function liste_etablissements(exe){
    	var dataObject = {};
    	var token = jQuery('#token').val();
    	var muscadeUrl = jQuery('#muscade_url').val();
    	var url = muscadeUrl+"/ra/query/cocktail.gfc.filter.organigramme_etab.list/list.json?cktlrestauthkey="+token+"&exercice.id="+exe;
    	var xmlhttp = new XMLHttpRequest();
    	xmlhttp.open("GET", url, true);
    	xmlhttp.onreadystatechange = function () {
    	  if (xmlhttp.readyState == 4 && xmlhttp.status == 200){
    		  dataObject = JSON.parse(xmlhttp.responseText);
    		  if(dataObject.length > 0 ){
    			var options = '<option value="">Choisir</option>';   		  
    		  	for (var i = 0; i < dataObject.length; i++) {
    	          options += '<option value="' + dataObject[i].ID + '">' + dataObject[i].VALUE + '</option>';
    	        }
    		  }else{
    			 var options = '<option value=""></option>'
    		  }
          	jQuery("select#etablissement").html(options);
    	  }
    	};
    	xmlhttp.send(null);    	
    }
    
    function liste_ub(exe,etab){    	
    	var dataObject = {};
    	var token = jQuery('#token').val();
    	var muscadeUrl = jQuery('#muscade_url').val();
    	var url = muscadeUrl+"/ra/query/cocktail.gfc.filter.organigramme_ub.list/list.json?cktlrestauthkey="+token+"&exercice.id="+exe+"&organigramme_etab.id="+etab;
    	var xmlhttp = new XMLHttpRequest();
    	xmlhttp.open("GET", url, true);
    	xmlhttp.onreadystatechange = function () {
    	  if (xmlhttp.readyState == 4 && xmlhttp.status == 200){
    		  dataObject = JSON.parse(xmlhttp.responseText);
    		  if(dataObject.length > 0 ){
    			  var options = '<option value="">Choisir</option>';    		  
    		  	  for (var i = 0; i < dataObject.length; i++) {
    	          	options += '<option value="' + dataObject[i].ID + '">' + dataObject[i].VALUE + '</option>';
    	          }
    		  }else{
     			 var options = '<option value=""></option>'
     		  }
          	jQuery("select#uB").html(options);
    	  }
    	};
    	xmlhttp.send(null);    		
    }
    
	function liste_cr(exe,ub){  
		var dataObject = {};
    	var token = jQuery('#token').val();
    	var muscadeUrl = jQuery('#muscade_url').val();
    	var url = muscadeUrl+"/ra/query/cocktail.gfc.filter.organigramme_cr.list/list.json?cktlrestauthkey="+token+"&exercice.id="+exe+"&organigramme_ub.id="+ub;
    	var xmlhttp = new XMLHttpRequest();
    	xmlhttp.open("GET", url, true);
    	xmlhttp.onreadystatechange = function () {
    	  if (xmlhttp.readyState == 4 && xmlhttp.status == 200){    		  
    		  dataObject = JSON.parse(xmlhttp.responseText);
    		  if(dataObject.length > 0 ){
    			  var options = '<option value="">Choisir</option>';
	    		  for (var i = 0; i < dataObject.length; i++) {
	    	          options += '<option value="' + dataObject[i].ID + '">' + dataObject[i].VALUE + '</option>';
	    	        }
	    	  }else{
	 			 var options = '<option value=""></option>'
	 		  }
          	jQuery("select#cR").html(options);
    	  }
    	};
    	xmlhttp.send(null);			
    }
    
	function liste_souscr(exe,cr){
		var dataObject = {};
    	var token = jQuery('#token').val();
    	var muscadeUrl = jQuery('#muscade_url').val();
    	var url = muscadeUrl+"/ra/query/cocktail.gfc.filter.organigramme_souscr.list/list.json?cktlrestauthkey="+token+"&exercice.id="+exe+"&organigramme_cr.id="+cr;
    	var xmlhttp = new XMLHttpRequest();
    	xmlhttp.open("GET", url, true);
    	xmlhttp.onreadystatechange = function () {
    	  if (xmlhttp.readyState == 4 && xmlhttp.status == 200){
    		  dataObject = JSON.parse(xmlhttp.responseText);
    		  if(dataObject.length > 0 ){
    			  var options = '<option value="">Choisir</option>';
	    		  for (var i = 0; i < dataObject.length; i++) {
	    	          options += '<option value="' + dataObject[i].ID + '">' + dataObject[i].VALUE + '</option>';
	    	        }
	    	  }else{
	 			 var options = '<option value=""></option>'
	 		  }
          	jQuery("select#sousCR").html(options);
    	  }
    	};
    	xmlhttp.send(null);			
    }
	
	function liste_conventions(exe,orga){ 
		var dataObject = {};
    	var token = jQuery('#token').val();
    	var muscadeUrl = jQuery('#muscade_url').val();
    	var url = muscadeUrl+"/ra/query/cocktail.gfc.filter.conventionpourorgan.list/list.json?cktlrestauthkey="+token+"&exercice.id="+exe+"&organigramme.id="+orga;
    	var xmlhttp = new XMLHttpRequest();
    	xmlhttp.open("GET", url, true);
    	xmlhttp.onreadystatechange = function () {
    	  if (xmlhttp.readyState == 4 && xmlhttp.status == 200){
    		  dataObject = JSON.parse(xmlhttp.responseText);
    		  if(dataObject.length > 0 ){
    			  var options = '<option value="">Choisir</option>';
	    		  for (var i = 0; i < dataObject.length; i++) {
	    	          options += '<option value="' + dataObject[i].ID + '">' + dataObject[i].VALUE + ' (fin : ' + dataObject[i].DAT +')</option>';
	    	        }
	    	  }else{
	 			 var options = '<option value=""></option>'
	 		  }
          	jQuery("select#convention").html(options);
    	  }
    	};
    	xmlhttp.send(null);			
    }


	jQuery(document).ready(function() {    
		if(jQuery("#exercice option:selected").val()=="" || jQuery("#etablissement option:selected").val()=="" || jQuery("#uB option:selected").val()=="") affiche_submit();
				
		jQuery("select#exercice").change(function(e) {
      		if(jQuery(this).val() != ""){
      			reset_listes(5);
      			liste_etablissements(jQuery(this).val());
      			affiche_submit();      			
      		}
		});
		jQuery("select#etablissement").change(function(e) {
			if(jQuery(this).val() != ""){
				reset_listes(4);
				liste_ub(jQuery("#exercice option:selected").val(),jQuery(this).val());
				affiche_submit();				
			}
		});
		jQuery("select#uB").change(function(e) {
			if(jQuery(this).val() != ""){
				reset_listes(3);
				liste_cr(jQuery("#exercice option:selected").val(),jQuery(this).val());
				affiche_submit();				
			}
		});
		jQuery("select#cR").change(function(e) {
			if(jQuery(this).val() != "") {
				reset_listes(2);
				liste_souscr(jQuery("#exercice option:selected").val(),jQuery(this).val());	
				liste_conventions(jQuery("#exercice option:selected").val(),jQuery(this).val());
				affiche_submit();				
			}
		});
		jQuery("select#sousCR").change(function(e) {
			if(jQuery(this).val() != ""){
				reset_listes(1);
				liste_conventions(jQuery("#exercice option:selected").val(),jQuery(this).val());
				affiche_submit();
			}
		});
	});

	function affiche_submit(){
		jQuery("#afficher").hide();
		if(jQuery("#exercice option:selected").val()!="" && jQuery("#etablissement option:selected").val()!=""){
			jQuery("#afficher").show();
		}else{
			jQuery("#afficher").hide();
		}
	}
	
	function test_listes(){
		if(jQuery("#exercice option:selected").val()!="" || jQuery("#etablissement option:selected").val()!="" || jQuery("#uB option:selected").val()!=""){
			return true;
		}else{
			return false;
		}
	}
	
	function reset_listes(nombre){
		var options = '<option value=""> </option>';
		switch(nombre){
			case 5:
				jQuery("select#etablissement").html(options);
				jQuery("select#uB").html(options);
				jQuery("select#cR").html(options);
				jQuery("select#sousCR").html(options);
				jQuery("select#convention").html(options);
			case 4:
				jQuery("select#uB").html(options);
				jQuery("select#cR").html(options);
				jQuery("select#sousCR").html(options);
				jQuery("select#convention").html(options);
			case 3:
				jQuery("select#cR").html(options);
				jQuery("select#sousCR").html(options);
				jQuery("select#convention").html(options);
			case 2:
				jQuery("select#sousCR").html(options);
				jQuery("select#convention").html(options);
			case 1:
				jQuery("select#convention").html(options);
			break;
		}
	}

	function affiche_ligne_budgetaire(){
		var ub = document.getElementById("uB").options[document.getElementById("uB").selectedIndex].text;
        var cr = "", souscr = "", convention = "";
        
        if(document.getElementById("cR").value!="") cr = " - "+document.getElementById("cR").options[document.getElementById("cR").selectedIndex].text;         
        if(document.getElementById("sousCR").value!="") souscr = " - "+document.getElementById("sousCR").options[document.getElementById("sousCR").selectedIndex].text;
        if(document.getElementById("convention").value!="") convention = " (Convention : "+document.getElementById("convention").options[document.getElementById("convention").selectedIndex].text+")";
        
        var ligne = document.getElementById("ligne_budgetaire");
        ligne.innerHTML = "pour la ligne "+ub+cr+souscr+convention;
	}
	
	
//]]>
</script>

		<div class="portlet-section" role="menu">
		<h3 class="portlet-section-header" role="heading">Recherche</h3>
		  <div class="portlet-section-body">   
		  	 
		        
		      <form:form modelAttribute="searchForm" method="post" action="${renderURL}">
				Exercice : <form:select path="exercice" id="exercice" class="portlet-form-input-field">
					<form:option value="" label="Choisir" /> 
					<form:options items="${listeExercices}" itemValue="ID" itemLabel="VALUE" />
				</form:select> *
				
				Etablissement : <form:select path="etablissement" id="etablissement" class="portlet-form-input-field">
					<form:option value="" label=" " />
					<form:options items="${listeEtablissements}" itemValue="ID" itemLabel="VALUE" />
				</form:select> * 
				
				UB : <form:select path="uB" id="uB" class="portlet-form-input-field">
					<form:option value="" label=" " />
					<form:options items="${listeUB}" itemValue="ID" itemLabel="VALUE" />
				</form:select> *
				
				CR : <form:select path="cR" id="cR" class="portlet-form-input-field">
					<form:option value="" label=" " />
					<form:options items="${listeCR}" itemValue="ID" itemLabel="VALUE" />
				</form:select>	
				
				Sous CR : <form:select path="sousCR" id="sousCR" class="portlet-form-input-field">
					<form:option value="" label=" " />
					<form:options items="${listeSousCr}" itemValue="ID" itemLabel="VALUE" />
				</form:select>	
				<c:if test="${afficherConvention == 'OUI'}">
				Convention : <form:select path="convention" id="convention" class="portlet-form-input-field">
					<form:option value="" label=" " />
					<c:forEach var="conv" items="${listeConvention}">
				       <form:option value="${conv.ID}"><c:out value="${conv.VALUE} (fin : ${conv.DAT} )"/></form:option>
				   </c:forEach>
				</form:select>
				</c:if>
				<input type="submit" value="Afficher" path="afficher" id="afficher" class="portlet-form-button">
				<br />
				<form:checkbox path="sousniveaux" id="sousniveaux" value="true"/><label for="sousniveaux"> Inclure les sous niveaux dans la recherche</label>			
			</form:form>
		  </div>
		</div>
		<portlet:renderURL var="renderURL_DR">
			<portlet:param name="action" value="affichageDR"/>
		</portlet:renderURL>
		<portlet:renderURL var="renderURL_D">
			<portlet:param name="action" value="affichageD"/>
			<portlet:param name="page" value="1"/>
		</portlet:renderURL>
		<portlet:renderURL var="renderURL_R">
			<portlet:param name="action" value="affichageR"/>
			<portlet:param name="page" value="1"/>
		</portlet:renderURL>
		<portlet:renderURL var="renderURL_A">
			<portlet:param name="action" value="affichageA"/>
			<portlet:param name="page" value="1"/>
		</portlet:renderURL>

		<c:if test="${ongletC != '' && ongletC != null}">
		<div class="portlet-section" role="menu">
		<div style="float:right">le ${dateheure}</div>
	       <div class="portlet-section-body">	      
				<ul class="fl-tabs" role="menubar">
	                <c:choose>
   						<c:when test="${ongletC == 'DR'}"><li class="fl-tabs-active"></c:when>
			   			<c:otherwise><li></c:otherwise>
					</c:choose>
	               <a href="${renderURL_DR}">Dépenses / Recette</a></li>
	               <c:choose>
   						<c:when test="${ongletC == 'D'}"><li class="fl-tabs-active"></c:when>
			   			<c:otherwise><li></c:otherwise>
					</c:choose>
					<a href="${renderURL_D}">Dépenses</a></li>
	               <c:choose>
   						<c:when test="${ongletC == 'R'}"><li class="fl-tabs-active"></c:when>
			   			<c:otherwise><li></c:otherwise>
					</c:choose>
					<a href="${renderURL_R}">Recette</a></li>
	               <c:choose>
   						<c:when test="${ongletC == 'DM' || ongletC == 'RE' || ongletC == 'RD'}"><li class="fl-tabs-active"></c:when>
			   			<c:otherwise><li></c:otherwise>
					</c:choose>
					<a href="#">Détails</a></li>				
	           </ul>
	       </div>
		</div>
		</c:if>	
		
		