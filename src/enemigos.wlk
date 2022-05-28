import wollok.game.*
import tank.*
import balas.*
import paredes.*

class EnemyTank {

	var property position = game.at(5, 5)

	method image() = "tank_down.png"

	method mover() {
		const posiciones = #{ position.up(1), position.down(1), position.right(1), position.left(1) }
		position = posiciones.anyOne()
	}

}

object constructorDeTanques {

	const max = 3
	const property tanques = []

	method crearTanque() {
		if (tanques.size() < max) {
			const tanque = new EnemyTank()
			tanques.add(tanque)
			game.addVisual(tanque)
		}
	}

}

