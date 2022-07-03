import wollok.game.*
import tank.*
import balas.*
import paredes.*
import extras.*

class Tanque {

	var property position = game.at(5, 5)
	var property image = "enemigo_1_abajo_01.png"
	var property direccionActual = abajo

	method mover() {
		const direcciones = #{ arriba, abajo, derecha, izquierda}
		const nuevaDireccion = direcciones.anyOne()
		if (direccionActual != nuevaDireccion) {
			self.image("enemigo_1_" + nuevaDireccion.direccionATexto() + "_01.png")
			direccionActual = nuevaDireccion
		}
		const direccion = nuevaDireccion.siguiente(self.position())
		if (administradorDeDestinos.destinoValido(direccion)) {
			self.position(direccion)
		}
	}

	method recibirDanio() {
		administradorDeTanques.eliminarTanque(self)
	}

}

class TanquePesado inherits Tanque {

	override method image() = "enemigo_1_down_down_01.png"

}

class TanqueLiviano inherits Tanque {

	override method image() = "enemigo_1_down_down_01.png"

}

object administradorDeTanques {

	const max = 3
	const property tanques = []

	method crearTanque() {
		if (tanques.size() < max) {
			const tanqueNuevo = new Tanque()
			tanques.add(tanqueNuevo)
			game.addVisual(tanqueNuevo)
		}
	}

	method eliminarTanque(tanqueEliminado) {
		tanques.remove(tanqueEliminado)
		game.removeVisual(tanqueEliminado)
	}

	method moverTanques() {
		tanques.forEach({ tanqueEnemigo => tanqueEnemigo.mover()})
	}

}

