package pruebaConcepto.wicket.dominio

import org.uqbar.commons.model.Entity
import java.util.List
import java.util.ArrayList
import org.uqbar.commons.model.UserException
import org.uqbar.commons.utils.Observable

@Observable
class Materia extends Entity implements Cloneable {
	
	@Property String nombre
	@Property int anioCursada
	@Property Boolean estaAprobada = false
	@Property String profesor
	@Property Nivel nivelMateria
	@Property List<Nota> notas = new ArrayList

	def void setNivelDeMateria(Nivel nivel) {

		this._nivelMateria = nivel

	}

	def ingresarNombre() {
		nombre != null && !nombre.trim().equals("")
	}

	def validar() {
		if (!this.ingresarNombre()) {

			throw new UserException("Debe ingresar nombre de materia")
		}

		/*manera fea de ver que la fecha no sea incorrecta, luego lo corrijo */
		if (this.anioCursada > 2015) {
			throw new UserException("Debe ingresar fecha valida")
		}
	}
	
	def eliminar(Nota nota) {
		notas.remove(nota)
	}
	
	def nuevaNota(Nota nota) {
		notas.add(nota)
	}
	
}