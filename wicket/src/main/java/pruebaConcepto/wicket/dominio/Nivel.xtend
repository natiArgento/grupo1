package pruebaConcepto.wicket.dominio

import org.uqbar.commons.model.Entity

class Nivel extends Entity{
	@Property String nroCuatri
	@Property String nroNivel
	
	
	def getDescripcion() {
		nroCuatri.concat(nroNivel)
	}

	override def toString() {
		descripcion
	}
	
}