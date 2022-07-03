import wollok.game.*
import enemigos.*
import balas.*
import paredes.*
import extras.*

object tanque {

	var property position = game.at(5, 0)
	var property image = "tanque_arriba_01.png"
	var property direccionActual = arriba

	method mover(direccion) {
		if (direccionActual != direccion) {
			self.image("tanque_" + direccion.direccionATexto() + "_01.png")
			direccionActual = direccion
		}
		if (administradorDeDestinos.destinoValido(direccion.siguiente(self.position()))) {
			self.position(direccion.siguiente(self.position()))
		}
	}

	method disparar() {
		administradorDeBalas.crearBala()
	}

	method recibirDanio() {
	}

}

