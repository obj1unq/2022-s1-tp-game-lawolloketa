import wollok.game.*
import tank.*
import enemigos.*
import paredes.*
import extras.*


class Bala {

	var property position = null
	var property direccion = null

	method image() = "bala_vertical_2.png"

	method avanzar() {
		self.position(direccion.siguiente(self.position()))
		self.impactar()
	}

	method impactar() {
		if (game.colliders(self).size() == 1) {
			game.uniqueCollider(self).recibirDanio()
			administradorDeBalas.eliminarBala(self)
		}
		//game.colliders(self).forEach({collider => collider.recibirDanio()})
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
	

	method crearBala(_tanque) {
		const bala = new Bala()
		balas.add(bala)
		bala.position(_tanque.position())
		bala.direccion(_tanque.orientacion())
		game.addVisual(bala)
	}

	method eliminarBala(bala) {
		balas.remove(bala)
		game.removeVisual(bala)
	}

	method moverBalas() {
		balas.forEach({ bala => bala.avanzar()})
	}

}

