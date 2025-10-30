// Superclase general


class Planta {
  var property anioObtencion
  var property altura
  
  method esFuerte() = self.horasDeSolToleradas() > 10
  
  method daNuevasSemillas() = self.esFuerte() || self.condicionAlternativaParaSemillas()
  
  method horasDeSolToleradas()
  
  method espacioOcupado()
  
  method condicionAlternativaParaSemillas()

  method esParcelaIdeal(unaParcela)
}

class Menta inherits Planta {
  override method horasDeSolToleradas() = 6
  
  override method espacioOcupado() = altura * 3
  
  override method condicionAlternativaParaSemillas() = altura > 0.4

  override method esParcelaIdeal(unaParcela) = unaParcela.superficie() > 6

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
  override method esParcelaIdeal(unaParcela) = unaParcela.horasDeSolPorDia() == self.horasDeSolToleradas()

}

class Quinoa inherits Planta {

  // aca nunca se especifica por lo que se debe agregar un valor a la hora de instanciarla
  const horasDeSolToleradas

  override method horasDeSolToleradas() = horasDeSolToleradas
    
  override method espacioOcupado() = 0.5
  
  override method condicionAlternativaParaSemillas() = anioObtencion < 2005

  override method esParcelaIdeal(unaParcela) = unaParcela.ningunaPlantaSuperaAlturaDe(1.5) 

}

class SojaTransgenica inherits Soja {
  override method daNuevasSemillas() = false

  override method esParcelaIdeal(unaParcela) = unaParcela.cantidadMaximaDePlantasToleradas() == 1
}

class Hierbabuena inherits Menta {
  override method espacioOcupado() = (super().espacioOcupado()) * 2

  //no responde a parcela ideal con una condicion diferente a la de su Padre, por lo que no es necsario hacerle su propio method, responde directamente con el LineUp al padre.
}

