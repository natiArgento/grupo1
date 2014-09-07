package pruebaConcepto.wicket

import org.apache.wicket.markup.html.WebPage
import pruebaConcepto.wicket.dominio.Materia
import org.uqbar.wicket.xtend.WicketExtensionFactoryMethods
import org.apache.wicket.markup.html.form.Form
import org.uqbar.wicket.xtend.XButton

class NuevaMateriaPage extends WebPage {
	extension WicketExtensionFactoryMethods = new WicketExtensionFactoryMethods
	private final SeguidorPage mainPage
	private final Materia nuevaMateria

	new(Materia nuevaMateria, SeguidorPage mainPage) {
		this.mainPage = mainPage
		this.nuevaMateria = nuevaMateria

		val nuevaMatForm = new Form<Materia>("nuevaMateria", this.nuevaMateria.asCompoundModel)
		this.agregarAcciones(nuevaMatForm)
		this.addChild(nuevaMatForm)

	}
	
	def agregarAcciones(Form<Materia> form) {
		form.addChild(new XButton ("aceptar") => [
			onClick = [|//  agregar la materia a al lista
			]
					]
			
			
			
		)
			
	}

}
