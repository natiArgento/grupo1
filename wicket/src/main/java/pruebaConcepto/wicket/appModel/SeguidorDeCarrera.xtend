package pruebaConcepto.wicket.appModel

import java.io.Serializable
import pruebaConcepto.wicket.dominio.Materia
import java.util.List
import pruebaConcepto.wicket.dominio.Nivel
import pruebaConcepto.wicket.dominio.Nota
import java.util.ArrayList
import org.uqbar.commons.utils.ApplicationContext
import pruebaConcepto.wicket.home.HomeMaterias
import pruebaConcepto.wicket.home.HomeNivel

class SeguidorDeCarrera implements Serializable {
	@Property List<Materia> materias
	@Property Materia materiaSeleccionada
	@Property Nivel nivelMateria
	@Property List<Nivel> niveles
	@Property Nota notaSeleccionada

	def void actualizarMaterias() {
		materias = new ArrayList<Materia>
		materias = getHomeMaterias().getMaterias()
	}

	def HomeNivel getHomeNivel() {
		ApplicationContext.instance.getSingleton(typeof(Nivel))
	}

	def HomeMaterias getHomeMaterias() {
		ApplicationContext.instance.getSingleton(typeof(Materia))
	}

	def void eliminarNotaSeleccionada() {
		materiaSeleccionada.eliminar(notaSeleccionada)
		notaSeleccionada = null
		actualizarPantalla

	}

	def actualizarPantalla() {
		var aux = materiaSeleccionada
		actualizarMaterias
		actualizarMaterias
		materiaSeleccionada = aux

	}
	
	}
