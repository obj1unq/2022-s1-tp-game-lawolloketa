import wollok.game.*
import enemigos.*
import tank.*
import balas.*

//object puntos {
//
//	var property position = game.at(game.width() - 1, game.height())
//	var property image = "fondo_de_celda.png"
//
//	method decirPuntaje() {
//		game.say(self, tanque.puntaje().toString())
//	}
//
//}

object puntosUnidad {

	var property position = game.at(game.width() - 2, game.height()-1)

	method image() {
		return self.valor().toString() + ".png"
	}

	method valor() {
		return tanque.puntaje() % 10
	}

}

object puntosDecena {

	var property position = game.at(game.width() - 3, game.height()-1)

	method image() {
		return self.valor().toString() + ".png"
	}

	method valor() {
		return tanque.puntaje().div(10)
	}

}

object puntosCentena {

	var property position = game.at(game.width() - 4, game.height()-1)

	method image() {
		return self.valor().toString() + ".png"
	}

	method valor() {
		return tanque.puntaje().div(100)
	}

}

object signo {

	var property position = null

	method image() {
		return self.valor() + ".png"
	}

	method valor() {
		return tanque.puntaje().div(100)
	}

}

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

object ganar {

	var property position = game.at(4, 5)

	method image() = "ganaste.png"

}

object perder {

	var property position = game.at(4, 5)

	method image() = "perdiste.png"

}

