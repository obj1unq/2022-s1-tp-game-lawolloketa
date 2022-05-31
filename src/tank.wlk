import wollok.game.*
import enemigos.*
import balas.*
import paredes.*

object tank {

	var property position = game.at(5, 0)

	method image() = "tanque_up_up_01.png"

	method disparar() {
		const bala = new Bala()
		administradorBalas.agregar(bala)
		bala.position(position)
		game.addVisual(bala)
		bala.avanzar()
	}

}

