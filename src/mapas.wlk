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

}

