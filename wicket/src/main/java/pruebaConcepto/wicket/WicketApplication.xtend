package pruebaConcepto.wicket

import org.apache.wicket.protocol.http.WebApplication
import pruebaConcepto.wicket.dominio.Materia
import pruebaConcepto.wicket.home.HomeMaterias
import org.uqbar.commons.utils.ApplicationContext
import pruebaConcepto.wicket.home.HomeNivel
import pruebaConcepto.wicket.dominio.Nivel

/**
 * Application object for your web application. If you want to run this application without deploying, run the Start class.
 * 
 * @see pruebaConcepto.wicket.Start#main(String[])
 */
class WicketApplication extends WebApplication {
	
	override getHomePage() {
		SeguidorPage
	}
	
	override init() {
		super.init()
		ApplicationContext.instance.configureSingleton(Nivel, new HomeNivel)
		ApplicationContext.instance.configureSingleton(Materia, new HomeMaterias)		
	}
	
}