import wollok.game.*
import tank.*
import enemigos.*
import balas.*

class Pared {

	var property position = game.at(1, 1)
	var property destruible = true
	const property atravesable = false

	method image()

	method recibirDanio()

}

class ParedDeLadrillo inherits Pared {

	override method image() = "pared_1.png"

	override method recibirDanio() {
	}

}

class ParedDeMadera inherits Pared {

	override method image() = "pared_1.png"

	override method recibirDanio() {
	}

}

