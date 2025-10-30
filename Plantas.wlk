// Superclase general


class Planta {
  var property anioObtencion
  var property altura
  
  method esFuerte() = self.horasDeSolToleradas() > 10
  
  method daNuevasSemillas() = self.esFuerte() || self.condicionAlternativaParaSemillas()
  
  method horasDeSolToleradas()
  
  method espacioOcupado()
  
  method condicionAlternativaParaSemillas()

}

class Menta inherits Planta {
  override method horasDeSolToleradas() = 6
  
  override method espacioOcupado() = altura * 3
  
  override method condicionAlternativaParaSemillas() = altura > 0.4

}

class Soja inherits Planta {
  override method horasDeSolToleradas() {
    return if (altura < 0.5) {
       6
    } else if (altura.between(0.5, 1)) {
       7
    } else {
       9
    }
  }
  override method espacioOcupado() = altura / 2
  override method condicionAlternativaParaSemillas() = (anioObtencion > 2007) && (altura > 1)

}

class Quinoa inherits Planta {

  // aca nunca se especifica por lo que se debe agregar un valor a la hora de instanciarla
  const horasDeSolToleradas

  override method horasDeSolToleradas() = horasDeSolToleradas
    
  override method espacioOcupado() = 0.5
  
  override method condicionAlternativaParaSemillas() = anioObtencion < 2005
  
}

class SojaTransgenica inherits Soja {
  override method daNuevasSemillas() = false
}

class Hierbabuena inherits Menta {
  override method espacioOcupado() = (super().espacioOcupado()) * 2
}

