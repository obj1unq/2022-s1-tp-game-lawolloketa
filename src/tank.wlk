import wollok.game.*
import enemigos.*
import balas.*
import paredes.*
import extras.*

object tanque inherits Tanque {

	var property puntaje = 0

	override method tipo() {
		return "tanque"
	}

	method mover(direccion) {
		self.cambiarOrientacion(direccion)
		self.avanzar(direccion)
	}

	override method recibirDanio() {
		impactosRecibidos++
		administradorDeVidas.modificarVida(self.vidasRestantes())
		self.validarVidas()
	}

	override method validarVidas() {
		if (self.vidasRestantes() == 0) {
			self.sumarPuntos(self)
			self.validarPerder()
		}
	}

	method validarPerder() {
		if (self.vidasRestantes() == 0) self.perderJuego()
	}

	method perderJuego() {
		game.clear()
		game.schedule(200, {game.addVisual(perder)})
	}

	override method puntosQueAporta() {
		return -5
	}

	method sumarPuntos(objeto) {
		puntaje = puntaje + objeto.puntosQueAporta()
		self.validarGanar()
	}

	method validarGanar() {
		if (self.puntaje() >= 5) self.ganarJuego()
	}

	method ganarJuego() {
		game.clear()
		game.schedule(200, {game.addVisual(ganar)})
	}

}
