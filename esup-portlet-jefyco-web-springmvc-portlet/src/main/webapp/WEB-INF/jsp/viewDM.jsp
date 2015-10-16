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
		       <portlet:renderURL var="renderURL_DMPrec">
					<portlet:param name="action" value="detailsDM"/>
					<portlet:param name="page" value="${pageC -1}"/>
					<portlet:param name="credit" value="${credit}"/>
					<portlet:param name="organigramme" value="${organigramme}"/>
					<portlet:param name="libelle_credit" value="${libelle_credit}"/>
					<portlet:param name="colonne" value="${colonne}"/>
					<portlet:param name="sens" value="${sens}"/>
					<portlet:param name="ligne_budgetaire" value="${ligne_budgetaire}"/>
					<portlet:param name="pers" value="${pers}"/>
				</portlet:renderURL>
				<a href="${renderURL_DMPrec}">${pageC -1}</a> - 
			</c:if>
			${pageC}
			<c:if test="${pageC + 1 <= nb_pages}">
			<portlet:renderURL var="renderURL_DMSuiv">
				<portlet:param name="action" value="detailsDM"/>
				<portlet:param name="page" value="${pageC +1}"/>
				<portlet:param name="credit" value="${credit}"/>
				<portlet:param name="organigramme" value="${organigramme}"/>
				<portlet:param name="libelle_credit" value="${libelle_credit}"/>
				<portlet:param name="colonne" value="${colonne}"/>
				<portlet:param name="sens" value="${sens}"/>
				<portlet:param name="ligne_budgetaire" value="${ligne_budgetaire}"/>
				<portlet:param name="pers" value="${pers}"/>
			</portlet:renderURL>
			 - <a href="${renderURL_DMSuiv}">${pageC +1}</a>
			</c:if>
			<c:if test="${pageC + 2 <= nb_pages}">
			 - ..
			</c:if>
			&nbsp;(${nb} résultats)
			</div>
			
			
			
	       <div class="portlet-section-body">
       		<table border="0px" bordercolor="black" width=100% align="center">
               <tr>
               	<td colspan="8"><h4 class="portlet-section-subheader" role="heading">Détails mandats en ${libelle_credit} pour la ligne ${ligne_budgetaire} <span id="conv"></span></h4></td>
               </tr>
               
               <script>
	       		if(document.getElementById("convention").value!=""){
	       			document.getElementById("conv").innerHTML = "(Convention : "+document.getElementById("convention").options[document.getElementById("convention").selectedIndex].text+")";
	       		}
       			</script>
               
               <tr class="portlet-table-header">
               	<portlet:renderURL var="renderURL_DM_typepieceAsc">
						<portlet:param name="action" value="detailsDM"/>
						<portlet:param name="credit" value="${credit}"/>
						<portlet:param name="organigramme" value="${organigramme}"/>
						<portlet:param name="page" value="${pageC}"/>
						<portlet:param name="colonne" value="TYPE_PIECE"/>
						<portlet:param name="sens" value="asc"/>
						<portlet:param name="libelle_credit" value="${libelle_credit}"/>
						<portlet:param name="ligne_budgetaire" value="${ligne_budgetaire}"/>
						<portlet:param name="pers" value="${pers}"/>
				</portlet:renderURL>
				<portlet:renderURL var="renderURL_DM_typepieceDesc">
						<portlet:param name="action" value="detailsDM"/>
						<portlet:param name="credit" value="${credit}"/>
						<portlet:param name="organigramme" value="${organigramme}"/>
						<portlet:param name="page" value="${pageC}"/>
						<portlet:param name="colonne" value="TYPE_PIECE"/>
						<portlet:param name="sens" value="desc"/>
						<portlet:param name="libelle_credit" value="${libelle_credit}"/>
						<portlet:param name="ligne_budgetaire" value="${ligne_budgetaire}"/>
						<portlet:param name="pers" value="${pers}"/>
				</portlet:renderURL>
                   <td align="center">Type de pièces 
                  	<c:choose>
					      <c:when test="${colonne == 'TYPE_PIECE' && sens == 'asc'}">
					      	<a href="${renderURL_DM_typepieceAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc-actif.png"></a>&nbsp;
					      	<a href="${renderURL_DM_typepieceDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc.png"></a>
					      </c:when>
						  <c:when test="${colonne == 'TYPE_PIECE' && sens == 'desc'}">
					      	<a href="${renderURL_DM_typepieceAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc.png"></a>&nbsp;
					      	<a href="${renderURL_DM_typepieceDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc-actif.png"></a>
					      </c:when>						
					      <c:otherwise>
					      	<a href="${renderURL_DM_typepieceAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc.png"></a>&nbsp;
					      	<a href="${renderURL_DM_typepieceDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc.png"></a>					      
					      </c:otherwise>
					</c:choose>					 
                    </td>                 
                  <portlet:renderURL var="renderURL_DM_numeroAsc">
						<portlet:param name="action" value="detailsDM"/>
						<portlet:param name="credit" value="${credit}"/>
						<portlet:param name="organigramme" value="${organigramme}"/>
						<portlet:param name="page" value="${pageC}"/>
						<portlet:param name="colonne" value="NUMERO"/>
						<portlet:param name="sens" value="asc"/>
						<portlet:param name="libelle_credit" value="${libelle_credit}"/>
						<portlet:param name="ligne_budgetaire" value="${ligne_budgetaire}"/>
						<portlet:param name="pers" value="${pers}"/>
				</portlet:renderURL>
				<portlet:renderURL var="renderURL_DM_numeroDesc">
						<portlet:param name="action" value="detailsDM"/>
						<portlet:param name="credit" value="${credit}"/>
						<portlet:param name="organigramme" value="${organigramme}"/>
						<portlet:param name="page" value="${pageC}"/>
						<portlet:param name="colonne" value="NUMERO"/>
						<portlet:param name="sens" value="desc"/>
						<portlet:param name="libelle_credit" value="${libelle_credit}"/>
						<portlet:param name="ligne_budgetaire" value="${ligne_budgetaire}"/>
						<portlet:param name="pers" value="${pers}"/>
				</portlet:renderURL>
                   <td align="center">N° de pièce
                   <c:choose>
					      <c:when test="${colonne == 'NUMERO' && sens == 'asc'}">
					      	<a href="${renderURL_DM_numeroAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc-actif.png"></a>&nbsp;
					      	<a href="${renderURL_DM_numeroDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc.png"></a>
					      </c:when>
						  <c:when test="${colonne == 'NUMERO' && sens == 'desc'}">
					      	<a href="${renderURL_DM_numeroAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc.png"></a>&nbsp;
					      	<a href="${renderURL_DM_numeroDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc-actif.png"></a>
					      </c:when>						
					      <c:otherwise>
					      	<a href="${renderURL_DM_numeroAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc.png"></a>&nbsp;
					      	<a href="${renderURL_DM_numeroDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc.png"></a>					      
					      </c:otherwise>
					</c:choose>	
                   </td>
                   <portlet:renderURL var="renderURL_DM_libelleAsc">
						<portlet:param name="action" value="detailsDM"/>
						<portlet:param name="credit" value="${credit}"/>
						<portlet:param name="organigramme" value="${organigramme}"/>
						<portlet:param name="page" value="${pageC}"/>
						<portlet:param name="colonne" value="LIBELLE"/>
						<portlet:param name="sens" value="asc"/>
						<portlet:param name="libelle_credit" value="${libelle_credit}"/>
						<portlet:param name="ligne_budgetaire" value="${ligne_budgetaire}"/>
						<portlet:param name="pers" value="${pers}"/>
				</portlet:renderURL>
				<portlet:renderURL var="renderURL_DM_libelleDesc">
						<portlet:param name="action" value="detailsDM"/>
						<portlet:param name="credit" value="${credit}"/>
						<portlet:param name="organigramme" value="${organigramme}"/>
						<portlet:param name="page" value="${pageC}"/>
						<portlet:param name="colonne" value="LIBELLE"/>
						<portlet:param name="sens" value="desc"/>
						<portlet:param name="libelle_credit" value="${libelle_credit}"/>
						<portlet:param name="ligne_budgetaire" value="${ligne_budgetaire}"/>
						<portlet:param name="pers" value="${pers}"/>
				</portlet:renderURL>
                   <td align="center">Référence facture
                   <c:choose>
					      <c:when test="${colonne == 'LIBELLE' && sens == 'asc'}">
					      	<a href="${renderURL_DM_libelleAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc-actif.png"></a>&nbsp;
					      	<a href="${renderURL_DM_libelleDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc.png"></a>
					      </c:when>
						  <c:when test="${colonne == 'LIBELLE' && sens == 'desc'}">
					      	<a href="${renderURL_DM_libelleAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc.png"></a>&nbsp;
					      	<a href="${renderURL_DM_libelleDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc-actif.png"></a>
					      </c:when>						
					      <c:otherwise>
					      	<a href="${renderURL_DM_libelleAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc.png"></a>&nbsp;
					      	<a href="${renderURL_DM_libelleDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc.png"></a>					      
					      </c:otherwise>
					</c:choose>	
					</td>
					<portlet:renderURL var="renderURL_DM_fournisseurAsc">
						<portlet:param name="action" value="detailsDM"/>
						<portlet:param name="credit" value="${credit}"/>
						<portlet:param name="organigramme" value="${organigramme}"/>
						<portlet:param name="page" value="${pageC}"/>
						<portlet:param name="colonne" value="FOURNISSEUR"/>
						<portlet:param name="sens" value="asc"/>
						<portlet:param name="libelle_credit" value="${libelle_credit}"/>
						<portlet:param name="ligne_budgetaire" value="${ligne_budgetaire}"/>
						<portlet:param name="pers" value="${pers}"/>
				</portlet:renderURL>
				<portlet:renderURL var="renderURL_DM_fournisseurDesc">
						<portlet:param name="action" value="detailsDM"/>
						<portlet:param name="credit" value="${credit}"/>
						<portlet:param name="organigramme" value="${organigramme}"/>
						<portlet:param name="page" value="${pageC}"/>
						<portlet:param name="colonne" value="FOURNISSEUR"/>
						<portlet:param name="sens" value="desc"/>
						<portlet:param name="libelle_credit" value="${libelle_credit}"/>
						<portlet:param name="ligne_budgetaire" value="${ligne_budgetaire}"/>
						<portlet:param name="pers" value="${pers}"/>
				</portlet:renderURL>
                   <td align="center">Fournisseur
                   <c:choose>
					      <c:when test="${colonne == 'FOURNISSEUR' && sens == 'asc'}">
					      	<a href="${renderURL_DM_fournisseurAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc-actif.png"></a>&nbsp;
					      	<a href="${renderURL_DM_fournisseurDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc.png"></a>
					      </c:when>
						  <c:when test="${colonne == 'FOURNISSEUR' && sens == 'desc'}">
					      	<a href="${renderURL_DM_fournisseurAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc.png"></a>&nbsp;
					      	<a href="${renderURL_DM_fournisseurDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc-actif.png"></a>
					      </c:when>						
					      <c:otherwise>
					      	<a href="${renderURL_DM_fournisseurAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc.png"></a>&nbsp;
					      	<a href="${renderURL_DM_fournisseurDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc.png"></a>					      
					      </c:otherwise>
					</c:choose>	
                   </td>
                   <portlet:renderURL var="renderURL_DM_montanthtliqAsc">
						<portlet:param name="action" value="detailsDM"/>
						<portlet:param name="credit" value="${credit}"/>
						<portlet:param name="organigramme" value="${organigramme}"/>
						<portlet:param name="page" value="${pageC}"/>
						<portlet:param name="colonne" value="MONTANT_HT_LIQUIDE"/>
						<portlet:param name="sens" value="asc"/>
						<portlet:param name="libelle_credit" value="${libelle_credit}"/>
						<portlet:param name="ligne_budgetaire" value="${ligne_budgetaire}"/>
						<portlet:param name="pers" value="${pers}"/>
				</portlet:renderURL>
				<portlet:renderURL var="renderURL_DM_montanthtliqDesc">
						<portlet:param name="action" value="detailsDM"/>
						<portlet:param name="credit" value="${credit}"/>
						<portlet:param name="organigramme" value="${organigramme}"/>
						<portlet:param name="page" value="${pageC}"/>
						<portlet:param name="colonne" value="MONTANT_HT_LIQUIDE"/>
						<portlet:param name="sens" value="desc"/>
						<portlet:param name="libelle_credit" value="${libelle_credit}"/>
						<portlet:param name="ligne_budgetaire" value="${ligne_budgetaire}"/>
						<portlet:param name="pers" value="${pers}"/>
				</portlet:renderURL>
                   <td align="center">Montant liquidé HT
                    <c:choose>
					      <c:when test="${colonne == 'MONTANT_HT_LIQUIDE' && sens == 'asc'}">
					      	<a href="${renderURL_DM_montanthtliqAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc-actif.png"></a>&nbsp;
					      	<a href="${renderURL_DM_montanthtliqDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc.png"></a>
					      </c:when>
						  <c:when test="${colonne == 'MONTANT_HT_LIQUIDE' && sens == 'desc'}">
					      	<a href="${renderURL_DM_montanthtliqAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc.png"></a>&nbsp;
					      	<a href="${renderURL_DM_montanthtliqDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc-actif.png"></a>
					      </c:when>						
					      <c:otherwise>
					      	<a href="${renderURL_DM_montanthtliqAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc.png"></a>&nbsp;
					      	<a href="${renderURL_DM_montanthtliqDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc.png"></a>					      
					      </c:otherwise>
					</c:choose>	
                   </td>
                   <portlet:renderURL var="renderURL_DM_montantttcliqAsc">
						<portlet:param name="action" value="detailsDM"/>
						<portlet:param name="credit" value="${credit}"/>
						<portlet:param name="organigramme" value="${organigramme}"/>
						<portlet:param name="page" value="${pageC}"/>
						<portlet:param name="colonne" value="MONTANT_TTC_LIQUIDE"/>
						<portlet:param name="sens" value="asc"/>
						<portlet:param name="libelle_credit" value="${libelle_credit}"/>
						<portlet:param name="ligne_budgetaire" value="${ligne_budgetaire}"/>
						<portlet:param name="pers" value="${pers}"/>
				</portlet:renderURL>
				<portlet:renderURL var="renderURL_DM_montantttcliqDesc">
						<portlet:param name="action" value="detailsDM"/>
						<portlet:param name="credit" value="${credit}"/>
						<portlet:param name="organigramme" value="${organigramme}"/>
						<portlet:param name="page" value="${pageC}"/>
						<portlet:param name="colonne" value="MONTANT_TTC_LIQUIDE"/>
						<portlet:param name="sens" value="desc"/>
						<portlet:param name="libelle_credit" value="${libelle_credit}"/>
						<portlet:param name="ligne_budgetaire" value="${ligne_budgetaire}"/>
						<portlet:param name="pers" value="${pers}"/>
				</portlet:renderURL>
                   <td align="center">Montant liquidé TTC
                    <c:choose>
					      <c:when test="${colonne == 'MONTANT_TTC_LIQUIDE' && sens == 'asc'}">
					      	<a href="${renderURL_DM_montantttcliqAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc-actif.png"></a>&nbsp;
					      	<a href="${renderURL_DM_montantttcliqDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc.png"></a>
					      </c:when>
						  <c:when test="${colonne == 'MONTANT_TTC_LIQUIDE' && sens == 'desc'}">
					      	<a href="${renderURL_DM_montantttcliqAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc.png"></a>&nbsp;
					      	<a href="${renderURL_DM_montantttcliqDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc-actif.png"></a>
					      </c:when>						
					      <c:otherwise>
					      	<a href="${renderURL_DM_montantttcliqAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc.png"></a>&nbsp;
					      	<a href="${renderURL_DM_montantttcliqDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc.png"></a>					      
					      </c:otherwise>
					</c:choose>	
                   </td>
                   <portlet:renderURL var="renderURL_DM_montantbudgliqAsc">
						<portlet:param name="action" value="detailsDM"/>
						<portlet:param name="credit" value="${credit}"/>
						<portlet:param name="organigramme" value="${organigramme}"/>
						<portlet:param name="page" value="${pageC}"/>
						<portlet:param name="colonne" value="MONTANT_BUDGETAIRE_LIQUIDE"/>
						<portlet:param name="sens" value="asc"/>
						<portlet:param name="libelle_credit" value="${libelle_credit}"/>
						<portlet:param name="ligne_budgetaire" value="${ligne_budgetaire}"/>
						<portlet:param name="pers" value="${pers}"/>
				</portlet:renderURL>
				<portlet:renderURL var="renderURL_DM_montantbudgliqDesc">
						<portlet:param name="action" value="detailsDM"/>
						<portlet:param name="credit" value="${credit}"/>
						<portlet:param name="organigramme" value="${organigramme}"/>
						<portlet:param name="page" value="${pageC}"/>
						<portlet:param name="colonne" value="MONTANT_BUDGETAIRE_LIQUIDE"/>
						<portlet:param name="sens" value="desc"/>
						<portlet:param name="libelle_credit" value="${libelle_credit}"/>
						<portlet:param name="ligne_budgetaire" value="${ligne_budgetaire}"/>
						<portlet:param name="pers" value="${pers}"/>
				</portlet:renderURL>
                   <td align="center">Montant budgétaire liquidé
                    <c:choose>
					      <c:when test="${colonne == 'MONTANT_BUDGETAIRE_LIQUIDE' && sens == 'asc'}">
					      	<a href="${renderURL_DM_montantbudgliqAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc-actif.png"></a>&nbsp;
					      	<a href="${renderURL_DM_montantbudgliqDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc.png"></a>
					      </c:when>
						  <c:when test="${colonne == 'MONTANT_BUDGETAIRE_LIQUIDE' && sens == 'desc'}">
					      	<a href="${renderURL_DM_montantbudgliqAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc.png"></a>&nbsp;
					      	<a href="${renderURL_DM_montantbudgliqDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc-actif.png"></a>
					      </c:when>						
					      <c:otherwise>
					      	<a href="${renderURL_DM_montantbudgliqAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc.png"></a>&nbsp;
					      	<a href="${renderURL_DM_montantbudgliqDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc.png"></a>					      
					      </c:otherwise>
					</c:choose>	
                   </td>
                    <portlet:renderURL var="renderURL_DM_statutAsc">
						<portlet:param name="action" value="detailsDM"/>
						<portlet:param name="credit" value="${credit}"/>
						<portlet:param name="organigramme" value="${organigramme}"/>
						<portlet:param name="page" value="${pageC}"/>
						<portlet:param name="colonne" value="ETAT"/>
						<portlet:param name="sens" value="asc"/>
						<portlet:param name="libelle_credit" value="${libelle_credit}"/>
						<portlet:param name="ligne_budgetaire" value="${ligne_budgetaire}"/>
						<portlet:param name="pers" value="${pers}"/>
				</portlet:renderURL>
				<portlet:renderURL var="renderURL_DM_statutDesc">
						<portlet:param name="action" value="detailsDM"/>
						<portlet:param name="credit" value="${credit}"/>
						<portlet:param name="organigramme" value="${organigramme}"/>
						<portlet:param name="page" value="${pageC}"/>
						<portlet:param name="colonne" value="ETAT"/>
						<portlet:param name="sens" value="desc"/>
						<portlet:param name="libelle_credit" value="${libelle_credit}"/>
						<portlet:param name="ligne_budgetaire" value="${ligne_budgetaire}"/>
						<portlet:param name="pers" value="${pers}"/>
				</portlet:renderURL>
                   <td align="center">Statut
                    <c:choose>
					      <c:when test="${colonne == 'ETAT' && sens == 'asc'}">
					      	<a href="${renderURL_DM_statutAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc-actif.png"></a>&nbsp;
					      	<a href="${renderURL_DM_statutDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc.png"></a>
					      </c:when>
						  <c:when test="${colonne == 'ETAT' && sens == 'desc'}">
					      	<a href="${renderURL_DM_statutAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc.png"></a>&nbsp;
					      	<a href="${renderURL_DM_statutDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc-actif.png"></a>
					      </c:when>						
					      <c:otherwise>
					      	<a href="${renderURL_DM_statutAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc.png"></a>&nbsp;
					      	<a href="${renderURL_DM_statutDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc.png"></a>					      
					      </c:otherwise>
					</c:choose>	
                   </td>
               </tr> 
                <c:set var="numero_courant" value="" /> 
                <c:set var="typepiece_courant" value="" />
                <c:set var="totalht" value="0" />
				<c:set var="totalttc" value="0" />
				<c:set var="totalbudg" value="0" />	 
				<c:set var="test_cumul" value="0" /> 		

				 
					<c:forEach items="${listeDepenseMandats}" var="element">
					<tr>
				      		<td>${element.TYPE_PIECE}</td>
				       		<td>${element.NUMERO}</td>
				       		<td>${element.LIBELLE}</td>
				       		<td>${element.FOURNISSEUR}</td>
				       		<c:set var="ht"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${element.MONTANT_HT_LIQUIDE}"/></c:set>
				       		<c:set var="ttc"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${element.MONTANT_TTC_LIQUIDE}"/></c:set>
				       		<c:set var="budg"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${element.MONTANT_BUDGETAIRE_LIQUIDE}"/></c:set>
				       		<td align="right">${ht}</td>
				       		<td align="right">${ttc}</td>
				       		<td align="right">${budg}</td>
				       		<td>${element.ETAT}</td>
						</tr> 
						</c:forEach>          
             </table>
	       </div>
	       <div class="portlet-section-body">
	      Page(s) : <c:if test="${pageC - 1 > 0}">
		       <portlet:renderURL var="renderURL_DMPrec">
					<portlet:param name="action" value="detailsDM"/>
					<portlet:param name="page" value="${pageC -1}"/>
					<portlet:param name="credit" value="${credit}"/>
					<portlet:param name="organigramme" value="${organigramme}"/>
					<portlet:param name="libelle_credit" value="${libelle_credit}"/>
					<portlet:param name="colonne" value="${colonne}"/>
					<portlet:param name="sens" value="${sens}"/>
					<portlet:param name="ligne_budgetaire" value="${ligne_budgetaire}"/>
					<portlet:param name="pers" value="${pers}"/>
				</portlet:renderURL>
				<a href="${renderURL_DMPrec}">${pageC -1}</a> - 
			</c:if>
			${pageC}
			<c:if test="${pageC + 1 <= nb_pages}">
			<portlet:renderURL var="renderURL_DMSuiv">
				<portlet:param name="action" value="detailsDM"/>
				<portlet:param name="page" value="${pageC +1}"/>
				<portlet:param name="credit" value="${credit}"/>
				<portlet:param name="organigramme" value="${organigramme}"/>
				<portlet:param name="libelle_credit" value="${libelle_credit}"/>
				<portlet:param name="colonne" value="${colonne}"/>
				<portlet:param name="sens" value="${sens}"/>
				<portlet:param name="ligne_budgetaire" value="${ligne_budgetaire}"/>
				<portlet:param name="pers" value="${pers}"/>
			</portlet:renderURL>
			 - <a href="${renderURL_DMSuiv}">${pageC +1}</a>
			</c:if>
			<c:if test="${pageC + 2 <= nb_pages}">
			 - ..
			</c:if>
			</div>
		</div>
		</div>
	<%@ include file="/WEB-INF/jsp/footer.jsp"%>
</div>

<input type="hidden" name="nb" id="nb" value="${nb}"/>
<input type="hidden" name="token" id="token" value="${token}"/>
<input type="hidden" name="muscade_url" id="muscade_url" value="${muscade_url}"/>
<input type="hidden" name="caslogin_url" id="caslogin_url" value="${caslogin_url}"/>
