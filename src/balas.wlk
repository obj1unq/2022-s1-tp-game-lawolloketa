import wollok.game.*
import tank.*
import enemigos.*
import paredes.*

class Bala {

	var property position = null

	method image() = "bala_vertical_2.png"

	method avanzar() {
		position = position.up(1)
		self.impactar()
	}

	method impactar() {
		if (game.colliders(self).size() == 1) {
			game.uniqueCollider(self).recibirDanio()
			administradorDeBalas.eliminarBala(self)
		}
	}

	method recibirDanio() {
	}

}

class BalaLiviana inherits Bala {

}

class BalaPesada inherits Bala {

}

object administradorDeBalas {

	const property balas = []

	method crearBala() {
		const bala = new Bala()
		balas.add(bala)
		bala.position(tank.position())
		game.addVisual(bala)
		bala.avanzar()
	}

	method eliminarBala(bala) {
		balas.remove(bala)
		game.removeVisual(bala)
	}

	method moverBalas() {
		balas.forEach({ bala => bala.avanzar()})
	}

}

