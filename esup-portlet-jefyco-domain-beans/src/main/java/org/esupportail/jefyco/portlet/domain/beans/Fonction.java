package org.esupportail.jefyco.portlet.domain.beans;

public class Fonction {
	
	public static double floor(double a, int n) {
		double p = Math.pow(10.0, n);
		return Math.floor((a*p)+0.5) / p;
	}

}
