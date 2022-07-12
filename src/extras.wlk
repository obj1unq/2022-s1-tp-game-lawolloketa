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

