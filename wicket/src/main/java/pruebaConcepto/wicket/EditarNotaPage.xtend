package pruebaConcepto.wicket

import org.apache.wicket.markup.html.WebPage
import org.apache.wicket.markup.html.basic.Label
import org.apache.wicket.markup.html.form.CheckBox
import org.apache.wicket.markup.html.form.Form
import org.apache.wicket.markup.html.form.TextField
import org.uqbar.wicket.xtend.WicketExtensionFactoryMethods
import org.uqbar.wicket.xtend.XButton
import pruebaConcepto.wicket.dominio.Nota

class EditarNotaPage extends WebPage{
	
	extension WicketExtensionFactoryMethods = new WicketExtensionFactoryMethods
	private final SeguidorPage mainPage
	private Nota nota
		
	new(Nota notaAEditar, SeguidorPage mainPage) {
		this.mainPage = mainPage
		this.nota = notaAEditar
		this.addChild(new Label("titulo"))

		val editarNotaForm = new Form<Nota>("editarNota", this.nota.asCompoundModel)
		this.agregarCamposEdicion(editarNotaForm)
		this.agregarAcciones(editarNotaForm)
		this.addChild(editarNotaForm)

	}
	
	def agregarCamposEdicion(Form<Nota> form) {
		form.addChild(new TextField<Integer>("fecha"))
		form.addChild(new TextField<String>("descripcion"))
		form.addChild(new CheckBox("estaAprobado")	)
	}
	
	def agregarAcciones(Form<Nota> form) {
		form.addChild(new XButton("aceptar").onClick=[|
			volver
		])
		form.addChild(new XButton ("volver") =>[
			onClick = [| volver()]
			])
			
	}
	
	def volver() {
	responsePage = mainPage
	}
	
	
}