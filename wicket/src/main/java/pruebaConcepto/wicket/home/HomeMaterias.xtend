package pruebaConcepto.wicket.home

import org.uqbar.commons.model.CollectionBasedHome
import org.apache.commons.collections15.Predicate
import java.util.List
import pruebaConcepto.wicket.dominio.Nota
import pruebaConcepto.wicket.dominio.Materia
import org.uqbar.commons.utils.Observable
import pruebaConcepto.wicket.dominio.Nivel
import org.uqbar.commons.utils.ApplicationContext

@Observable
class HomeMaterias extends CollectionBasedHome<Materia> {
	var n1 = new Nota("1 parcial", 25052012, true)
	var n2 = new Nota("tp", 30102013, true)
	var n3 = new Nota("parcial 2", 28102012, true)
	var n4 = new Nota("parcial", 15092013, false)
	var n5 = new Nota("parcial", 29062014, true)
	var n6 = new Nota("parcial 1", 12062013, true)
	var n7 = new Nota("parcial 2", 17112013, true)

	new() {

		this.init
	}

	def init() {
		this.create("Analisis 1", 2013, true, "Rinaldi", newArrayList(n1, n2, n3), getNivel("Anual - 1º nivel"))
		this.create("Matematica Discreta", 2012, true, "Demmler", newArrayList(n4, n5), getNivel("Anual - 1º nivel"))
		this.create("Sintaxis", 2013, true, "Adamoli", newArrayList(n6, n7), getNivel("Anual - 2º nivel"))
	}

	def void create(String nombreMat, int anio, Boolean aprobado, String profe, List<Nota> notas, Nivel nivel) {
		var materia = new Materia
		materia.nombre = nombreMat
		materia.anioCursada = anio
		materia.estaAprobada = aprobado
		materia.profesor = profe
		materia.notas = notas
		materia.nivelMateria = nivel
		this.create(materia)
	}
	
	def getNivel(String modeloDescripcion) {
		(ApplicationContext::instance.getSingleton(typeof(Nivel)) as HomeNivel).get(modeloDescripcion)
	}

	override def getEntityType() {
		typeof(Materia)
	}

	override def createExample() {
		new Materia()
	}

	override Predicate<Materia> getCriterio(Materia example) {
		null
	}

	def List<Materia> getMaterias() {
		allInstances
	}

	def refresh() {
		return allInstances.toList
	}

}
