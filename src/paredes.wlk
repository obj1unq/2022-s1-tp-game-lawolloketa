import wollok.game.*
import tank.*
import enemigos.*
import balas.*

class Pared {

	var property position = null
	var property destruible = true
	var property impactosRecibidos = 0

	method image() {
		return "pared_" + self.tipoDePared() + "_" + self.vidasRestantes() + ".png"
	}

	method vidasRestantes()

	method recibirDanio() {
		if (destruible) {
			impactosRecibidos++
			self.validarVidas()
		}
	}

	method validarVidas() {
		if (self.vidasRestantes() == 0) game.removeVisual(self)
	}

	method tipoDePared()

}

class ParedDeLadrillo inherits Pared {

	override method vidasRestantes() {
		return 3 - self.impactosRecibidos()
	}

	override method tipoDePared() {
		return "ladrillo"
	}

}

class ParedDeMadera inherits Pared {

	override method vidasRestantes() {
		return 1 - self.impactosRecibidos()
	}

	override method tipoDePared() {
		return "madera"
	}

}

object paredes{
	method todas(){
		return [new ParedDeLadrillo(), new ParedDeMadera()]
	}
}

object creadorDeParedes{
	method nuevaPared(){
		return paredes.todas().anyOne()
	}
}