package org.esupportail.jefyco.portlet.services.auth;


import java.util.Map;
import org.esupportail.commons.utils.ContextUtils;
import org.esupportail.commons.services.cas.AbstractCasService;
import org.esupportail.commons.services.cas.CasException;

/** 
 * The implementation of CasService for portlets. The PGT is supposed 
 * to be passed to the portlet as a preferences attribute.
 */
public class PortletCasServiceImpl extends AbstractCasService {
	
	/**
	 * The serialization id.
	 */
	private static final long serialVersionUID = 7540349970957963666L;

	/**
	 * @see org.esupportail.commons.services.cas.AbstractCasService#getProxyTicket(java.lang.String)
	 */
	public String getProxyTicket(String targetService) throws CasException {
		Map<String,String> userInfo = (Map<String,String>) ContextUtils.getGlobalSessionAttribute("javax.portlet.userinfo");
		String proxyTicket = userInfo.get("casProxyTicket");
		return proxyTicket;
	}

	@Override
	protected String getServiceTicket() {
		// TODO Auto-generated method stub
		return null;
	}

}
