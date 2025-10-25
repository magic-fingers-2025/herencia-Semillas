import plantas.*
import parcelas.*

object inta {
    const parcelas = []

    method agregarParcela(unaParcela) {parcelas.add(unaParcela)}

    method promedioDePlantas() = self.cantidadTotalaDePlantas() / self.cantidadDeParcelasRegistradas()
    method cantidadDeParcelasRegistradas() = parcelas.size() 
    method cantidadTotalaDePlantas() =  parcelas.fold(0, {p => p.cantidadDePlantasEnParcela()})


    method parcelaMasAutosustentable() = parcelas.filter({p => p.esParcelaMasAutosustentable()}) 
    method esParcelaMasAutosustentable() = self.parcelasConCantidadDePlantasMasDe(4) && self.parcelaConMejorPorcentajeDeAsociacion()
    method parcelasConCantidadDePlantasMasDe(cantidad)  = parcelas.filter({p => p.cantidadDePlantasEnParcela() > 4})
    method parcelaConMejorPorcentajeDeAsociacion() = parcelas.filter({p => p.porcentajeDePlantasBienAsociadas()}).max()
}