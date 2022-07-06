import wollok.game.*
import enemigos.*
import balas.*
import paredes.*
import extras.*

object tanque {

	var property position = game.at(5, 0)
	var property image = "tanque_arriba_01.png"
	var property orientacion = arriba
	var property vidas = 3

	method mover(direccion) {
		if (orientacion != direccion) {
			self.image("tanque_" + direccion.direccionATexto() + "_01.png")
			orientacion = direccion
		}
		if (administradorDeDestinos.destinoValido(direccion.siguiente(self.position()))) {
			self.position(direccion.siguiente(self.position()))
		}
	}

	method disparar() {
		administradorDeBalas.crearBala(self)
	}

	method recibirDanio() {
		self.validarVidas()
		vidas = vidas - 1
	}
	
	method validarVidas() {
		if (vidas == 0) self.perder()
	}
	
	method perder() {
		game.removeVisual(self)
	}

}

