class Planta{
  // atributos universales
  var toleranciaAlSol = 1
  const anioDeObtencion
  // modelo que el plantín ya viene con una altura
  const property altura = 0.2
   
  // método universal para todas las especies

  method esFuerte() = toleranciaAlSol >=10
  
  method percibeAParcelaComoIdeal(unaParcela) = true

  method seAsociaBienCon(parcela){
    if (parcela.esEcologica()){
      return (not parcela.tieneComplicaciones()) and self.percibeAParcelaComoIdeal(parcela)
    }
    else{
      return (parcela.maximoDePlantas() ==2) and self.esFuerte()
    }
  }
 
  
}

class Menta inherits Planta{
  
  method toleranciaAlSol() = 6
  
  method daSemillas() = self.esFuerte() or altura > 0.4
  method espacioOcupado() = altura*3
  override method percibeAParcelaComoIdeal(unaParcela) = unaParcela.superficie() > 6
}

class Soja inherits Planta{
  method toleranciaAlSol() = if (altura < 0.5) 6 else if ( altura.between(0.5, 1)) 7 else 9
  method daSemillas() = self.esFuerte() or  (anioDeObtencion > 2007 and altura > 1)
  method espacioOcupado() = altura/2
  
  override method percibeAParcelaComoIdeal(unaParcela) = self.toleranciaAlSol() == unaParcela.horasDeSol()
}

class Quinoa inherits Planta{
   
  method toleranciaAlSol() = toleranciaAlSol 
  
  method daSemillas() = self.esFuerte() or anioDeObtencion < 2005
  method espacioOcupado() = 0.5
  
  override method percibeAParcelaComoIdeal(unaParcela) = unaParcela.plantas().all{p => p.altura() < 1.5}
  
}

class SojaTransgenica inherits Soja{
  override method daSemillas(){}
  override method percibeAParcelaComoIdeal(unaParcela) = unaParcela.maximoDePlantas() == 1
}

class HierbaBuena inherits Menta{
  override method espacioOcupado() = super()*2
  
}

class Parcela{
  const ancho
  const largo
  const property superficie = ancho*largo
  const property horasDeSol
  const property plantas = []
  const property esEcologica

  method maximoDePlantas() = if (ancho > largo) superficie/5 else superficie/3 + largo

  method tieneComplicaciones() = plantas.filter{p => p.toleranciaAlSol() < horasDeSol}.size() > 0

  method plantar(unaPlanta){
    if (plantas.size() < self.maximoDePlantas() and horasDeSol < unaPlanta.toleranciaAlSol() +2) {
      plantas.add(unaPlanta)
    }
    else {
      self.error("No se puede plantar")
    }
  }

  method porcentajeDePlantasBienAsociadas(){

  plantas.filter{p => p.seAsociaBienCon(self)}.size()/plantas.size()

  }
}


object inta{
  const parcelas = []

  method promedioDePlantas()= parcelas.average{p => p.size()}

  method parcelaMasAutosustentable() = parcelas.filter{p => p.size() > 4}.max{p => p.porcentajeDePlantasBienAsociadas()}



}

