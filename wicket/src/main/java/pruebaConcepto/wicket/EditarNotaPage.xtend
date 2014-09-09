package pruebaConcepto.wicket

import org.apache.wicket.markup.html.WebPage
import org.apache.wicket.markup.html.basic.Label
import org.apache.wicket.markup.html.form.CheckBox
import org.apache.wicket.markup.html.form.Form
import org.apache.wicket.markup.html.form.TextField
import org.uqbar.wicket.xtend.WicketExtensionFactoryMethods
import org.uqbar.wicket.xtend.XButton
import pruebaConcepto.wicket.dominio.Nota
import pruebaConcepto.wicket.dominio.Materia

class EditarNotaPage extends WebPage{
	
	extension WicketExtensionFactoryMethods = new WicketExtensionFactoryMethods
	private final SeguidorPage mainPage
	private Nota nota
	private Materia materia
	private boolean esNuevo
		
	new(Materia materiaSeleccionada, Nota notaAEditar, SeguidorPage mainPage, boolean alta) {
		this.mainPage = mainPage
		this.materia = materiaSeleccionada
		this.nota = notaAEditar
		this.esNuevo = alta
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
			aceptar
		])
		form.addChild(new XButton ("volver") =>[
			onClick = [| volver()]
			])
			
	}
	
	def aceptar() {
		if (this.esNuevo){ materia.nuevaNota(nota)}
		volver
	}
	
	def volver() {
	responsePage = mainPage
	}
	
	
}