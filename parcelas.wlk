import plantas.*

class Parcela {
  const ancho
  const largo
  const property superficie = ancho * largo
  const property horasDeSol
  const property plantas = []
  
  
  // subtarea comunicativa. Impacta en 2 métodos.
  method cantidadDePlantas() = plantas.size()

  // Si la cuenta no da entero, usar función piso. El máximo de plantas debe ser un número entero positivo.
  method maximoDePlantas() = if (ancho > largo) (superficie / 5).floor()
                             else ((superficie / 3) + largo).floor()
  
  method tieneComplicaciones() = plantas.any{ p => p.toleranciaAlSol() < horasDeSol }
  
  
  // subtarea comunicativa. Elegancia en plantar(unaPlanta)
  method puedePlantar(unaPlanta) = (self.cantidadDePlantas() < self.maximoDePlantas()) and (horasDeSol < (unaPlanta.toleranciaAlSol() + 2))
  

  method plantar(unaPlanta) {
    if (self.puedePlantar(unaPlanta)){
      plantas.add(unaPlanta)
    }
    else self.error("No se puede plantar")
  }
  

  // vacío para que se pueda instanciar
  method seAsociaBienCon(unaPlanta){}

  method cantidadDePlantasBienAsociadas() = plantas.count{p => p.percibeAParcelaComoIdeal(self)}

  method porcentajeDePlantasBienAsociadas() = (self.cantidadDePlantasBienAsociadas() / self.cantidadDePlantas()) * 100

}

class ParcelaEcologica inherits Parcela {

  override method seAsociaBienCon(unaPlanta) = (not self.tieneComplicaciones()) && unaPlanta.percibeAParcelaComoIdeal(self)

}

class ParcelaIndustrial inherits Parcela {
  
  override method seAsociaBienCon(unaPlanta) = (plantas.size() <= 2) && unaPlanta.esFuerte()
  
}


object inta {
  const property parcelas = []

  method agregarParcela(parcela) = parcelas.add(parcela)
  
  // Truncamos para cuando no de exacto y tengamos que testear
  method promedioDePlantas() = parcelas.average{ p => p.cantidadDePlantas()}.truncate(1)
  
  method parcelaMasAutosustentable() = parcelas.filter(
    { p => p.cantidadDePlantas() > 4 }
  ).max({ p => p.porcentajeDePlantasBienAsociadas() })
}