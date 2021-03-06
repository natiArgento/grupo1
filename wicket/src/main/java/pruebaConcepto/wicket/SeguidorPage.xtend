package pruebaConcepto.wicket

import org.apache.wicket.markup.html.WebPage
import org.apache.wicket.markup.html.form.Form
import org.apache.wicket.model.CompoundPropertyModel
import org.uqbar.wicket.xtend.WicketExtensionFactoryMethods
import pruebaConcepto.wicket.appModel.SeguidorDeCarrera
import org.uqbar.wicket.xtend.XListView
import org.uqbar.wicket.xtend.XButton
import org.apache.wicket.markup.html.basic.Label
import pruebaConcepto.wicket.dominio.Materia
import org.apache.wicket.markup.html.form.TextField
import org.apache.wicket.markup.html.form.CheckBox
import org.apache.wicket.markup.html.form.DropDownChoice
import pruebaConcepto.wicket.dominio.Nivel
import pruebaConcepto.wicket.dominio.Nota

/**
 * 
 * @author ?
 */
class SeguidorPage extends WebPage {
	extension WicketExtensionFactoryMethods = new WicketExtensionFactoryMethods
	@Property var SeguidorDeCarrera sdc

	new() {

		this.sdc = new SeguidorDeCarrera()

		val Form<SeguidorDeCarrera> seguidorMaterias = new Form<SeguidorDeCarrera>("seguidorMateriasForm",
			new CompoundPropertyModel<SeguidorDeCarrera>(this.sdc))
		this.agregarListaMaterias(seguidorMaterias)
		this.agregarAcciones(seguidorMaterias)
		this.verMateriaSeleccionada(seguidorMaterias)
		this.addChild(seguidorMaterias)
		this.actualizarPantalla()

	// TODO Add your page's components here
	}

	def verMateriaSeleccionada(Form<SeguidorDeCarrera> form) {
		
		form.addChild(new Label("materiaSeleccionada.nombre"))
		form.addChild(new TextField<Integer>("materiaSeleccionada.anioCursada"))
		form.addChild(new TextField<String>("materiaSeleccionada.profesor"))
		form.addChild(new CheckBox("materiaSeleccionada.estaAprobada"))
		form.addChild(new DropDownChoice<Nivel>("materiaSeleccionada.nivelMateria") => [
				choices = loadableModel([|Nivel.home.allInstances])]
				)		
		
		val listaNotas = new XListView("materiaSeleccionada.notas")
		listaNotas.populateItem = [ item |
			item.model = item.modelObject.asCompoundModel
			item.addChild(new Label("fecha"))
			item.addChild(new Label("descripcion"))
			val checkaprobado=new CheckBox ("estaAprobado")
			checkaprobado.setEnabled=false
			item.addChild(checkaprobado)
			item.addChild(new XButton("editarNota").onClick = [ |
				sdc.notaSeleccionada=item.modelObject
				editarNotaSeleccionada
			])
			
			item.addChild(new XButton("eliminarNota")
				.onClick = [|
					sdc.notaSeleccionada=item.modelObject
					sdc.eliminarNotaSeleccionada])
			]
		form.addChild(listaNotas)
		form.addChild(new XButton("nuevaNota").onClick = [|nuevaNota()])
		this.actualizarPantalla
		
	}
	
	def actualizarPantalla() {
		this.sdc.actualizarPantalla
	}

	def agregarAcciones(Form<SeguidorDeCarrera> parent) {
		parent.addChild(new XButton("nuevaMateria").onClick = [|nuevaMateria(new Materia)])
		
	}

	def agregarListaMaterias(Form<SeguidorDeCarrera> parent) {
		val listView = new XListView("materias")
		listView.populateItem = [ item |
			item.model = item.modelObject.asCompoundModel
			item.addChild(new Label("nombre"))
			item.addChild(
				new XButton("editar").onClick = [ |
					sdc.materiaSeleccionada = item.modelObject
					actualizarPantalla
				])
		]
		parent.addChild(listView)
	}

	def nuevaMateria(Materia materia) {
		responsePage = new NuevaMateriaPage(materia, this)
	}

	// no se si deberia ser nota
	def editarNotaSeleccionada() {
		responsePage = new EditarNotaPage(sdc.materiaSeleccionada, sdc.notaSeleccionada, this, false)
	}

	def nuevaNota() {
		responsePage = new EditarNotaPage(sdc.materiaSeleccionada, new Nota(), this, true)
	}

}
