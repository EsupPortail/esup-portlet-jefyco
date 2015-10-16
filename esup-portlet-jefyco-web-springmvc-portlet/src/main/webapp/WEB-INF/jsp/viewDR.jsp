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
	       	<table border="1px" bordercolor="black" width=100% align="center">
	       	<tr>
	       		<td>
		       		<table border="0px" bordercolor="black" width=100% align="center">
	                <tr>
	                	<td colspan="5"><h4 class="portlet-section-subheader" role="heading">Disponible budgétaire <span id="ligne_budgetaire"></span></h4></td>
	                </tr>
	                <script type="text/javascript">               
		              affiche_ligne_budgetaire();
		             </script>
	                <tr class="portlet-table-header">
	                    <td> </td>
	                    <td align="center">Personnel</td>
	                    <td align="center">Fonctionnement</td>
	                    <td align="center">Investissement</td>
	                    <td align="center">Total</td>
	                </tr>
	                                
		       		<c:forEach items="${listeDepenseSyntheses}" var="element">
		       		<c:if test="${element.CREDITS == '10'}">	
							<c:set var="fonctionnement_creditouvert" value="${element.creditsouverts}" />
							<c:set var="fonctionnementcreditouvert"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${fonctionnement_creditouvert}"/></c:set>
							
							<c:set var="fonctionnement_mandate" value="${element.mandate}" />
							<c:set var="fonctionnementmandate"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${fonctionnement_mandate}"/></c:set>
							
							<c:set var="fonctionnement_resteengage" value="${element.engage}" />
							<c:set var="fonctionnementresteengage"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${fonctionnement_resteengage}"/></c:set>
							
							<c:set var="fonctionnement_disponible" value="${element.disponible}" />
							<c:set var="fonctionnementdisponible"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${fonctionnement_disponible}"/></c:set>
					</c:if>
						<c:if test="${element.CREDITS == '20'}">						
							<c:set var="equipement_creditouvert" value="${element.creditsouverts}" />
							<c:set var="equipementcreditouvert"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${equipement_creditouvert}"/></c:set>
														
							<c:set var="equipement_mandate" value="${element.mandate}" />
							<c:set var="equipementmandate"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${equipement_mandate}"/></c:set>
														
							<c:set var="equipement_resteengage" value="${element.engage}" />
							<c:set var="equipementresteengage"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${equipement_resteengage}"/></c:set>
							
							<c:set var="equipement_disponible" value="${element.disponible}" />
							<c:set var="equipementdisponible"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${equipement_disponible}"/></c:set>												
						</c:if>
						<c:if test="${element.CREDITS == '30'}">	
							<c:set var="personnel_creditouvert" value="${element.creditsouverts}" />
							<c:set var="personnelcreditouvert"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${personnel_creditouvert}"/></c:set>
														
							<c:set var="personnel_mandate" value="${element.mandate}" />
							<c:set var="personnelmandate"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${personnel_mandate}"/></c:set>
							
							<c:set var="personnel_resteengage" value="${element.engage}" />
							<c:set var="personnelresteengage"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${personnel_resteengage}"/></c:set>
							
							<c:set var="personnel_disponible" value="${element.disponible}" />
							<c:set var="personneldisponible"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${personnel_disponible}"/></c:set>
												
						</c:if>				
	                </c:forEach>
	                <c:set var="total_creditouvert" value="${fonctionnement_creditouvert + equipement_creditouvert + personnel_creditouvert}" />
	                <c:set var="totalcreditouvert"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${total_creditouvert}"/></c:set>
							
	                <c:set var="total_mandate" value="${fonctionnement_mandate + equipement_mandate + personnel_mandate}" />
	                <c:set var="totalmandate"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${total_mandate}"/></c:set>
							
	                <c:set var="total_resteengage" value="${fonctionnement_resteengage + equipement_resteengage + personnel_resteengage}" />
	                <c:set var="totalresteengage"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${total_resteengage}"/></c:set>
							
	                <c:set var="total_disponible" value="${fonctionnement_disponible + equipement_disponible + personnel_disponible}" />
	                <c:set var="totaldisponible"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${total_disponible}"/></c:set>
							
	                
	                <tr>
	                    <td>Crédits ouverts</td>
	                    <td align="right">${personnelcreditouvert}</td>
	                    <td align="right">${fonctionnementcreditouvert}</td>
	                    <td align="right">${equipementcreditouvert}</td>
	                    <td align="right">${totalcreditouvert}</td>
	                </tr>
	                <tr>
	                    <td>Montants mandatés</td>
	                    <td align="right">${personnelmandate}</td>
	                    <td align="right">${fonctionnementmandate}</td>
	                    <td align="right">${equipementmandate}</td>
	                    <td align="right">${totalmandate}</td>
	                </tr>
	                <tr>
	                    <td>Reste engagé</td>
	                    <td align="right">${personnelresteengage}</td>
	                    <td align="right">${fonctionnementresteengage}</td>
	                    <td align="right">${equipementresteengage}</td>
	                    <td align="right">${totalresteengage}</td>
	                </tr>
	                <tr>
	                    <td>Disponible</td>
	                    <td align="right">${personneldisponible}</td>
	                    <td align="right">${fonctionnementdisponible}</td>
	                    <td align="right">${equipementdisponible}</td>
	                    <td align="right">${totaldisponible}</td>
	                </tr>
	                
	                </table>
	               </td>
	               <td>
	               	<table border="0px" bordercolor="black" width=100% align="center" style="margin-top:-27px">
	               		<tr>
	                		<td colspan="2"><h4 class="portlet-section-subheader" role="heading">Reste à réaliser (recettes)</h3></td>
	                	</tr>
	                	<tr class="portlet-table-header">
	                    	<td colspan="2">&nbsp;</td>
	                	</tr>
	               		<c:forEach items="${listeRecetteSyntheses}" var="element2">
	               			<c:set var="objectifs_recette" value="${objectifs_recette + element2.creditsouverts}" />
	               			<c:set var="titres_emis" value="${titres_emis + element2.titre}" />
	               			<c:set var="reste_realiser" value="${reste_realiser + element2.restearealiser}" />			
	                	</c:forEach>
	                	<c:set var="objectifsrecette"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${objectifs_recette}"/></c:set>
						<c:set var="titresemis"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${titres_emis}"/></c:set>
						<c:set var="resterealiser"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${reste_realiser}"/></c:set>
					
	                	<tr>
		                    <td>Objectifs de recette</td>
		                    <td align="right">${objectifsrecette}</td>
	                	</tr>
	                	<tr>
		                    <td>Titres</td>
		                    <td align="right">${titresemis}</td>
	                	</tr>
	                	<tr>
	                		<c:if test="${reste_realiser < 0}">
	                			<c:set var="reste_realiser2" value="${reste_realiser * -1}" />
	                			<c:set var="resterealiser2"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${reste_realiser2}"/></c:set>
					
			                    <td>Reste à réaliser<br />Excédent</td>
			                    <td align="right">0.00<br />${resterealiser2}</td>
		                    </c:if>		                    
		                    <c:if test="${reste_realiser >= 0 || reste_realiser=='' || reste_realiser==null}">
			                    <td>Reste à réaliser</td>
			                    <td align="right">${resterealiser}</td>
			                </c:if>		                    
	                	</tr>
	               	</table>
	               </td>
	        	</tr>
	       	</table>
	       </div>
		</div>
		</div>
	<%@ include file="/WEB-INF/jsp/footer.jsp"%>
</div>

<input type="hidden" name="token" id="token" value="${token}"/>
<input type="hidden" name="muscade_url" id="muscade_url" value="${muscade_url}"/>
<input type="hidden" name="caslogin_url" id="caslogin_url" value="${caslogin_url}"/>
