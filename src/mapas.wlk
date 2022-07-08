import wollok.game.*
import paredes.*

object mapa {

	method bordeDelMapa(n) {
		if (n <= game.width()) {
			game.addVisualIn(new ParedDeLadrillo(destruible = false), game.at(n, 0))
			game.addVisualIn(new ParedDeLadrillo(destruible = false), game.at(0, n))
			game.addVisualIn(new ParedDeLadrillo(destruible = false), game.at(n, game.width() - 1))
			game.addVisualIn(new ParedDeLadrillo(destruible = false), game.at(game.width() - 1, n))
			self.bordeDelMapa(n + 1)
		}
	}

	method nivel1() {
		self.lineasHorizontales(2)
	}

	method lineasHorizontales(n) {
		if (n <= game.width() - 2) {
			self.lineaHorizontal(n, 1)
			self.lineasHorizontales(n + 2)
		}
	}

	method lineaHorizontal(n, m) {
		if (m <= game.width() - 2) {
			game.addVisualIn(new ParedDeLadrillo(), game.at(m, n))
			self.lineaHorizontal(n, m + 1)
		}
	}

}

