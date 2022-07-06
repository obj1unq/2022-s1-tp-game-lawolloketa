import wollok.game.*
import tank.*
import enemigos.*
import balas.*

class Pared {

	var property position = game.at(1, 1)
	var property destruible = true
	const property atravesable = false
	var property image = "pared_3.png"
	var property vidas = 3

	method recibirDanio()

	method validarVidas() {
		if (vidas == 0) game.removeVisual(self)
	}

}

class ParedDeLadrillo inherits Pared {

	override method recibirDanio() {
		if (destruible) {
			vidas = vidas - 1
			self.validarVidas()
			image = "pared_" + vidas + ".png"
		}
	}

}

class ParedDeMadera inherits Pared {

	override method image() = "pared_1.png"

	override method recibirDanio() {
	}

}

