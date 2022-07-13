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

	override method disparar() {
		administradorDeBalas.crearBala(self)
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
		if (self.vidasRestantes() == 0) self.perder()
	}

	method perder() {
		game.removeVisual(self)
	}

	override method puntosQueAporta() {
		return -5
	}

	method sumarPuntos(objeto) {
		puntaje = puntaje + objeto.puntosQueAporta()
	}

}

