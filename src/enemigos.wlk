import wollok.game.*
import tank.*
import balas.*
import paredes.*

class Tanque {

	var property position = game.at(5, 5)

	method image() = "enemigo_1_down_down_01.png"

	method mover() {
		const posiciones = #{ position.up(1), position.down(1), position.right(1), position.left(1) }
		position = posiciones.anyOne()
	}

	method recibirDanio() {
		administradorDeTanques.eliminarTanque(self)
		game.removeVisual(self)
	}

}

class TanquePesado inherits Tanque {

	override method image() = "enemigo_1_down_down_01.png"

}

class TanqueLiviano inherits Tanque {

	override method image() = "enemigo_1_down_down_01.png"

}

object administradorDeTanques {

	const max = 3
	const property tanques = []

	method crearTanque() {
		if (tanques.size() < max) {
			const tanque = new Tanque()
			tanques.add(tanque)
			game.addVisual(tanque)
		}
	}

	method eliminarTanque(tanque) {
		tanques.remove(tanque)
	}

	method moverTanques() {
		tanques.forEach({ tanque => tanque.mover()})
	}

}

