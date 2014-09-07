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

/**
 * 
 * @author ?
 */
class SeguidorPage extends WebPage {
	extension WicketExtensionFactoryMethods = new WicketExtensionFactoryMethods
	var SeguidorDeCarrera sdc

	new() {
		
		this.sdc = new SeguidorDeCarrera()
		

		val Form<SeguidorDeCarrera> seguidorMaterias = new Form<SeguidorDeCarrera>("seguidorMateriasForm", new CompoundPropertyModel<SeguidorDeCarrera>(this.sdc))
		this.agregarListaMaterias(seguidorMaterias)
		this.agregarAcciones(seguidorMaterias)
		this.addChild(seguidorMaterias)

		// TODO Add your page's components here
    }
	
	def agregarAcciones(Form<SeguidorDeCarrera> parent) {
	parent.addChild(new XButton("nuevaMateria").onClick = [|nuevaMateria(new Materia) ])
	parent.addChild(new XButton("editarNota").onClick = [| //deberia ser materia seleccionada creo
		editarNota(new Materia)
	])
	}
	
	def agregarListaMaterias(Form<SeguidorDeCarrera> parent) {
		val listView = new XListView("materias")
		listView.populateItem = [ item |
			item.model = item.modelObject.asCompoundModel
			item.addChild(new Label("nombre"))
			item.addChild(new XButton("editar").onClick = [| /*editar la materia */])
			]
			parent.addChild(listView)
	}
	
	def nuevaMateria(Materia materia) {
		responsePage = new NuevaMateriaPage(materia, this) 
	}
	// no se si deberia ser nota
	def editarNota(Materia materia){
		responsePage= new EditarNotaPage(materia,this)
		
	}
	
}
