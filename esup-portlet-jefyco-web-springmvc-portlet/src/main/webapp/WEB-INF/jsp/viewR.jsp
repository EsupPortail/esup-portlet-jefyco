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
		       <portlet:renderURL var="renderURL_RPrec">
					<portlet:param name="action" value="affichageR"/>
					<portlet:param name="page" value="${pageC -1}"/>
				</portlet:renderURL>
				<a href="${renderURL_RPrec}">${pageC -1}</a> - 
			</c:if>
			${pageC}
			<c:if test="${pageC + 1 <= nb_pages}">
			<portlet:renderURL var="renderURL_RSuiv">
				<portlet:param name="action" value="affichageR"/>
				<portlet:param name="page" value="${pageC +1}"/>
			</portlet:renderURL>
			 - <a href="${renderURL_RSuiv}">${pageC +1}</a>
			</c:if>
			<c:if test="${pageC + 2 <= nb_pages}">
			 - ..
			</c:if>
			&nbsp;(${nb} résultats)</div>
	       <div class="portlet-section-body">
       		<table border="0px" bordercolor="black" width=100% align="center">
               <tr>
               	<td colspan="9"><h4 class="portlet-section-subheader" role="heading">Recettes <span id="ligne_budgetaire"></span></h4></td>
               </tr>
                <script type="text/javascript">               
		              affiche_ligne_budgetaire();
		             </script>
               <tr class="portlet-table-header">
                   <td align="center">UB</td>
                   <td align="center">CR</td>
                   <td align="center">Sous CR</td>
                   <td align="center">Libellé</td>
                   <td align="center">Libellé crédit</td>
                   <td align="center">Objectifs de recette</td>
                   <td align="center">Titres émis</td>
                   <td align="center">Reste à réaliser</td>
                   <td align="center">Excédent</td>
               </tr>
               <c:set var="cr_courant" value="" />
               <c:set var="souscr_courant" value="" />
               <c:set var="total_objectifsrecette" value="0" />
               <c:set var="total_titreemis" value="0" />
               <c:set var="total_resterealiser" value="0" /> 
               
               <c:set var="totalobjectifsrecette"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${total_objectifsrecette}"/></c:set>
               <c:set var="totaltitreemis"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${total_titreemis}"/></c:set>
                      		  
       		   <c:forEach items="${listeRecetteDetails}" var="element"> 
       		   	<c:set var="total_objectifsrecette" value="0" />
		                <c:set var="total_titreemis" value="0" />
		                <c:set var="total_resterealiser" value="0" />
       		   <c:set var="total_objectifsrecette" value="${total_objectifsrecette + element.MONTANT_CREDITS_OUVERTS}" />
	                
	                
	                <c:set var="total_titreemis" value="${total_titreemis + element.MONTANT_TITRE}" />
	                <c:set var="total_resterealiser" value="${total_resterealiser + element.MONTANT_RESTE_A_REALISER}" />

					<c:set var="totalobjectifsrecette"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${total_objectifsrecette}"/></c:set>
              		<c:set var="totaltitreemis"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${total_titreemis}"/></c:set>
               
      	   		
			       	<c:set var="ub_courant" value="${element.ORGANIGRAMME_UB}" />
			       	<c:set var="cr_courant" value="${element.ORGANIGRAMME_CR}" />
	               	<c:set var="souscr_courant" value="${element.ORGANIGRAMME_SOUSCR}" /> 	
	               	<c:set var="libelle_courant" value="${element.ORGANIGRAMME_LIBELLE}" />	
	               	<c:set var="libelle_credit_courant" value="${element.LIBELLE_CREDITS}" />
	               	
	               	<c:if test="${element.ORGANIGRAMME_UB != ''}">
		       			<c:set var="ligne_budgetaire" value="${element.ORGANIGRAMME_UB}" />	       		
		       		</c:if>
		       		<c:if test="${element.ORGANIGRAMME_CR != ''}">
		       			<c:set var="ligne_budgetaire" value="${ligne_budgetaire} - ${element.ORGANIGRAMME_CR}" />		       		
		       		</c:if>
		       		<c:if test="${element.ORGANIGRAMME_SOUSCR != ''}">
		       			<c:set var="ligne_budgetaire" value="${ligne_budgetaire} - ${element.ORGANIGRAMME_SOUSCR}" />		       		
		       		</c:if>
	               	
	               	<portlet:renderURL var="renderURL_RD">
						<portlet:param name="action" value="detailsR"/>
						<portlet:param name="credits" value="${element.CREDITS}"/>
						<portlet:param name="organigramme" value="${element.ORGANIGRAMME_ID}"/>
						<portlet:param name="page" value="1"/>
						<portlet:param name="ligne_budgetaire" value="${ligne_budgetaire}"/>
						<portlet:param name="libelle_credit" value="${element.LIBELLE_CREDITS}"/>
						<portlet:param name="pers" value="${pers}"/>
						<portlet:param name="colonne" value="NUMERO"/>
						<portlet:param name="sens" value="asc"/>
					</portlet:renderURL>
                
               			<tr>
               			<td>${ub_courant}</td>
				       		<td>${cr_courant}</td>
				       		<td>${souscr_courant}</td>
				       		<td>${libelle_courant}</td>
				       		<td>${libelle_credit_courant}
				       		
				       		</td>
				       		<td align="right">${totalobjectifsrecette}</td>
				       		<td align="right"><c:if test="${element.MONTANT_TITRE > 0}">
				       			<a href="${renderURL_RD}"><img name="d&eacute;tails" title="d&eacute;tails" src="/esup-portlet-jefyco/media/images/find.png"></a>
				       		</c:if>&nbsp;${totaltitreemis}</td>
				       		<c:if test="${total_resterealiser < 0}">
	                			<c:set var="total_resterealiser2" value="${total_resterealiser * -1}" />
	                			<c:set var="totalresterealiser2"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${total_resterealiser2}"/></c:set>
               					<td align="right">		                    
			                    0,00
			                    </td>
			                    <td align="right">		                    
			                    ${totalresterealiser2}
			                    </td>
		                    </c:if>		                    
	                    <c:if test="${total_resterealiser >= 0}">
	                    	<c:set var="totalresterealiser"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${total_resterealiser}"/></c:set>
		                    <td align="right">${totalresterealiser}</td>
		                    <td align="right">0,00</td>
	                    </c:if>
				       	</tr>			       	
				       
		       		
		       			

               </c:forEach>
               		              	                
             </table>

	       </div>
	       <div class="portlet-section-body">
	       Page(s) : <c:if test="${pageC - 1 > 0}">
		       <portlet:renderURL var="renderURL_RPrec">
					<portlet:param name="action" value="affichageR"/>
					<portlet:param name="page" value="${pageC -1}"/>
				</portlet:renderURL>
				<a href="${renderURL_RPrec}">${pageC -1}</a> - 
			</c:if>
			${pageC}
			<c:if test="${pageC + 1 <= nb_pages}">
			<portlet:renderURL var="renderURL_RSuiv">
				<portlet:param name="action" value="affichageR"/>
				<portlet:param name="page" value="${pageC +1}"/>
			</portlet:renderURL>
			 - <a href="${renderURL_RSuiv}">${pageC +1}</a>
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
