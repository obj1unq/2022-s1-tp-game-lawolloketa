import wollok.game.*
import tank.*
import balas.*
import paredes.*
import extras.*

class Tanque {

	var property position = game.at(5, 5)
	var property orientacion = abajo
	var property impactosRecibidos = 0

	method image() {
		return "enemigo_" + self.tipoDeTanque() + "_" + orientacion.direccionATexto() + ".png"
	}

	method tipoDeTanque() {
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
			tanque.sumarPuntos(self)
			administradorDeTanques.eliminarTanque(self)
		}
	}

	method vidasRestantes() {
		return 3 - impactosRecibidos
	}

	method disparar() {
		if ([ true, true, false ].anyOne()) {
			administradorDeBalas.crearBala(self)
		}
	}

	method puntosQueAporta() {
		return 500
	}

}

class TanquePesado inherits Tanque {

	override method tipoDeTanque() {
		return "pesado"
	}

	override method vidasRestantes() {
		return 7 - impactosRecibidos
	}

	override method puntosQueAporta() {
		return 1000
	}

}

object administradorDeTanques {

	const max = 3
	const property tanques = []

	method tiposDeTanques() {
		return [ new Tanque(), new TanquePesado() ]
	}

	method crearTanque() {
		if (tanques.size() < max) {
			const tanqueNuevo = self.tanqueNuevo()
			tanques.add(tanqueNuevo)
			game.addVisual(tanqueNuevo)
		}
	}

	method tanqueNuevo() {
		return self.tiposDeTanques().anyOne()
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

class Civil inherits Tanque {

	override method image() {
		return "hola.jpg"
	}

	override method vidasRestantes() {
		return 5 - impactosRecibidos
	}

	override method puntosQueAporta() {
		return -2000
	}

	override method validarVidas() {
		if (self.vidasRestantes() == 0) {
			tanque.sumarPuntos(self)
			game.removeVisual(self)
		}
	}

}

