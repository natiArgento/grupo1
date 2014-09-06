package pruebaConcepto.wicket.dominio

import org.uqbar.commons.model.Entity

class Nota  extends Entity{
	@Property String descripcion
	@Property int fecha
	@Property Boolean estaAprobado = false
	
	new(String string, int i, boolean b) {
		descripcion = string
		fecha=i
		estaAprobado=b
	}
	
	new() {
	}

	
def asignarValores(String desc, int fecha, Boolean ap){
	this.descripcion= desc
	this.fecha= fecha
	this.estaAprobado= ap
}
	override clone() {
		super.clone()
	}

	def copiarA(Nota nuevaNota) {
		nuevaNota.descripcion = this.descripcion
		nuevaNota.fecha = this.fecha
		nuevaNota.estaAprobado = this.estaAprobado

	}}