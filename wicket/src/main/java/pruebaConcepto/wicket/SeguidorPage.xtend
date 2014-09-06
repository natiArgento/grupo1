package pruebaConcepto.wicket

import org.apache.wicket.markup.html.WebPage
import org.apache.wicket.markup.html.form.Form
import org.apache.wicket.model.CompoundPropertyModel
import org.uqbar.wicket.xtend.WicketExtensionFactoryMethods
import pruebaConcepto.wicket.appModel.SeguidorDeCarrera
import org.uqbar.wicket.xtend.XListView
import org.uqbar.wicket.xtend.XButton

/**
 * 
 * @author ?
 */
class SeguidorPage extends WebPage {
	extension WicketExtensionFactoryMethods = new WicketExtensionFactoryMethods
	var SeguidorDeCarrera sdc

	new() {
		
		this.sdc = new SeguidorDeCarrera()
		val Form<SeguidorDeCarrera> seguidor = new Form<SeguidorDeCarrera>("buscarCelularesForm", new CompoundPropertyModel<SeguidorDeCarrera>(this.sdc))
		this.agregarListaMaterias(seguidor)

		// TODO Add your page's components here
    }
	
	def agregarListaMaterias(Form<SeguidorDeCarrera> parent) {
		val listView = new XListView("materias")
		listView.populateItem = [ item |
			item.model = item.modelObject.asCompoundModel
			item.addChild(new XButton("editar").onClick = [| ])
			]
			parent.addChild(listView)
	}
	
}
