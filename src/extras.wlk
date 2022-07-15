import wollok.game.*
import enemigos.*
import tank.*
import balas.*

object puntosUnidad {

	var property position = game.at(game.width() - 2, game.height() - 1)

	method image() {
		return self.valor().toString() + ".png"
	}

	method valor() {
		return tanque.puntaje() % 10
	}

}

object puntosDecena {

	var property position = game.at(game.width() - 3, game.height() - 1)

	method image() {
		return self.valor().toString() + ".png"
	}

	method valor() {
		return tanque.puntaje().div(10)
	}

}

object puntosCentena {

	var property position = game.at(game.width() - 4, game.height() - 1)

	method image() {
		return self.valor().toString() + ".png"
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

	method posicionAleatoria() {
		return game.at((1 .. game.width() - 1).anyOne(), (1 .. game.height() - 3).anyOne())
	}

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

object administradorDePremios {

	var property premios = [ premioBomba, premioVida ]
	var property premioActivo = null

	method activarPremio() {
		const posicion = administradorDeDestinos.posicionAleatoria()
		const premio = premios.anyOne()
		if (administradorDeDestinos.destinoValido(posicion)) {
			game.addVisualIn(premio, posicion)
			premioActivo = premio
			game.schedule(5000, { self.desactivarPremio()})
		} else {
			self.activarPremio()
		}
	}

	method desactivarPremio() {
		if (game.hasVisual(premioActivo)) {
			game.removeVisual(premioActivo)
		}
	}

}

object premioBomba {

	var property position = null
	var property image = "bomba.png"

	method recibirDanio() {
		administradorDeTanques.eliminarTodos()
		game.removeVisual(self)
	}

}

object premioVida {

	var property position = null
	var property image = "vida.png"

	method recibirDanio() {
		tanque.impactosRecibidos(0)
		administradorDeVidas.modificarVida(tanque.vidasRestantes())
		game.removeVisual(self)
	}

}

