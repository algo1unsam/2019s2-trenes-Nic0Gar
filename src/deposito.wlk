import vagonPasajero.*
import vagonCarga.*
import locomotora.*

class Deposito {

	var property formaciones = #{ }
	var property locomotoras = #{ }

	// ---------------- 6 -------------//
	method vagonesMasPesados() = formaciones.forEach({ unaFormacion => unaFormacion.max({ formacion => formacion.cargaMaxima()}) })

	// ---------------- 7 -------------//
	method conductorExperimentado() = formaciones.any({ unaFormacion => (unaFormacion.cantVehiculos() > 20) or (unaFormacion.pesoTotalFormacion() >= 10000) })

	// ---------------- 8 -------------//
	method formacion(numero) = formaciones.get(numero)
	
	method buscarLocomotora(formacionNumero){
		return locomotoras.findOrDefault({unaLocomotora => unaLocomotora.puedeArrastrar()}, self.formacion(formacionNumero).kilosFaltantes())
	}
	

	method asiganarLocomotora(formacionNumero) {
		
		if ( self.buscarLocomotora(formacionNumero).size() != 0 ) {
			self.formacion(formacionNumero).add(self.buscarLocomotora(formacionNumero))
		}
		
			 
	}

	method necesitaLocomotora(formacionNumero) {
		if (self.formacion(formacionNumero).kilosFaltantes() < 0) {
			self.asiganarLocomotora(formacionNumero)
		} 
	}

}

