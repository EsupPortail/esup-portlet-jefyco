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
		       <portlet:renderURL var="renderURL_RDPrec">
					<portlet:param name="action" value="detailsR"/>
					<portlet:param name="page" value="${pageC -1}"/>
					<portlet:param name="organigramme" value="${organigramme}"/>
					<portlet:param name="libelle_credit" value="${libelle_credit}"/>
					<portlet:param name="credits" value="${credits}"/>
					<portlet:param name="ligne_budgetaire" value="${ligne_budgetaire}"/>
					<portlet:param name="pers" value="${pers}"/>
					<portlet:param name="colonne" value="${colonne}"/>
					<portlet:param name="sens" value="${sens}"/>
				</portlet:renderURL>
				<a href="${renderURL_RDPrec}">${pageC -1}</a> - 
			</c:if>
			${pageC}
			<c:if test="${pageC + 1 <= nb_pages}">
			<portlet:renderURL var="renderURL_RDSuiv">
					<portlet:param name="action" value="detailsR"/>
					<portlet:param name="page" value="${pageC -1}"/>
					<portlet:param name="organigramme" value="${organigramme}"/>
					<portlet:param name="libelle_credit" value="${libelle_credit}"/>
					<portlet:param name="credits" value="${credits}"/>
					<portlet:param name="ligne_budgetaire" value="${ligne_budgetaire}"/>
					<portlet:param name="pers" value="${pers}"/>
					<portlet:param name="colonne" value="${colonne}"/>
					<portlet:param name="sens" value="${sens}"/>
				</portlet:renderURL>
			 - <a href="${renderURL_RDSuiv}">${pageC +1}</a>
			</c:if>
			<c:if test="${pageC + 2 <= nb_pages}">
			 - ..
			</c:if>
			&nbsp;(${nb} résultats)
			</div>
			
			
			
	       <div class="portlet-section-body">
       		<table border="0px" bordercolor="black" width=100% align="center">
               <tr>
               	<td colspan="8"><h4 class="portlet-section-subheader" role="heading">Détails recette en ${libelle_credit} pour la ligne ${ligne_budgetaire} <span id="conv"></span></h4></td>
               </tr>
               
               <script>
	       		if(document.getElementById("convention").value!=""){
	       			document.getElementById("conv").innerHTML = "(Convention : "+document.getElementById("convention").options[document.getElementById("convention").selectedIndex].text+")";
	       		}
       			</script>
               
               <tr class="portlet-table-header">
                   <portlet:renderURL var="renderURL_RD_numeroAsc">
						<portlet:param name="action" value="detailsR"/>
						<portlet:param name="credits" value="${credits}"/>
						<portlet:param name="organigramme" value="${organigramme}"/>
						<portlet:param name="page" value="${pageC}"/>
						<portlet:param name="colonne" value="NUMERO"/>
						<portlet:param name="sens" value="asc"/>
						<portlet:param name="libelle_credit" value="${libelle_credit}"/>
						<portlet:param name="ligne_budgetaire" value="${ligne_budgetaire}"/>
						<portlet:param name="pers" value="${pers}"/>
				</portlet:renderURL>
				<portlet:renderURL var="renderURL_RD_numeroDesc">
						<portlet:param name="action" value="detailsR"/>
						<portlet:param name="credits" value="${credits}"/>
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
					      	<a href="${renderURL_RD_numeroAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc-actif.png"></a>&nbsp;
					      	<a href="${renderURL_RD_numeroDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc.png"></a>
					      </c:when>
						  <c:when test="${colonne == 'NUMERO' && sens == 'desc'}">
					      	<a href="${renderURL_RD_numeroAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc.png"></a>&nbsp;
					      	<a href="${renderURL_RD_numeroDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc-actif.png"></a>
					      </c:when>						
					      <c:otherwise>
					      	<a href="${renderURL_RD_numeroAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc.png"></a>&nbsp;
					      	<a href="${renderURL_RD_numeroDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc.png"></a>					      
					      </c:otherwise>
					</c:choose>	
                   </td>
                   <portlet:renderURL var="renderURL_RD_fournisseurAsc">
						<portlet:param name="action" value="detailsR"/>
						<portlet:param name="credits" value="${credits}"/>
						<portlet:param name="organigramme" value="${organigramme}"/>
						<portlet:param name="page" value="${pageC}"/>
						<portlet:param name="colonne" value="FOURNISSEUR"/>
						<portlet:param name="sens" value="asc"/>
						<portlet:param name="libelle_credit" value="${libelle_credit}"/>
						<portlet:param name="ligne_budgetaire" value="${ligne_budgetaire}"/>
						<portlet:param name="pers" value="${pers}"/>
				</portlet:renderURL>
				<portlet:renderURL var="renderURL_RD_fournisseurDesc">
						<portlet:param name="action" value="detailsR"/>
						<portlet:param name="credits" value="${credits}"/>
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
					      	<a href="${renderURL_RD_fournisseurAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc-actif.png"></a>&nbsp;
					      	<a href="${renderURL_RD_fournisseurDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc.png"></a>
					      </c:when>
						  <c:when test="${colonne == 'FOURNISSEUR' && sens == 'desc'}">
					      	<a href="${renderURL_RD_fournisseurAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc.png"></a>&nbsp;
					      	<a href="${renderURL_RD_fournisseurDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc-actif.png"></a>
					      </c:when>						
					      <c:otherwise>
					      	<a href="${renderURL_RD_fournisseurAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc.png"></a>&nbsp;
					      	<a href="${renderURL_RD_fournisseurDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc.png"></a>					      
					      </c:otherwise>
					</c:choose>	
                   </td>
                   	<portlet:renderURL var="renderURL_RD_typepieceAsc">
						<portlet:param name="action" value="detailsR"/>
						<portlet:param name="credits" value="${credits}"/>
						<portlet:param name="organigramme" value="${organigramme}"/>
						<portlet:param name="page" value="${pageC}"/>
						<portlet:param name="colonne" value="TYPE_PIECE"/>
						<portlet:param name="sens" value="asc"/>
						<portlet:param name="libelle_credit" value="${libelle_credit}"/>
						<portlet:param name="ligne_budgetaire" value="${ligne_budgetaire}"/>
						<portlet:param name="pers" value="${pers}"/>
						
				</portlet:renderURL>
				<portlet:renderURL var="renderURL_RD_typepieceDesc">
						<portlet:param name="action" value="detailsR"/>
						<portlet:param name="credits" value="${credits}"/>
						<portlet:param name="organigramme" value="${organigramme}"/>
						<portlet:param name="page" value="${pageC}"/>
						<portlet:param name="colonne" value="TYPE_PIECE"/>
						<portlet:param name="sens" value="desc"/>
						<portlet:param name="libelle_credit" value="${libelle_credit}"/>
						<portlet:param name="ligne_budgetaire" value="${ligne_budgetaire}"/>
						<portlet:param name="pers" value="${pers}"/>
				</portlet:renderURL>
                   <td align="center">Type pièce
                   <c:choose>
					      <c:when test="${colonne == 'TYPE_PIECE' && sens == 'asc'}">
					      	<a href="${renderURL_RD_typepieceAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc-actif.png"></a>&nbsp;
					      	<a href="${renderURL_RD_typepieceDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc.png"></a>
					      </c:when>
						  <c:when test="${colonne == 'TYPE_PIECE' && sens == 'desc'}">
					      	<a href="${renderURL_RD_typepieceAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc.png"></a>&nbsp;
					      	<a href="${renderURL_RD_typepieceDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc-actif.png"></a>
					      </c:when>						
					      <c:otherwise>
					      	<a href="${renderURL_RD_typepieceAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc.png"></a>&nbsp;
					      	<a href="${renderURL_RD_typepieceDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc.png"></a>					      
					      </c:otherwise>
					</c:choose>	
					</td>
                   <portlet:renderURL var="renderURL_RD_libelleAsc">
						<portlet:param name="action" value="detailsR"/>
						<portlet:param name="credits" value="${credits}"/>
						<portlet:param name="organigramme" value="${organigramme}"/>
						<portlet:param name="page" value="${pageC}"/>
						<portlet:param name="colonne" value="LIBELLE"/>
						<portlet:param name="sens" value="asc"/>
						<portlet:param name="libelle_credit" value="${libelle_credit}"/>
						<portlet:param name="ligne_budgetaire" value="${ligne_budgetaire}"/>
						<portlet:param name="pers" value="${pers}"/>
				</portlet:renderURL>
				<portlet:renderURL var="renderURL_RD_libelleDesc">
						<portlet:param name="action" value="detailsR"/>
						<portlet:param name="credits" value="${credits}"/>
						<portlet:param name="organigramme" value="${organigramme}"/>
						<portlet:param name="page" value="${pageC}"/>
						<portlet:param name="colonne" value="LIBELLE"/>
						<portlet:param name="sens" value="desc"/>
						<portlet:param name="libelle_credit" value="${libelle_credit}"/>
						<portlet:param name="ligne_budgetaire" value="${ligne_budgetaire}"/>
						<portlet:param name="pers" value="${pers}"/>
				</portlet:renderURL>
                   <td align="center">Libellé
                   <c:choose>
					      <c:when test="${colonne == 'LIBELLE' && sens == 'asc'}">
					      	<a href="${renderURL_RD_libelleAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc-actif.png"></a>&nbsp;
					      	<a href="${renderURL_RD_libelleDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc.png"></a>
					      </c:when>
						  <c:when test="${colonne == 'LIBELLE' && sens == 'desc'}">
					      	<a href="${renderURL_RD_libelleAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc.png"></a>&nbsp;
					      	<a href="${renderURL_RD_libelleDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc-actif.png"></a>
					      </c:when>						
					      <c:otherwise>
					      	<a href="${renderURL_RD_libelleAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc.png"></a>&nbsp;
					      	<a href="${renderURL_RD_libelleDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc.png"></a>					      
					      </c:otherwise>
					</c:choose>	
					</td>
                   <portlet:renderURL var="renderURL_RD_montantbudgAsc">
						<portlet:param name="action" value="detailsR"/>
						<portlet:param name="credits" value="${credits}"/>
						<portlet:param name="organigramme" value="${organigramme}"/>
						<portlet:param name="page" value="${pageC}"/>
						<portlet:param name="colonne" value="MONTANT_BUDGETAIRE"/>
						<portlet:param name="sens" value="asc"/>
						<portlet:param name="libelle_credit" value="${libelle_credit}"/>
						<portlet:param name="ligne_budgetaire" value="${ligne_budgetaire}"/>
						<portlet:param name="pers" value="${pers}"/>
				</portlet:renderURL>
				<portlet:renderURL var="renderURL_RD_montantbudgDesc">
						<portlet:param name="action" value="detailsR"/>
						<portlet:param name="credits" value="${credits}"/>
						<portlet:param name="organigramme" value="${organigramme}"/>
						<portlet:param name="page" value="${pageC}"/>
						<portlet:param name="colonne" value="MONTANT_BUDGETAIRE"/>
						<portlet:param name="sens" value="desc"/>
						<portlet:param name="libelle_credit" value="${libelle_credit}"/>
						<portlet:param name="ligne_budgetaire" value="${ligne_budgetaire}"/>
						<portlet:param name="pers" value="${pers}"/>
				</portlet:renderURL>
                   <td align="center">Montant budgétaire
                    <c:choose>
					      <c:when test="${colonne == 'MONTANT_BUDGETAIRE' && sens == 'asc'}">
					      	<a href="${renderURL_RD_montantbudgAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc-actif.png"></a>&nbsp;
					      	<a href="${renderURL_RD_montantbudgDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc.png"></a>
					      </c:when>
						  <c:when test="${colonne == 'MONTANT_BUDGETAIRE' && sens == 'desc'}">
					      	<a href="${renderURL_RD_montantbudgAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc.png"></a>&nbsp;
					      	<a href="${renderURL_RD_montantbudgDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc-actif.png"></a>
					      </c:when>						
					      <c:otherwise>
					      	<a href="${renderURL_RD_montantbudgAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc.png"></a>&nbsp;
					      	<a href="${renderURL_RD_montantbudgDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc.png"></a>					      
					      </c:otherwise>
					</c:choose>	
                   </td>
                   <portlet:renderURL var="renderURL_RD_montanthtAsc">
						<portlet:param name="action" value="detailsR"/>
						<portlet:param name="credits" value="${credits}"/>
						<portlet:param name="organigramme" value="${organigramme}"/>
						<portlet:param name="page" value="${pageC}"/>
						<portlet:param name="colonne" value="MONTANT_HT"/>
						<portlet:param name="sens" value="asc"/>
						<portlet:param name="libelle_credit" value="${libelle_credit}"/>
						<portlet:param name="ligne_budgetaire" value="${ligne_budgetaire}"/>
						<portlet:param name="pers" value="${pers}"/>
				</portlet:renderURL>
				<portlet:renderURL var="renderURL_RD_montanthtDesc">
						<portlet:param name="action" value="detailsR"/>
						<portlet:param name="credits" value="${credits}"/>
						<portlet:param name="organigramme" value="${organigramme}"/>
						<portlet:param name="page" value="${pageC}"/>
						<portlet:param name="colonne" value="MONTANT_HT"/>
						<portlet:param name="sens" value="desc"/>
						<portlet:param name="libelle_credit" value="${libelle_credit}"/>
						<portlet:param name="ligne_budgetaire" value="${ligne_budgetaire}"/>
						<portlet:param name="pers" value="${pers}"/>
				</portlet:renderURL>
                   <td align="center">Montant HT
                    <c:choose>
					      <c:when test="${colonne == 'MONTANT_HT' && sens == 'asc'}">
					      	<a href="${renderURL_RD_montanthtAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc-actif.png"></a>&nbsp;
					      	<a href="${renderURL_RD_montanthtDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc.png"></a>
					      </c:when>
						  <c:when test="${colonne == 'MONTANT_HT' && sens == 'desc'}">
					      	<a href="${renderURL_RD_montanthtAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc.png"></a>&nbsp;
					      	<a href="${renderURL_RD_montanthtDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc-actif.png"></a>
					      </c:when>						
					      <c:otherwise>
					      	<a href="${renderURL_RD_montanthtAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc.png"></a>&nbsp;
					      	<a href="${renderURL_RD_montanthtDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc.png"></a>					      
					      </c:otherwise>
					</c:choose>	
                   </td>
                   <portlet:renderURL var="renderURL_RD_montantttcAsc">
						<portlet:param name="action" value="detailsR"/>
						<portlet:param name="credits" value="${credits}"/>
						<portlet:param name="organigramme" value="${organigramme}"/>
						<portlet:param name="page" value="${pageC}"/>
						<portlet:param name="colonne" value="MONTANT_TTC"/>
						<portlet:param name="sens" value="asc"/>
						<portlet:param name="libelle_credit" value="${libelle_credit}"/>
						<portlet:param name="ligne_budgetaire" value="${ligne_budgetaire}"/>
						<portlet:param name="pers" value="${pers}"/>
				</portlet:renderURL>
				<portlet:renderURL var="renderURL_RD_montantttcDesc">
						<portlet:param name="action" value="detailsR"/>
						<portlet:param name="credits" value="${credits}"/>
						<portlet:param name="organigramme" value="${organigramme}"/>
						<portlet:param name="page" value="${pageC}"/>
						<portlet:param name="colonne" value="MONTANT_TTC"/>
						<portlet:param name="sens" value="desc"/>
						<portlet:param name="libelle_credit" value="${libelle_credit}"/>
						<portlet:param name="ligne_budgetaire" value="${ligne_budgetaire}"/>
						<portlet:param name="pers" value="${pers}"/>
				</portlet:renderURL>
                   <td align="center">Montant TTC
                    <c:choose>
					      <c:when test="${colonne == 'MONTANT_TTC' && sens == 'asc'}">
					      	<a href="${renderURL_RD_montantttcAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc-actif.png"></a>&nbsp;
					      	<a href="${renderURL_RD_montantttcDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc.png"></a>
					      </c:when>
						  <c:when test="${colonne == 'MONTANT_TTC' && sens == 'desc'}">
					      	<a href="${renderURL_RD_montantttcAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc.png"></a>&nbsp;
					      	<a href="${renderURL_RD_montantttcDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc-actif.png"></a>
					      </c:when>						
					      <c:otherwise>
					      	<a href="${renderURL_RD_montantttcAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc.png"></a>&nbsp;
					      	<a href="${renderURL_RD_montantttcDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc.png"></a>					      
					      </c:otherwise>
					</c:choose>	
                   </td>
                   <portlet:renderURL var="renderURL_RD_statutAsc">
						<portlet:param name="action" value="detailsR"/>
						<portlet:param name="credits" value="${credits}"/>
						<portlet:param name="organigramme" value="${organigramme}"/>
						<portlet:param name="page" value="${pageC}"/>
						<portlet:param name="colonne" value="BOR_DATE_VISAELSE__END"/>
						<portlet:param name="sens" value="asc"/>
						<portlet:param name="libelle_credit" value="${libelle_credit}"/>
						<portlet:param name="ligne_budgetaire" value="${ligne_budgetaire}"/>
						<portlet:param name="pers" value="${pers}"/>
				</portlet:renderURL>
				<portlet:renderURL var="renderURL_RD_statutDesc">
						<portlet:param name="action" value="detailsR"/>
						<portlet:param name="credits" value="${credits}"/>
						<portlet:param name="organigramme" value="${organigramme}"/>
						<portlet:param name="page" value="${pageC}"/>
						<portlet:param name="colonne" value="BOR_DATE_VISAELSE__END"/>
						<portlet:param name="sens" value="desc"/>
						<portlet:param name="libelle_credit" value="${libelle_credit}"/>
						<portlet:param name="ligne_budgetaire" value="${ligne_budgetaire}"/>
						<portlet:param name="pers" value="${pers}"/>
				</portlet:renderURL>
                   <td align="center">Statut
                    <c:choose>
					      <c:when test="${colonne == 'BOR_DATE_VISAELSE__END' && sens == 'asc'}">
					      	<a href="${renderURL_RD_statutAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc-actif.png"></a>&nbsp;
					      	<a href="${renderURL_RD_statutDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc.png"></a>
					      </c:when>
						  <c:when test="${colonne == 'BOR_DATE_VISAELSE__END' && sens == 'desc'}">
					      	<a href="${renderURL_RD_statutAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc.png"></a>&nbsp;
					      	<a href="${renderURL_RD_statutDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc-actif.png"></a>
					      </c:when>						
					      <c:otherwise>
					      	<a href="${renderURL_RD_statutAsc}"><img name="Trier asc" title="Trier asc" src="/esup-portlet-jefyco/media/images/sort-asc.png"></a>&nbsp;
					      	<a href="${renderURL_RD_statutDesc}"><img name="Trier desc" title="Trier desc" src="/esup-portlet-jefyco/media/images/sort-desc.png"></a>					      
					      </c:otherwise>
					</c:choose>	
                   </td>
               </tr>
               
               <c:forEach items="${listeRecetteTitres}" var="element"> 
               <c:set var="montantbudgetaire"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${element.MONTANT_BUDGETAIRE}"/></c:set>
               <c:set var="montantht"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${element.MONTANT_HT}"/></c:set>
               <c:set var="montantttc"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${element.MONTANT_TTC}"/></c:set>       		  
       		   
               		<tr>
			       			<td>${element.NUMERO}</td>
				       		<td>${element.FOURNISSEUR}</td>
				       		<td>${element.TYPE_PIECE}</td>
				       		<td>${element.LIBELLE}</td>
				       		<td align="right">${montantbudgetaire}</td>
				       		<td align="right">${montantht}</td>
				       		<td align="right">${montantttc}</td>
				       		<td>${element.BOR_DATE_VISAELSE__END}</td>
               </c:forEach>
      
             </table>
	       </div>
	       <div class="portlet-section-body">
	      Page(s) : <c:if test="${pageC - 1 > 0}">
		       <portlet:renderURL var="renderURL_RDPrec">
					<portlet:param name="action" value="detailsR"/>
					<portlet:param name="page" value="${pageC -1}"/>
					<portlet:param name="organigramme" value="${organigramme}"/>
					<portlet:param name="libelle_credit" value="${libelle_credit}"/>
					<portlet:param name="credits" value="${credits}"/>
					<portlet:param name="ligne_budgetaire" value="${ligne_budgetaire}"/>
					<portlet:param name="pers" value="${pers}"/>
					<portlet:param name="colonne" value="${colonne}"/>
					<portlet:param name="sens" value="${sens}"/>
				</portlet:renderURL>
				<a href="${renderURL_RDPrec}">${pageC -1}</a> - 
			</c:if>
			${pageC}
			<c:if test="${pageC + 1 <= nb_pages}">
			<portlet:renderURL var="renderURL_RDSuiv">
					<portlet:param name="action" value="detailsR"/>
					<portlet:param name="page" value="${pageC -1}"/>
					<portlet:param name="organigramme" value="${organigramme}"/>
					<portlet:param name="libelle_credit" value="${libelle_credit}"/>
					<portlet:param name="credits" value="${credits}"/>
					<portlet:param name="ligne_budgetaire" value="${ligne_budgetaire}"/>
					<portlet:param name="pers" value="${pers}"/>
					<portlet:param name="colonne" value="${colonne}"/>
					<portlet:param name="sens" value="${sens}"/>
				</portlet:renderURL>
			 - <a href="${renderURL_RDSuiv}">${pageC +1}</a>
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
