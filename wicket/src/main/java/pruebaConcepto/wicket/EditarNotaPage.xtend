package pruebaConcepto.wicket

import org.apache.wicket.markup.html.WebPage
import org.uqbar.wicket.xtend.WicketExtensionFactoryMethods
import pruebaConcepto.wicket.dominio.Materia
import org.apache.wicket.markup.html.form.Form
import org.apache.wicket.markup.html.basic.Label
import org.uqbar.wicket.xtend.XButton

class EditarNotaPage extends WebPage{
	
	extension WicketExtensionFactoryMethods = new WicketExtensionFactoryMethods
	private final SeguidorPage mainPage
	private final Materia nuevaMateria
	
	new(Materia nuevaMateria, SeguidorPage mainPage) {
		this.mainPage = mainPage
		this.nuevaMateria = nuevaMateria
		this.addChild(new Label("titulo"))

		val editarMatForm = new Form<Materia>("editarNota", this.nuevaMateria.asCompoundModel)
		this.agregarAcciones(editarMatForm)
		this.agregarCamposEdicion(editarMatForm)
		this.addChild(editarMatForm)

	}
	
	def agregarCamposEdicion(Form<Materia> form) {
		
	}
	
	def agregarAcciones(Form<Materia> form) {
		form.addChild(new XButton ("volver") =>[
			onClick = [| volver()]
			])
			
	}
	
	def volver() {
	responsePage = mainPage
	}
	
	
}