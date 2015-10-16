<%@ include file="/WEB-INF/jsp/include.jsp"%>

<portlet:renderURL var="renderRefreshUrl" />
<div class="fl-widget portlet" role="section">
    <div class="fl-widget-titlebar portlet-title" role="sectionhead">
  		<h2 role="heading">Consultation Jefyco</h2>
    </div>
	<div class="fl-widget-content portlet-body" role="main">
		<div class="fl-col portlet-toolbar" role="toolbar">
		</div>
		Problème d'authentification, vous n'avez pas les droits nécessaires. ${message_erreur_authentification}
	</div>
	<%@ include file="/WEB-INF/jsp/footer.jsp"%>
</div>
		
