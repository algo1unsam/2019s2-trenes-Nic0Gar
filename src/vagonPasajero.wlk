class VagonPasajero{
	
	var property ancho
	var property largo
	
	
	method cantPasajeros(){
		return ( (ancho * 8) + (largo * 10) ).roundUp() 	
	}

	method cargaMaxima(){
		return self.cantPasajeros() * 80
	}
	
	

}

