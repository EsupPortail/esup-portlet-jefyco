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
	</div>
	<%@ include file="/WEB-INF/jsp/footer.jsp"%>
</div>
		
<input type="hidden" name="token" id="token" value="${token}"/>
<input type="hidden" name="muscade_url" id="muscade_url" value="${muscade_url}"/>
<input type="hidden" name="caslogin_url" id="caslogin_url" value="${caslogin_url}"/>
