package pruebaConcepto.wicket

import org.apache.wicket.markup.html.WebPage
import pruebaConcepto.wicket.dominio.Materia
import org.uqbar.wicket.xtend.WicketExtensionFactoryMethods
import org.apache.wicket.markup.html.form.Form
import org.uqbar.wicket.xtend.XButton
import org.apache.wicket.markup.html.basic.Label
import org.apache.wicket.markup.html.form.TextField

class NuevaMateriaPage extends WebPage {
	extension WicketExtensionFactoryMethods = new WicketExtensionFactoryMethods
	private final SeguidorPage mainPage
	private final Materia nuevaMateria

	new(Materia nuevaMateria, SeguidorPage mainPage) {
		this.mainPage = mainPage
		this.nuevaMateria = nuevaMateria
		this.addChild(new Label("titulo"))

		val nuevaMatForm = new Form<Materia>("nuevaMateria", this.nuevaMateria.asCompoundModel)
		this.agregarAcciones(nuevaMatForm)
		this.agregarCamposEdicion(nuevaMatForm)
		this.addChild(nuevaMatForm)

	}
	
	def agregarCamposEdicion(Form<Materia> parent) {
		parent.addChild(new TextField<String>("nombre"))
	}
	
	def agregarAcciones(Form<Materia> parent) {
		parent.addChild(new XButton ("aceptar") => [
			onClick = [|Materia.home.create(nuevaMateria)
				mainPage.sdc.materiaSeleccionada=nuevaMateria
				volver()
			]
					]
			
			
			
		)
		parent.addChild(new XButton ("volver") =>[
			onClick = [| volver()]
		])
			
	}
	def volver() {
	responsePage = mainPage
	}

}
