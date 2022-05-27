import wollok.game.*

object tank {

	var property position = game.at(5, 0)

	method image() = "tank_up.png"

	method disparar() {
		const bala = new Bala()
		balas.agregar(bala)
		bala.position(position)
		game.addVisual(bala)
		bala.avanzar()
	}

}

//object creadorDeBalas() {
//	method crearBala(){
//		const bala = new Bala()
//		
//	}
//}
class EnemyTank {

	var property position = game.at(5,5)

	method image() = "tank_down.png"

	method mover() {
		const posiciones = #{position.up(1), position.down(1), position.right(1), position.left(1)}
		position = posiciones.anyOne()
	}

}

class Bala {

	var property position = null

	method image() = "bala.png"

	method avanzar() {
		position = position.up(1)
	}

}

object balas {

	const property balas = []

	method agregar(bala) {
		balas.add(bala)
	}
	
	//comentario

}

object constructorDeTanques{
	const max = 3
	const property tanques = []
	
	method crearTanque(){
		if (tanques.size() < max){
			const tanque = new EnemyTank()
			tanques.add(tanque)
			game.addVisual(tanque)
		}
	}
	
	
}

class Pared{
	var property position = null

	method image() = "pared.png"
	
}

