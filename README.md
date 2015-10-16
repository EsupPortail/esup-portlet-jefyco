# esup-portlet-jefyco
Avant ce déploiement, il faudra installer le module Muscade de Cocktail qui inclut les webservices nécessaires

Une fois la portlet installée il faudra modifier le fichier esup-portlet-jefyco/WEB-INF/classes/config.properties

Il est important de noter qu'il faut que votre ENT soit en https (avec un certificat valide) et ait le Proxy Cas d'activé.

Si vous avez plusieurs instances ENT, il faudra modifier 2 paramètres de ce fichier pour chacune d'entre elles :
par exemple :
public.host=http://ent-1.univ-xxx.fr
public.hostSSL=https://ent-1.univ-xxx.fr

public.host=http://ent-2.univ-xxx.fr
public.hostSSL=https://ent-2.univ-xxx.fr
 
Le paramètre muscade.url.exterieur a été ajouté pour permettre d'appeler (et utiliser) l'application hors du domaine de l'université (via une configuration/installation qui reste à votre charge). Si votre Jefyco est déjà accessible depuis l'extérieur il suffit de saisir la même chose que pour le paramètre muscade.url

ant portlet.deploy -DportletApp=/[...]/esup-portlet-jefyco.war
