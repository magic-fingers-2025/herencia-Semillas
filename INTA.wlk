import Parcelas.*
import Plantas.* 


object inta {
  const parcelas = []

  method cantidadDeParcelas() = parcelas.size()

  method promedioDePlantas() = parcelas.cantidadDePlantas().div(self.cantidadDeParcelas())

  method parcelasConMasDe4Plantas() = parcelas.filter({p => p.cantidadDePlantas() > 4})

  method parcelaMasSustentable() = self.parcelasConMasDe4Plantas().max({p => p.porcentajeDePlantasBienAsociadas()})
}