package pruebaConcepto.wicket

import org.apache.wicket.markup.html.WebPage
import org.apache.wicket.markup.html.form.Form
import org.apache.wicket.model.CompoundPropertyModel
import org.uqbar.wicket.xtend.WicketExtensionFactoryMethods
import pruebaConcepto.wicket.appModel.SeguidorDeCarrera
import org.uqbar.wicket.xtend.XListView
import org.uqbar.wicket.xtend.XButton
import org.apache.wicket.markup.html.basic.Label

/**
 * 
 * @author ?
 */
class SeguidorPage extends WebPage {
	extension WicketExtensionFactoryMethods = new WicketExtensionFactoryMethods
	var SeguidorDeCarrera sdc

	new() {
		
		this.sdc = new SeguidorDeCarrera()
		val Form<SeguidorDeCarrera> seguidorMaterias = new Form<SeguidorDeCarrera>("seguidorMaterias", new CompoundPropertyModel<SeguidorDeCarrera>(this.sdc))
		this.agregarListaMaterias(seguidorMaterias)
		this.addChild(seguidorMaterias)

		// TODO Add your page's components here
    }
	
	def agregarListaMaterias(Form<SeguidorDeCarrera> parent) {
		val listView = new XListView("materias")
		listView.populateItem = [ item |
			item.model = item.modelObject.asCompoundModel
			item.addChild(new Label("nombre"))
			item.addChild(new XButton("editar").onClick = [| ])
			]
			parent.addChild(listView)
	}
	
}
