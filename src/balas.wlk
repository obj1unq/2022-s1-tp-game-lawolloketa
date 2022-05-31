import wollok.game.*
import tank.*
import enemigos.*
import paredes.*

//object creadorDeBalas() {
//	method crearBala(){
//		const bala = new Bala()
//		
//	}
//}
class Bala {

	var property position = null

	method image() = "bala_vertical_2.png"

	method avanzar() {
		position = position.up(1)
	}

}

object administradorBalas {

	const property balas = []

	method agregar(bala) {
		balas.add(bala)
	}

}



