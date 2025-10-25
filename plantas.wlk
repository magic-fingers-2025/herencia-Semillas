import parcelas.*


class Planta{
  const property anioObtencion
  const altura
  const property horasDeSolToleradas
  const espacioOcupado

  method esFuerte() = horasDeSolToleradas > 10 
  method daSemillasNuevas() = self.esFuerte()

}

class PlantaMenta inherits Planta{

  override method horasDeSolToleradas() = 6 
  override method daSemillasNuevas() = super() and altura > 0.4
  method espacioOcupado() = altura * 3

  method esParcelaIdeal(unaParcela) = unaParcela.superficie() < 6 

}

class PlantaSoja inherits Planta{

  override method horasDeSolToleradas() {
   return if(altura > 0.5){
        6
      }else if(altura.between(0.5, 1)){
        7
      }else{
        9
      }
  }
  method espacioOcupado() = altura / 2 
  override method daSemillasNuevas() = super() and anioObtencion > 2007 && altura > 1

  method esParcelaIdeal(unaParcela) = unaParcela.horasDeSolRecibidas() == self.horasDeSolToleradas()
}


class PlantaQuinoa inherits Planta{

  method espacioOcupado() =  0.5
  override method daSemillasNuevas() = super() and anioObtencion < 2005
  method esParcelaIdeal(unaParcela) = unaParcela.ningunaPlantaMayorA(1.5)

}

class SojaTransgenica inherits PlantaSoja{

  override method daSemillasNuevas() = false 
  override method esParcelaIdeal(unaParcela) = unaParcela.cantidadPlantasMaximaTolerada() == 1

}

class HierbaBuena inherits PlantaMenta{

  override method espacioOcupado() = super() * 2 //????????

}