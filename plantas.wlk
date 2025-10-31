class Planta {
  // cero sería una planta que sólo vive con 100% sombra. Si no se dice nada se asume esto.
  const toleranciaAlSol = 0 
  const anioDeObtencion
  // Se asume que el plantín ya viene con una altura si no se dice nada
  const property altura = 0.2 
  

  // abtracto
  
  method espacioOcupado()
  
  method toleranciaAlSol()

  method condicionAlternativaParaSemillas()

  method percibeAParcelaComoIdeal(unaParcela)

  method daNuevasSemillas() = self.esFuerte() || self.condicionAlternativaParaSemillas()

  // método universal para todas las especies
  method esFuerte() = toleranciaAlSol >= 10

  method sePuedeAsociarBienA(unaParcela) = unaParcela.seAsociaBienCon(self)
  
  
}

class Menta inherits Planta {
  
  override method toleranciaAlSol() = 6

  override method espacioOcupado() = altura * 3
  
  override method condicionAlternativaParaSemillas() = altura > 0.4
    
  
  override method percibeAParcelaComoIdeal(
    unaParcela
  ) = unaParcela.superficie() > 6
}

class Soja inherits Planta {
  
  override method toleranciaAlSol() = if (altura < 0.5) {
    6
  } else if (altura < 1) 7 else 9
  
  override method espacioOcupado() = altura / 2

  override method condicionAlternativaParaSemillas() = (anioDeObtencion > 2007) && (altura > 1)

  
  
  override method percibeAParcelaComoIdeal(
    unaParcela
  ) = self.toleranciaAlSol() == unaParcela.horasDeSol()
}


class Quinoa inherits Planta {
  
  override method toleranciaAlSol() = toleranciaAlSol

  override method espacioOcupado() = 0.5
  
  override method condicionAlternativaParaSemillas() = anioDeObtencion < 2005
  

  override method percibeAParcelaComoIdeal(
    unaParcela
  ) = unaParcela.plantas().all({ p => p.altura() < 1.5 })
}

class SojaTransgenica inherits Soja {

  override method daNuevasSemillas() = false
  
  override method percibeAParcelaComoIdeal(
    unaParcela
  ) = unaParcela.maximoDePlantas() == 1
}

class HierbaBuena inherits Menta {
  override method espacioOcupado() = super() * 2
}

