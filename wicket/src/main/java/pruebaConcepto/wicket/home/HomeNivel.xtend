package pruebaConcepto.wicket.home

import org.uqbar.commons.model.CollectionBasedHome
import pruebaConcepto.wicket.dominio.Nivel
import org.apache.commons.collections15.Predicate
import java.util.List
import org.uqbar.commons.utils.Observable

@Observable
class HomeNivel extends CollectionBasedHome<Nivel> {

	new() {
		this.init
	}

	def init() {
		this.create("Anual", " - 1º nivel")
		this.create("1º cuatrimestre", " - 1º nivel")
		this.create("2º cuatrimestre", " - 1º nivel")		
		this.create("Anual", " - 2º nivel")		
		this.create("1º cuatrimestre", " - 2º nivel")
		this.create("2º cuatrimestre", " - 2º nivel")
		this.create("Anual", " - 3º nivel")
		this.create("1º cuatrimestre", " - 3º nivel")
		this.create("2º cuatrimestre", " - 3º nivel")

	}

	def void create(String nroCuatri, String nroNivel) {
		var nivel = new Nivel
		nivel.nroCuatri = nroCuatri
		nivel.nroNivel = nroNivel
		this.create(nivel)
	}
	
	def Nivel get(String descripcion) {
		getNiveles.findFirst [ nivel | nivel.getDescripcion.equals(descripcion) ]
	}
	
	override def Class<Nivel> getEntityType() {
		typeof(Nivel)
	}

	override def createExample() {
		new Nivel()
	}

	override def Predicate<Nivel> getCriterio(Nivel example) {
		null
	}

	def List<Nivel> getNiveles() {
		allInstances
	}
}
