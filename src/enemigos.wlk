import wollok.game.*
import tank.*
import balas.*
import paredes.*
import extras.*

class Tanque {

	var property position = game.at(5, 5)
	var property image = "enemigo_1_abajo_01.png"
	var property orientacion = abajo

	method mover() {
		const nuevaDireccion = direcciones.todas().anyOne()
		self.cambiarOrientacion(nuevaDireccion)
		self.avanzar(nuevaDireccion)
	}

	method avanzar(direccion) {
		const siguientePosiscion = direccion.siguiente(self.position())
		if (administradorDeDestinos.destinoValido(siguientePosiscion)){
			self.position(siguientePosiscion)
		}
	}

	method cambiarOrientacion(nuevaDireccion) {
		if (orientacion != nuevaDireccion) {
			self.image("enemigo_1_" + nuevaDireccion.direccionATexto() + "_01.png")
			orientacion = nuevaDireccion
		}
	}

	method recibirDanio() {
		administradorDeTanques.eliminarTanque(self)
	}

	method disparar() {
		if ([ true, true, false ].anyOne()) {
			administradorDeBalas.crearBala(self)
		}
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

	method disparar() {
		tanques.forEach({ tanqueEnemigo => tanqueEnemigo.disparar()})
	}

}

