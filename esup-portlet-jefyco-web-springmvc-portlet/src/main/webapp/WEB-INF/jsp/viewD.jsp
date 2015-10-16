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
			       <portlet:renderURL var="renderURL_DPrec">
						<portlet:param name="action" value="affichageD"/>
						<portlet:param name="page" value="${pageC -1}"/>
					</portlet:renderURL>
					<a href="${renderURL_DPrec}">${pageC -1}</a> - 
				</c:if>
				${pageC}
				<c:if test="${pageC + 1 <= nb_pages}">
				<portlet:renderURL var="renderURL_DSuiv">
					<portlet:param name="action" value="affichageD"/>
					<portlet:param name="page" value="${pageC +1}"/>
				</portlet:renderURL>
				 - <a href="${renderURL_DSuiv}">${pageC +1}</a>
				</c:if>
				<c:if test="${pageC + 2 <= nb_pages}">
				 - ..
				</c:if>
				&nbsp;(${nb} résultats)
			</div>
	       <div class="portlet-section-body">
       		<table border="0px" bordercolor="black" width=100% align="center">
               <tr>
               	<td colspan="8"><h4 class="portlet-section-subheader" role="heading">Dépenses <span id="ligne_budgetaire"></span></h4></td>
               </tr>
                <script type="text/javascript">               
		              affiche_ligne_budgetaire();
		             </script>
               <tr class="portlet-table-header">
                   <td align="center">UB</td>
                   <td align="center">CR</td>
                   <td align="center">Sous CR</td>
                   <td align="center">Masse</td>
                   <td align="center">Crédits Ouverts</td>
                   <td align="center">Montant mandaté</td>
                   <td align="center">Reste engagé</td>
                   <td align="center">Disponible</td>
               </tr>
               <c:set var="cr_courant" value="" />
               <c:set var="souscr_courant" value="" />       
       		<c:forEach items="${listeDepenseDetails}" var="element">
       		<c:if test="${((cr_courant != element.ORGANIGRAMME_CR && (cr_courant != '' && element.ORGANIGRAMME_CR != '')) || (souscr_courant != element.ORGANIGRAMME_SOUSCR && (souscr_courant != '' && element.ORGANIGRAMME_SOUSCR != '')))}">
		       		<tr bgcolor="#D6D7D7">
		       			<td>&nbsp;</td>
			       		<td>&nbsp;</td>
			       		<td>&nbsp;</td>
			       		<td>TOTAL</td>
			       		<c:set var="totalcreditouvert"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${total_creditouvert}"/></c:set>
		       			<c:set var="totalmandate"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${total_mandate}"/></c:set>
		       			<c:set var="totalresteengage"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${total_resteengage}"/></c:set>
		       			<c:set var="totaldisponible"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${total_disponible}"/></c:set>
		       		
			       		<td align="right">${totalcreditouvert}</td>
			       		<td align="right">${totalmandate}</td>
			       		<td align="right">${totalresteengage}</td>
			       		<td align="right">${totaldisponible}</td>
			       	</tr>			       	
			       	<c:set var="total_creditouvert" value="0" />
	                <c:set var="total_mandate" value="0" />
	                <c:set var="total_resteengage" value="0" />
	                <c:set var="total_disponible" value="0" /> 
		       	</c:if>
	       		<tr>
			       	<c:set var="total_creditouvert" value="${total_creditouvert + element.creditsouverts}" />
	                <c:set var="total_mandate" value="${total_mandate + element.mandate}" />
	                <c:set var="total_resteengage" value="${total_resteengage + element.engage}" />
	                <c:set var="total_disponible" value="${total_disponible + element.disponible}" />
		       		<c:if test="${element.ORGANIGRAMME_UB != ''}">
		       			<c:set var="ligne_budgetaire" value="${element.ORGANIGRAMME_UB}" />	       		
		       		</c:if>
		       		<c:if test="${element.ORGANIGRAMME_CR != ''}">
		       			<c:set var="ligne_budgetaire" value="${ligne_budgetaire} - ${element.ORGANIGRAMME_CR}" />		       		
		       		</c:if>
		       		<c:if test="${element.ORGANIGRAMME_SOUSCR != ''}">
		       			<c:set var="ligne_budgetaire" value="${ligne_budgetaire} - ${element.ORGANIGRAMME_SOUSCR}" />		       		
		       		</c:if>

		       		
		       		<c:set var="pers" value="" />	
		       		<c:if test="${element.LIBELLE_CREDITS == 'DEPENSES DE PERSONNEL'}">
		       			<c:set var="pers" value="salaire" />		       		
		       		</c:if>
		    	
		       		<td>${element.ORGANIGRAMME_UB}</td>
		       		<td>${element.ORGANIGRAMME_CR}</td>
		       		<td>${element.ORGANIGRAMME_SOUSCR}</td>
		       		<td>${element.LIBELLE_CREDITS}</td>
		       		<portlet:renderURL var="renderURL_DM">
						<portlet:param name="action" value="detailsDM"/>
						<portlet:param name="credit" value="${element.TYPECREDIT_ID}"/>
						<portlet:param name="organigramme" value="${element.ORGANIGRAMME_ID}"/>
						<portlet:param name="page" value="1"/>
						<portlet:param name="colonne" value="NUMERO"/>
						<portlet:param name="sens" value="asc"/>
						<portlet:param name="ligne_budgetaire" value="${ligne_budgetaire}"/>
						<portlet:param name="libelle_credit" value="${element.LIBELLE_CREDITS}"/>
						<portlet:param name="pers" value="${pers}"/>
					</portlet:renderURL>
					<portlet:renderURL var="renderURL_RE">
						<portlet:param name="action" value="detailsRE"/>
						<portlet:param name="credit" value="${element.TYPECREDIT_ID}"/>
						<portlet:param name="organigramme" value="${element.ORGANIGRAMME_ID}"/>
						<portlet:param name="page" value="1"/>
						<portlet:param name="colonne" value="CMDE_NUMERO"/>
						<portlet:param name="sens" value="asc"/>
						<portlet:param name="ligne_budgetaire" value="${ligne_budgetaire}"/>
						<portlet:param name="libelle_credit" value="${element.LIBELLE_CREDITS}"/>
					</portlet:renderURL>
		       		<td align="right">
		       		<c:set var="creditsouverts"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${element.creditsouverts}"/></c:set>
			       	${creditsouverts}      		
		       		</td>
		       		<td align="right">
		       		<c:if test="${element.mandate > 0}">
		       			<a href="${renderURL_DM}"><img name="d&eacute;tails" title="d&eacute;tails" src="/esup-portlet-jefyco/media/images/find.png"></a>
		       		</c:if>
		       		<c:set var="mandate"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${element.mandate}"/></c:set>
		       		&nbsp; ${mandate}
		       		</td>
		       		<td align="right">
		       		<c:if test="${element.engage > 0}">
		       			<a href="${renderURL_RE}"><img name="d&eacute;tails" title="d&eacute;tails" src="/esup-portlet-jefyco/media/images/find.png"></a>
		       		</c:if>
		       		<c:set var="engage"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${element.engage}"/></c:set>
		       		&nbsp; ${engage}
		       		</td>
		       		<td align="right">
		       		<c:set var="disponible"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${element.disponible}"/></c:set>
		       		${disponible}
		       		</td>
	       		</tr>       		
		       	<c:set var="cr_courant" value="${element.ORGANIGRAMME_CR}" />
               	<c:set var="souscr_courant" value="${element.ORGANIGRAMME_SOUSCR}" /> 			
               </c:forEach>
               <tr bgcolor="#D6D7D7">
		       			<td>&nbsp;</td>
			       		<td>&nbsp;</td>
			       		<td>&nbsp;</td>
			       		<td>TOTAL</td>
			       		<c:set var="totalcreditouvert"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${total_creditouvert}"/></c:set>
		       			<c:set var="totalmandate"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${total_mandate}"/></c:set>
		       			<c:set var="totalresteengage"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${total_resteengage}"/></c:set>
		       			<c:set var="totaldisponible"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${total_disponible}"/></c:set>
		       		
			       		<td align="right">${totalcreditouvert}</td>
			       		<td align="right">${totalmandate}</td>
			       		<td align="right">${totalresteengage}</td>
			       		<td align="right">${totaldisponible}</td>
			   </tr>	               	                
             </table>

	       </div>
	       <div class="portlet-section-body">
		       Page(s) : <c:if test="${pageC - 1 > 0}">
			       <portlet:renderURL var="renderURL_DPrec">
						<portlet:param name="action" value="affichageD"/>
						<portlet:param name="page" value="${pageC -1}"/>
					</portlet:renderURL>
					<a href="${renderURL_DPrec}">${pageC -1}</a> - 
				</c:if>
				${pageC}
				<c:if test="${pageC + 1 <= nb_pages}">
				<portlet:renderURL var="renderURL_DSuiv">
					<portlet:param name="action" value="affichageD"/>
					<portlet:param name="page" value="${pageC +1}"/>
				</portlet:renderURL>
				 - <a href="${renderURL_DSuiv}">${pageC +1}</a>
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
