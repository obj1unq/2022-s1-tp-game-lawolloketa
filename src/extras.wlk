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

class Civil inherits Tanque{
	
	override method image(){
		return ""
	}
	
	override method vidasRestantes() {
		return 5 - impactosRecibidos
	}
	
	override method puntosQueAporta() {
		return -2000
	}
	
	override method validarVidas() {
		if (self.vidasRestantes() == 0) {
			tanque.sumarPuntos(self)
			game.removeVisual(self)
		}
	}
}

