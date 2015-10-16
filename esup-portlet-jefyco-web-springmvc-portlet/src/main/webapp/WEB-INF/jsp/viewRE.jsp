<%@ include file="/WEB-INF/jsp/include.jsp"%>

<portlet:renderURL var="renderRefreshUrl" />

<div class="fl-widget portlet" role="section">
    <div class="fl-widget-titlebar portlet-title" role="sectionhead">
  		<h2 role="heading">Consultation Jefyco</h2>
    </div>
	<div class="fl-widget-content portlet-body" role="main">
		<div class="fl-col portlet-toolbar" role="toolbar">
		</div>
		<portlet:renderURL var="renderURL">
			<portlet:param name="action" value="affichageDR"/>
			</portlet:renderURL>
		<%@ include file="/WEB-INF/jsp/menu.jsp"%>
				
		<div class="portlet-section" role="section">
		<div class="portlet-section-body">
	       Page(s) : <c:if test="${pageC - 1 > 0}">
		       <portlet:renderURL var="renderURL_REPrec">
					<portlet:param name="action" value="detailsRE"/>
					<portlet:param name="page" value="${pageC -1}"/>
					<portlet:param name="credit" value="${credit}"/>
					<portlet:param name="organigramme" value="${organigramme}"/>
					<portlet:param name="colonne" value="${colonne}"/>
					<portlet:param name="sens" value="${sens}"/>
					<portlet:param name="ligne_budgetaire" value="${ligne_budgetaire}"/>
				</portlet:renderURL>
				<a href="${renderURL_REPrec}">${pageC -1}</a> - 
			</c:if>
			${pageC}
			<c:if test="${pageC + 1 <= nb_pages}">
			<portlet:renderURL var="renderURL_RESuiv">
				<portlet:param name="action" value="detailsRE"/>
				<portlet:param name="page" value="${pageC +1}"/>
				<portlet:param name="credit" value="${credit}"/>
				<portlet:param name="organigramme" value="${organigramme}"/>
				<portlet:param name="colonne" value="${colonne}"/>
				<portlet:param name="sens" value="${sens}"/>
				<portlet:param name="ligne_budgetaire" value="${ligne_budgetaire}"/>
			</portlet:renderURL>
			 - <a href="${renderURL_RESuiv}">${pageC +1}</a>
			</c:if>
			<c:if test="${pageC + 2 <= nb_pages}">
			 - ..
			</c:if>
			&nbsp;(${nb} résultats)
			</div>
	       <div class="portlet-section-body">
       		<table border="0px" bordercolor="black" width=100% align="center">
               <tr>
               	<td colspan="8"><h4 class="portlet-section-subheader" role="heading">Détails reste engagé en ${libelle_credit} pour la ligne ${ligne_budgetaire} <span id="conv"></span></h4></td>
               </tr>
               
               <script>
	       		if(document.getElementById("convention").value!=""){
	       			document.getElementById("conv").innerHTML = "(Convention : "+document.getElementById("convention").options[document.getElementById("convention").selectedIndex].text+")";
	       		}
       			</script>
               
               <tr class="portlet-table-header">
                   <portlet:renderURL var="renderURL_RE_numcomAsc">
						<portlet:param name="action" value="detailsRE"/>
						<portlet:param name="credit" value="${credit}"/>
						<portlet:param name="organigramme" value="${organigramme}"/>
						<portlet:param name="page" value="${pageC}"/>
						<portlet:param name="colonne" value="CMDE_NUMERO"/>
						<portlet:param name="sens" value="asc"/>
						<portlet:param name="ligne_budgetaire" value="${ligne_budgetaire}"/>
						<portlet:param name="libelle_credit" value="${libelle_credit}"/>
				</portlet:renderURL>
				<portlet:renderURL var="renderURL_RE_numcomDesc">
						<portlet:param name="action" value="detailsRE"/>
						<portlet:param name="credit" value="${credit}"/>
						<portlet:param name="organigramme" value="${organigramme}"/>
						<portlet:param name="page" value="${pageC}"/>
						<portlet:param name="colonne" value="CMDE_NUMERO"/>
						<portlet:param name="sens" value="desc"/>
						<portlet:param name="ligne_budgetaire" value="${ligne_budgetaire}"/>
						<portlet:param name="libelle_credit" value="${libelle_credit}"/>
				</portlet:renderURL>
				<td align="center">N° commande
				<c:choose>
					      <c:when test="${colonne == 'CMDE_NUMERO' && sens == 'asc'}">
					      	<a href="${renderURL_RE_numcomAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc-actif.png"></a>&nbsp;
					      	<a href="${renderURL_RE_numcomDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc.png"></a>
					      </c:when>
						  <c:when test="${colonne == 'CMDE_NUMERO' && sens == 'desc'}">
					      	<a href="${renderURL_RE_numcomAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc.png"></a>&nbsp;
					      	<a href="${renderURL_RE_numcomDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc-actif.png"></a>
					      </c:when>						
					      <c:otherwise>
					      	<a href="${renderURL_RE_numcomAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc.png"></a>&nbsp;
					      	<a href="${renderURL_RE_numcomDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc.png"></a>					      
					      </c:otherwise>
					</c:choose>	
				</td>				
                   <portlet:renderURL var="renderURL_RE_libAsc">
						<portlet:param name="action" value="detailsRE"/>
						<portlet:param name="credit" value="${credit}"/>
						<portlet:param name="organigramme" value="${organigramme}"/>
						<portlet:param name="page" value="${pageC}"/>
						<portlet:param name="colonne" value="ENGAGE_LIBELLE"/>
						<portlet:param name="sens" value="asc"/>
						<portlet:param name="ligne_budgetaire" value="${ligne_budgetaire}"/>
						<portlet:param name="libelle_credit" value="${libelle_credit}"/>
				</portlet:renderURL>
				<portlet:renderURL var="renderURL_RE_libDesc">
						<portlet:param name="action" value="detailsRE"/>
						<portlet:param name="credit" value="${credit}"/>
						<portlet:param name="organigramme" value="${organigramme}"/>
						<portlet:param name="page" value="${pageC}"/>
						<portlet:param name="colonne" value="ENGAGE_LIBELLE"/>
						<portlet:param name="sens" value="desc"/>
						<portlet:param name="ligne_budgetaire" value="${ligne_budgetaire}"/>
						<portlet:param name="libelle_credit" value="${libelle_credit}"/>
				</portlet:renderURL>
                   <td align="center">Référence facture
                   <c:choose>
					      <c:when test="${colonne == 'ENGAGE_LIBELLE' && sens == 'asc'}">
					      	<a href="${renderURL_RE_libAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc-actif.png"></a>&nbsp;
					      	<a href="${renderURL_RE_libDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc.png"></a>
					      </c:when>
						  <c:when test="${colonne == 'ENGAGE_LIBELLE' && sens == 'desc'}">
					      	<a href="${renderURL_RE_libAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc.png"></a>&nbsp;
					      	<a href="${renderURL_RE_libDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc-actif.png"></a>
					      </c:when>						
					      <c:otherwise>
					      	<a href="${renderURL_RE_libAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc.png"></a>&nbsp;
					      	<a href="${renderURL_RE_libDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc.png"></a>					      
					      </c:otherwise>
					</c:choose>	
                   </td>
                   
                   <portlet:renderURL var="renderURL_RE_fournisseurAsc">
						<portlet:param name="action" value="detailsRE"/>
						<portlet:param name="credit" value="${credit}"/>
						<portlet:param name="organigramme" value="${organigramme}"/>
						<portlet:param name="page" value="${pageC}"/>
						<portlet:param name="colonne" value="FOURNISSEUR"/>
						<portlet:param name="sens" value="asc"/>
						<portlet:param name="ligne_budgetaire" value="${ligne_budgetaire}"/>
						<portlet:param name="libelle_credit" value="${libelle_credit}"/>
				</portlet:renderURL>
				<portlet:renderURL var="renderURL_RE_fournisseurDesc">
						<portlet:param name="action" value="detailsRE"/>
						<portlet:param name="credit" value="${credit}"/>
						<portlet:param name="organigramme" value="${organigramme}"/>
						<portlet:param name="page" value="${pageC}"/>
						<portlet:param name="colonne" value="FOURNISSEUR"/>
						<portlet:param name="sens" value="desc"/>
						<portlet:param name="ligne_budgetaire" value="${ligne_budgetaire}"/>
						<portlet:param name="libelle_credit" value="${libelle_credit}"/>
				</portlet:renderURL>
                   <td align="center">Fournisseur
                   <c:choose>
					      <c:when test="${colonne == 'FOURNISSEUR' && sens == 'asc'}">
					      	<a href="${renderURL_RE_fournisseurAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc-actif.png"></a>&nbsp;
					      	<a href="${renderURL_RE_fournisseurDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc.png"></a>
					      </c:when>
						  <c:when test="${colonne == 'FOURNISSEUR' && sens == 'desc'}">
					      	<a href="${renderURL_RE_fournisseurAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc.png"></a>&nbsp;
					      	<a href="${renderURL_RE_fournisseurDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc-actif.png"></a>
					      </c:when>						
					      <c:otherwise>
					      	<a href="${renderURL_RE_fournisseurAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc.png"></a>&nbsp;
					      	<a href="${renderURL_RE_fournisseurDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc.png"></a>					      
					      </c:otherwise>
					</c:choose>	
                   </td>
                   
                   <portlet:renderURL var="renderURL_RE_mthtAsc">
						<portlet:param name="action" value="detailsRE"/>
						<portlet:param name="credit" value="${credit}"/>
						<portlet:param name="organigramme" value="${organigramme}"/>
						<portlet:param name="page" value="${pageC}"/>
						<portlet:param name="colonne" value="MTHT"/>
						<portlet:param name="sens" value="asc"/>
						<portlet:param name="ligne_budgetaire" value="${ligne_budgetaire}"/>
						<portlet:param name="libelle_credit" value="${libelle_credit}"/>
				</portlet:renderURL>
				<portlet:renderURL var="renderURL_RE_mthtDesc">
						<portlet:param name="action" value="detailsRE"/>
						<portlet:param name="credit" value="${credit}"/>
						<portlet:param name="organigramme" value="${organigramme}"/>
						<portlet:param name="page" value="${pageC}"/>
						<portlet:param name="colonne" value="MTHT"/>
						<portlet:param name="sens" value="desc"/>
						<portlet:param name="ligne_budgetaire" value="${ligne_budgetaire}"/>
						<portlet:param name="libelle_credit" value="${libelle_credit}"/>
				</portlet:renderURL>
                   <td align="center">Montant HT
                   <c:choose>
					      <c:when test="${colonne == 'MTHT' && sens == 'asc'}">
					      	<a href="${renderURL_RE_mthtAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc-actif.png"></a>&nbsp;
					      	<a href="${renderURL_RE_mthtDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc.png"></a>
					      </c:when>
						  <c:when test="${colonne == 'MTHT' && sens == 'desc'}">
					      	<a href="${renderURL_RE_mthtAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc.png"></a>&nbsp;
					      	<a href="${renderURL_RE_mthtDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc-actif.png"></a>
					      </c:when>						
					      <c:otherwise>
					      	<a href="${renderURL_RE_mthtAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc.png"></a>&nbsp;
					      	<a href="${renderURL_RE_mthtDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc.png"></a>					      
					      </c:otherwise>
					</c:choose>	
                   </td>
                   
                   <portlet:renderURL var="renderURL_RE_mttcAsc">
						<portlet:param name="action" value="detailsRE"/>
						<portlet:param name="credit" value="${credit}"/>
						<portlet:param name="organigramme" value="${organigramme}"/>
						<portlet:param name="page" value="${pageC}"/>
						<portlet:param name="colonne" value="MTTTC"/>
						<portlet:param name="sens" value="asc"/>
						<portlet:param name="ligne_budgetaire" value="${ligne_budgetaire}"/>
						<portlet:param name="libelle_credit" value="${libelle_credit}"/>
				</portlet:renderURL>
				<portlet:renderURL var="renderURL_RE_mttcDesc">
						<portlet:param name="action" value="detailsRE"/>
						<portlet:param name="credit" value="${credit}"/>
						<portlet:param name="organigramme" value="${organigramme}"/>
						<portlet:param name="page" value="${pageC}"/>
						<portlet:param name="colonne" value="MTTTC"/>
						<portlet:param name="sens" value="desc"/>
						<portlet:param name="ligne_budgetaire" value="${ligne_budgetaire}"/>
						<portlet:param name="libelle_credit" value="${libelle_credit}"/>
				</portlet:renderURL>
                   <td align="center">Montant TTC
                   <c:choose>
					      <c:when test="${colonne == 'MTTTC' && sens == 'asc'}">
					      	<a href="${renderURL_RE_mttcAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc-actif.png"></a>&nbsp;
					      	<a href="${renderURL_RE_mttcDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc.png"></a>
					      </c:when>
						  <c:when test="${colonne == 'MTTTC' && sens == 'desc'}">
					      	<a href="${renderURL_RE_mttcAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc.png"></a>&nbsp;
					      	<a href="${renderURL_RE_mttcDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc-actif.png"></a>
					      </c:when>						
					      <c:otherwise>
					      	<a href="${renderURL_RE_mttcAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc.png"></a>&nbsp;
					      	<a href="${renderURL_RE_mttcDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc.png"></a>					      
					      </c:otherwise>
					</c:choose>	
					</td>
					
                   <portlet:renderURL var="renderURL_RE_mbudgAsc">
						<portlet:param name="action" value="detailsRE"/>
						<portlet:param name="credit" value="${credit}"/>
						<portlet:param name="organigramme" value="${organigramme}"/>
						<portlet:param name="page" value="${pageC}"/>
						<portlet:param name="colonne" value="MTBUD"/>
						<portlet:param name="sens" value="asc"/>
						<portlet:param name="ligne_budgetaire" value="${ligne_budgetaire}"/>
						<portlet:param name="libelle_credit" value="${libelle_credit}"/>
				</portlet:renderURL>
				<portlet:renderURL var="renderURL_RE_mbudgDesc">
						<portlet:param name="action" value="detailsRE"/>
						<portlet:param name="credit" value="${credit}"/>
						<portlet:param name="organigramme" value="${organigramme}"/>
						<portlet:param name="page" value="${pageC}"/>
						<portlet:param name="colonne" value="MTBUD"/>
						<portlet:param name="sens" value="desc"/>
						<portlet:param name="ligne_budgetaire" value="${ligne_budgetaire}"/>
						<portlet:param name="libelle_credit" value="${libelle_credit}"/>
				</portlet:renderURL>
                   <td align="center">Montant budgétaire
                   <c:choose>
					      <c:when test="${colonne == 'MTBUD' && sens == 'asc'}">
					      	<a href="${renderURL_RE_mbudgAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc-actif.png"></a>&nbsp;
					      	<a href="${renderURL_RE_mbudgDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc.png"></a>
					      </c:when>
						  <c:when test="${colonne == 'MTBUD' && sens == 'desc'}">
					      	<a href="${renderURL_RE_mbudgAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc.png"></a>&nbsp;
					      	<a href="${renderURL_RE_mbudgDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc-actif.png"></a>
					      </c:when>						
					      <c:otherwise>
					      	<a href="${renderURL_RE_mbudgAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc.png"></a>&nbsp;
					      	<a href="${renderURL_RE_mbudgDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc.png"></a>					      
					      </c:otherwise>
					</c:choose>	
                   </td>
                   
                   <portlet:renderURL var="renderURL_RE_resteAsc">
						<portlet:param name="action" value="detailsRE"/>
						<portlet:param name="credit" value="${credit}"/>
						<portlet:param name="organigramme" value="${organigramme}"/>
						<portlet:param name="page" value="${pageC}"/>
						<portlet:param name="colonne" value="ENG_MONTANT_BUDGETAIRE_RESTE"/>
						<portlet:param name="sens" value="asc"/>
						<portlet:param name="ligne_budgetaire" value="${ligne_budgetaire}"/>
						<portlet:param name="libelle_credit" value="${libelle_credit}"/>
				</portlet:renderURL>
				<portlet:renderURL var="renderURL_RE_resteDesc">
						<portlet:param name="action" value="detailsRE"/>
						<portlet:param name="credit" value="${credit}"/>
						<portlet:param name="organigramme" value="${organigramme}"/>
						<portlet:param name="page" value="${pageC}"/>
						<portlet:param name="colonne" value="ENG_MONTANT_BUDGETAIRE_RESTE"/>
						<portlet:param name="sens" value="desc"/>
						<portlet:param name="ligne_budgetaire" value="${ligne_budgetaire}"/>
						<portlet:param name="libelle_credit" value="${libelle_credit}"/>
				</portlet:renderURL>
                   <td align="center">Reste engagé
                   <c:choose>
					      <c:when test="${colonne == 'ENG_MONTANT_BUDGETAIRE_RESTE' && sens == 'asc'}">
					      	<a href="${renderURL_RE_resteAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc-actif.png"></a>&nbsp;
					      	<a href="${renderURL_RE_resteDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc.png"></a>
					      </c:when>
						  <c:when test="${colonne == 'ENG_MONTANT_BUDGETAIRE_RESTE' && sens == 'desc'}">
					      	<a href="${renderURL_RE_resteAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc.png"></a>&nbsp;
					      	<a href="${renderURL_RE_resteDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc-actif.png"></a>
					      </c:when>						
					      <c:otherwise>
					      	<a href="${renderURL_RE_resteAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc.png"></a>&nbsp;
					      	<a href="${renderURL_RE_resteDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc.png"></a>					      
					      </c:otherwise>
					</c:choose>	
                   </td>
                   
                   <portlet:renderURL var="renderURL_RE_statutAsc">
						<portlet:param name="action" value="detailsRE"/>
						<portlet:param name="credit" value="${credit}"/>
						<portlet:param name="organigramme" value="${organigramme}"/>
						<portlet:param name="page" value="${pageC}"/>
						<portlet:param name="colonne" value="STATUT"/>
						<portlet:param name="sens" value="asc"/>
						<portlet:param name="ligne_budgetaire" value="${ligne_budgetaire}"/>
						<portlet:param name="libelle_credit" value="${libelle_credit}"/>
				</portlet:renderURL>
				<portlet:renderURL var="renderURL_RE_statutDesc">
						<portlet:param name="action" value="detailsRE"/>
						<portlet:param name="credit" value="${credit}"/>
						<portlet:param name="organigramme" value="${organigramme}"/>
						<portlet:param name="page" value="${pageC}"/>
						<portlet:param name="colonne" value="STATUT"/>
						<portlet:param name="sens" value="desc"/>
						<portlet:param name="ligne_budgetaire" value="${ligne_budgetaire}"/>
						<portlet:param name="libelle_credit" value="${libelle_credit}"/>
				</portlet:renderURL>
                   <td align="center">Statut
                   <c:choose>
					      <c:when test="${colonne == 'STATUT' && sens == 'asc'}">
					      	<a href="${renderURL_RE_statutAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc-actif.png"></a>&nbsp;
					      	<a href="${renderURL_RE_statutDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc.png"></a>
					      </c:when>
						  <c:when test="${colonne == 'STATUT' && sens == 'desc'}">
					      	<a href="${renderURL_RE_statutAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc.png"></a>&nbsp;
					      	<a href="${renderURL_RE_statutDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc-actif.png"></a>
					      </c:when>						
					      <c:otherwise>
					      	<a href="${renderURL_RE_statutAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc.png"></a>&nbsp;
					      	<a href="${renderURL_RE_statutDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc.png"></a>					      
					      </c:otherwise>
					</c:choose>	
                   </td>
               </tr>     
       		   <c:forEach items="${listeResteEngage}" var="element">  
               		<tr>
			      		<td>${element.CMDE_NUMERO}</td>
			       		<td>${element.ENGAGE_LIBELLE}</td>
			       		<td>${element.FOURNISSEUR}</td>
			       		<c:set var="montantht"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${element.MTHT}" /></c:set>
			       		<c:set var="montantttc"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${element.MTTTC}" /></c:set>
			       		<c:set var="montantbudgetaire"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${element.MTBUD}" /></c:set>
			       		<c:set var="reste"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${element.reste}" /></c:set>
			       		<td align="right">${montantht}</td>
			       		<td align="right">${montantttc}</td>
			       		<td align="right">${montantbudgetaire}</td>
			       		<td align="right">${reste}</td>
			       		<td>${element.STATUS}</td>
					</tr>
				</c:forEach>           	                
             </table>

	       </div>
	       <div class="portlet-section-body">
	       Page(s) : <c:if test="${pageC - 1 > 0}">
		       <portlet:renderURL var="renderURL_REPrec">
					<portlet:param name="action" value="detailsRE"/>
					<portlet:param name="page" value="${pageC -1}"/>
					<portlet:param name="credit" value="${credit}"/>
					<portlet:param name="organigramme" value="${organigramme}"/>
					<portlet:param name="colonne" value="${colonne}"/>
					<portlet:param name="sens" value="${sens}"/>
					<portlet:param name="ligne_budgetaire" value="${ligne_budgetaire}"/>
					<portlet:param name="libelle_credit" value="${libelle_credit}"/>
				</portlet:renderURL>
				<a href="${renderURL_REPrec}">${pageC -1}</a> - 
			</c:if>
			${pageC}
			<c:if test="${pageC + 1 <= nb_pages}">
			<portlet:renderURL var="renderURL_RESuiv">
				<portlet:param name="action" value="detailsRE"/>
				<portlet:param name="page" value="${pageC +1}"/>
				<portlet:param name="credit" value="${credit}"/>
				<portlet:param name="organigramme" value="${organigramme}"/>
				<portlet:param name="colonne" value="${colonne}"/>
				<portlet:param name="sens" value="${sens}"/>
				<portlet:param name="ligne_budgetaire" value="${ligne_budgetaire}"/>
				<portlet:param name="libelle_credit" value="${libelle_credit}"/>
			</portlet:renderURL>
			 - <a href="${renderURL_RESuiv}">${pageC +1}</a>
			</c:if>
			<c:if test="${pageC + 2 <= nb_pages}">
			 - ..
			</c:if>
			</div>
		</div>
		</div>
		</div>

<input type="hidden" name="nb" id="nb" value="${nb}"/>
<input type="hidden" name="token" id="token" value="${token}"/>
<input type="hidden" name="muscade_url" id="muscade_url" value="${muscade_url}"/>
<input type="hidden" name="caslogin_url" id="caslogin_url" value="${caslogin_url}"/>
