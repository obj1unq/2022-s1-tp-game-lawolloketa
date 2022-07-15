import wollok.game.*
import tank.*
import balas.*
import paredes.*
import extras.*

class Tanque {

	var property position = game.center()
	var property orientacion = arriba
	var property impactosRecibidos = 0

	method image() {
		return self.tipo() + "_" + orientacion.direccionATexto() + ".png"
	}

	method tipo() {
		return "normal"
	}

	method mover() {
		const nuevaDireccion = direcciones.todas().anyOne()
		self.cambiarOrientacion(nuevaDireccion)
		self.avanzar(nuevaDireccion)
	}

	method avanzar(direccion) {
		const siguientePosicion = direccion.siguiente(self.position())
		if (administradorDeDestinos.destinoValido(siguientePosicion)) {
			self.position(siguientePosicion)
		}
	}

	method cambiarOrientacion(nuevaDireccion) {
		if (orientacion != nuevaDireccion) {
			orientacion = nuevaDireccion
		}
	}

	method recibirDanio() {
		impactosRecibidos++
		self.validarVidas()
	}

	method validarVidas() {
		if (self.vidasRestantes() == 0) {
			administradorDeTanques.eliminarTanque(self)
			self.serEliminado()
		}
	}

	method vidasRestantes() {
		return 2 - impactosRecibidos
	}

	method disparar() {
		administradorDeBalas.crearBala(self)
	}

	method puntosQueAporta() {
		return 5
	}

	method serEliminado() {
		tanque.sumarPuntos(self)
		game.removeVisual(self)
		administradorDeTanques.eliminarTanque(self)
	}

}

class TanquePesado inherits Tanque {

	override method tipo() {
		return "pesado"
	}

	override method vidasRestantes() {
		return 4 - impactosRecibidos
	}

	override method puntosQueAporta() {
		return 10
	}

}

class Civil inherits Tanque {

	override method tipo() {
		return "civil"
	}

	override method vidasRestantes() {
		return 2 - impactosRecibidos
	}

	override method puntosQueAporta() {
		return -5
	}

	override method disparar() {
	}

}

object administradorDeTanques {

	const max = 4
	const property tanques = []

	method posicionesDeAparicion() {
		return [ game.at(1,1), game.at(1,game.width()-2), game.at(game.width()-2,1), game.at(game.width()-2,game.width()-2) ]
	}

	method tipos() {
		return [ new Tanque(), new TanquePesado(), new Civil() ]
	}

	method crearTanque() {
		if (tanques.size() < max) {
			const tanqueNuevo = self.tanqueNuevo()
			self.validarCivil(tanqueNuevo)
		}
	}

	method validarCivil(vehiculo) {
		if (not (self.hayCivil() and self.esCivil(vehiculo))) {
			self.agregarVehiculo(vehiculo)
		}
	}

	method agregarVehiculo(vehiculo) {
		vehiculo.position(self.posicionesDeAparicion().anyOne())
		vehiculo.orientacion(direcciones.todas().anyOne())
		tanques.add(vehiculo)
		game.addVisual(vehiculo)
	}

	method hayCivil() {
		return tanques.any{ vehiculo => self.esCivil(vehiculo) }
	}

	method esCivil(vehiculo) {
		return vehiculo.tipo() == "civil"
	}

	method tanqueNuevo() {
		return self.tipos().anyOne()
	}

	method eliminarTanque(tanqueEliminado) {
		tanques.remove(tanqueEliminado)
	}

	method moverTanques() {
		tanques.forEach({ tanqueEnemigo => tanqueEnemigo.mover()})
	}

	method disparar() {
		tanques.forEach({ tanqueEnemigo => tanqueEnemigo.disparar()})
	}

	method eliminarTodos() {
		tanques.forEach{ tanqueAEliminar => tanqueAEliminar.serEliminado()}
	}

}

