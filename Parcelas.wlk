import Plantas.*

class Parcela {
  //decidimos poner los atributos como "const property" ya que a lo largo del enunciado nunca se menciona que se pueda alterar el valor de estos mismos, y tabien el property para facilitar su lectura
  const property ancho // metros
  const property largo
  const property horasDeSolPorDia
  const plantas = []
  
  method cantidadDePlantas() = plantas.size()
  
  method horasDeSolPorDia() = horasDeSolPorDia
  
  method superficie() = ancho * largo
  
  method cantidadMaximaDePlantasToleradas() = if (ancho > largo)
                                                self.superficie().div(5)
                                              else self.superficie().div(
                                                  3
                                                ) + largo
  
  method tieneComplicaciones() = plantas.any(
    { p => p.horasDeSolQueTolera() < horasDeSolPorDia }
  )
  
  method puedePlantar(
    unaPlanta
  ) = ((unaPlanta.horasDeSolQueTolera() + 2) >= horasDeSolPorDia) && (self.cantidadDePlantas() < self.cantidadMaximaDePlantasToleradas())
  
  method plantar(unaPlanta) {
    if (self.puedePlantar(unaPlanta)) {
      plantas.add(unaPlanta)
    } else {
      return "error"
    }

    
  }

  method sePuedeAsociarA(unaPlanta)
  
  method ningunaPlantaSuperaAlturaDe(unaAltura) = plantas.any(
    { p => p.altura() > unaAltura }
  )
  
  method cantidadDePlantasBienAsociadas() = plantas.count(
    { p => p.esParcelaIdeal(self) }
  )
  
  method porcentajeDePlantasBienAsociadas() = (self.cantidadDePlantasBienAsociadas() / self.cantidadDePlantas()) * 100
}

class ParcelaEcologica inherits Parcela {
  override method sePuedeAsociarA(unaPlanta) = (not self.tieneComplicaciones()) && unaPlanta.esParcelaIdeal(self)

  override method puedePlantar(unaPlanta) = super(unaPlanta) and self.sePuedeAsociarA(unaPlanta)
 }

class ParcelaIndustrial inherits Parcela {
  
  override method sePuedeAsociarA(unaPlanta) = (plantas.size() <= 2) && unaPlanta.esFuerte()
  
  override method puedePlantar(unaPlanta) = super(unaPlanta) and self.sePuedeAsociarA(unaPlanta)
}