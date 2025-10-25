import plantas.*

class Parcela{
    const ancho
    const largo
    const property horasDeSolRecibidas

    const plantas = []

    method plantasEnParcela() = plantas // muestra las plantas en la parcela
    method cantidadDePlantasEnParcela() = plantas.size() 

    method superficie() = ancho * largo
    method cantidadPlantasMaximaTolerada() = if (ancho > 5) self.superficie() / 5 else (self.superficie() / 3) + largo 

    method tieneComplicaciones() = plantas.any({p => p.horasDeSolToleradas() > horasDeSolRecibidas}) 

    method plantar(unaPlanta) {
        if(self.cantidadPlantasMaximaTolerada() || horasDeSolRecibidas >= 2){
            plantas.add(unaPlanta)
        }
    }

    method ningunaPlantaMayorA(unaAltura) = plantas.any({p => p.altura() > unaAltura})
}

class ParcelaEcologica inherits Parcela{

    var cantidadPlantasBienAsociadas = 0

    method puedeAsociarseBienA(unaPlanta) {
        if(self.tieneComplicaciones() && unaPlanta.esParcelaIdeal(self)){
            return true
            cantidadPlantasBienAsociadas = cantidadPlantasBienAsociadas + 1
        }
    }

    method porcentajeDePlantasBienAsociadas() = cantidadPlantasBienAsociadas / self.cantidadDePlantasEnParcela()
    
}

class ParcelaIndustrial inherits Parcela{

    var cantidadPlantasBienAsociadas = 0

    method puedeAsociarseBienA(unaPlanta) {
        if(self.tieneComplicaciones() && unaPlanta.esParcelaIdeal(self)){
            return true
            cantidadPlantasBienAsociadas = cantidadPlantasBienAsociadas + 1
        }
    }

    method porcentajeDePlantasBienAsociadas() = cantidadPlantasBienAsociadas / self.cantidadDePlantasEnParcela()
}