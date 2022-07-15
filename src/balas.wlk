import wollok.game.*
import tank.*
import enemigos.*
import paredes.*
import extras.*

class Bala {

	var property position = null
	var property orientacion = null

	method image() = "bala.png"

	method avanzar() {
		self.position(orientacion.siguiente(self.position()))
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

object administradorDeBalas {

	const property balas = []

	method crearBala(_tanque) {
		const bala = new Bala(position = _tanque.position(), orientacion = _tanque.orientacion())
		game.addVisual(bala)
		balas.add(bala)
	}

	method eliminarBala(bala) {
		balas.remove(bala)
		game.removeVisual(bala)
	}

	method moverBalas() {
		balas.forEach({ bala => bala.avanzar()})
	}

}

