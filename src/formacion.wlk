import vagonPasajero.*
import vagonCarga.*
import locomotora.*

class Formacion{
	var formacion = #{ }
	
	
	method cuantosVagonesLivianos() = formacion.count({ unTren => unTren.cargaMaxima() <= 2500  }) // TODO se podría delegar
	
	method devuelveVagones() = formacion.filter({unTren => unTren.cargaMaxima() != 0})
	
	method devuelveLocomotoras() = formacion.filter({unTren => unTren.cargaMaxima() == 0})
	
	method velocidaMaxima() = self.devuelveLocomotoras().min({ unaLocomotora => unaLocomotora.velMaxima() })
	
	method formacionEficiente() = self.devuelveLocomotoras().all({ unaLocomotora =>  unaLocomotora.peso() * 5 >= unaLocomotora.puedeArrastrar() }) // TODO Lo mismo se podría delegar en la locomotora
	
	method pesoVagones() = self.devuelveVagones().sum({ unVagon => unVagon.cargaMaxima() }) 
	
	method arrastreUtil() = self.devuelveLocomotoras().sum({ unaLocomotora => unaLocomotora.puedeArrastrar() })
	
	method puedeMoverse() = self.pesoVagones() < self.arrastreUtil()
	
	// ---------------- 5 -------------//
	
	method kilosDeEmpuje(){
		if( self.pesoVagones() >= self.arrastreUtil() ){
			return self.pesoVagones() - self.arrastreUtil()
		}else return 0
	}

	// ---------------- 7 -------------//
	
	method cantVehiculos() = formacion.size()
	
	method pesoTotalFormacion() = formacion.sum({ unVehiculo => unVehiculo.cargaMaxima() })
	
	// ---------------- 8 -------------//	
		
	method kilosFaltantes() = (self.pesoVagones() - self.arrastreUtil() )	
		
		
		
}

