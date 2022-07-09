import wollok.game.*
import enemigos.*
import balas.*
import paredes.*
import extras.*

object tanque {

	var property position = game.at(5, 1)
	var property image = "tanque_arriba_01.png"
	var property orientacion = arriba
	var property vidas = 3
	var property puntaje = 0

	method mover(direccion) {
		self.cambiarOrientacion(direccion)
		self.avanzar(direccion)
	}

	method cambiarOrientacion(nuevaDireccion) {
		if (orientacion != nuevaDireccion) {
			self.image("tanque_" + nuevaDireccion.direccionATexto() + "_01.png")
			orientacion = nuevaDireccion
		}
	}

	method avanzar(direccion) {
		const siguientePosicion = direccion.siguiente(self.position())
		if (administradorDeDestinos.destinoValido(siguientePosicion)) {
			self.position(siguientePosicion)
		}
	}

	method disparar() {
		administradorDeBalas.crearBala(self)
	}

	method recibirDanio() {
		self.validarPerder()
		vidas = vidas - 1
	}

	method validarPerder() {
		if (vidas == 0) self.perder()
	}

	method perder() {
		game.removeVisual(self)
	}

	method sumarPuntos(objeto) {
		puntaje = puntaje + objeto.puntosQueAporta()
	}

}

