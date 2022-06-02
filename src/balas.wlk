import wollok.game.*
import tank.*
import enemigos.*
import paredes.*

class Bala {

	var property position = null

	method image() = "bala_vertical_2.png"

	method avanzar() {
		position = position.up(1)
	}

}

object administradorBalas {

	const property balas = []

	method disparar() {
		const bala = new Bala()
		balas.add(bala)
		bala.position(tank.position())
		game.addVisual(bala)
		bala.avanzar()
	}

	method impactar(bala) {
		balas.remove(bala)
		game.removeVisual(bala)
	}

}

