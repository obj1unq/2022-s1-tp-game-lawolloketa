import wollok.game.*
import enemigos.*
import tank.*
import balas.*

object derecha {

	method siguiente(posicion) {
		return posicion.right(1)
	}

	method direccionATexto() {
		return "derecha"
	}

}

object izquierda {

	method siguiente(posicion) {
		return posicion.left(1)
	}

	method direccionATexto() {
		return "izquierda"
	}

}

object arriba {

	method siguiente(posicion) {
		return posicion.up(1)
	}

	method direccionATexto() {
		return "arriba"
	}

}

object abajo {

	method siguiente(posicion) {
		return posicion.down(1)
	}

	method direccionATexto() {
		return "abajo"
	}

}

object direcciones {

	method todas() {
		return [ arriba, derecha, abajo, izquierda ]
	}

}

object administradorDeDestinos {

	method destinoValido(direccion) {
		return direccion.x().between(0, game.width() - 1) and direccion.y().between(0, game.height() - 1) and game.getObjectsIn(direccion).size() == 0
	}

}

object administradorDeVidas {

	var property vidas = []

	method modificarVida(vida) {
		self.limpiarVidas()
		self.agregarVidas(vida)
	}

	method agregarVidas(vida) {
		if (vida > 0) {
			self.agregarVida(vida)
			self.agregarVidas(vida - 1)
		}
	}

	method agregarVida(numeroDeVida) {
		const vida = new Vida()
		game.addVisualIn(vida, game.at(numeroDeVida, game.height() - 1))
		vidas.add(vida)
	}

	method limpiarVidas() {
		if (not vidas.isEmpty()) {
			vidas.forEach{ vida => self.borrarVida(vida)}
		}
	}

	method borrarVida(vida) {
		game.removeVisual(vida)
		vidas.remove(vida)
	}

}

class Vida {

	const property position = null

	method image() {
		return "vida.png"
	}

}

