class Mascota {

	var amorRecibido = 0
	var experienciaRecibida = 0
	var duenio
	var entrenador

	method amorDeMascota(unDuenio)

	method seguridadDeMascota(unDuenio)

	method diversionDeMascota(unDuenio)

	method recibirAmor(unDuenio) {
		amorRecibido = unDuenio.amor()
	}

	method recibirExperiencia(unEntrenador)
	
	method entrenar() {
		self.recibirExperiencia(entrenador)
	}

}

class Canario inherits Mascota {

	override method seguridadDeMascota(unDuenio) {
		return 0
	}

	override method amorDeMascota(unDuenio) {
		return 0
	}

	override method diversionDeMascota(unDuenio) {
		return 5
	}

	method experiencia() {
		return 0
	}

}

class Gato inherits Mascota {

	var esTerritorial
	var property porcentajeAdicional
	var diversion
	

	override method seguridadDeMascota(unDuenio) {
		return esTerritorial
	}

	override method amorDeMascota(unDuenio) {
		return unDuenio.afectoDado() + porcentajeAdicional.porcentaje()
	}

	override method diversionDeMascota(unDuenio) {
		return diversion    
	}
	
    override method recibirExperiencia(unEntrenador) {
		diversion += diversion / 15
	}

}

object porcentaje {

	var property porcentaje

}

class Perro inherits Mascota {

	var nivelDeGuardian

	override method seguridadDeMascota(unDuenio) {
		if (unDuenio.edad() < 18) {
			return nivelDeGuardian + 50 + experienciaRecibida
		} else return nivelDeGuardian + 30 + experienciaRecibida
	}

	override method amorDeMascota(unDuenio) {
		return unDuenio.afectoDado() * 2
	}

	override method diversionDeMascota(unDuenio) {
		return 135 - unDuenio.edad()
	}
	
	override method recibirExperiencia(unEntrenador) {
		experienciaRecibida += unEntrenador.puntosDeExperiencia() / 10
	}

}

class Labrador inherits Perro {

	override method amorDeMascota(unDuenio) {
		return super(unDuenio) + 5
	}

}

class Duenio {

	var property edad
	var property afectoDado
	var mascotas = #{}
	var diversionBase

	method seguridadDeMascotas() {
		return mascotas.sum({ mascota => mascota.seguridadDeMascota(self) })
	}

	method amorDeMascotas() {
		return mascotas.sum({ mascota => mascota.amorDeMascota(self) })
	}

	method diversionDeMascotas() {
		return mascotas.sum({ mascota => mascota.diversionDeMascota(self) })
	}

	method amor() {
		return afectoDado / mascotas.size()
	}

	method darAmor() {
		mascotas.forEach({ mascota => mascota.recibirAmor(self)})
	}

	method nivelDeSeguridad() {
		return edad.min(50) + self.seguridadDeMascotas()
	}

	method seSienteSeguro() {
		return self.nivelDeSeguridad() > 50
	}

	method diversion() {
		return diversionBase + self.diversionDeMascotas()
	}

	method esFeliz() {
		return self.seSienteSeguro() and (self.amorDeMascotas() + self.diversion()) >= self.nivelDeSeguridad() * 2
	}

	method puntosExperiencia() {
		return self.amor()
	}
	

}

class Entrenador  {

	var puntosDeExperiencia

	method puntosExperiencia() {
		return puntosDeExperiencia
	}

}

