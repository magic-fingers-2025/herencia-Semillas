class Menta inherits Planta {
    override method horasDeSolToleradas() = 6

    override method daNuevasSemillas() = altura > 0.4

    method espacioOcupado() = altura * 3

    //parte4
    override method parcelaIdeal(unaParcela) = unaParcela.superficie() > 6

}

class Soja inherits Planta {
    override method horasDeSolToleradas() = if(altura < 0.5){6} else if(between(0.5, 1)){7} else {9}

    override method daNuevasSemillas() = anioObtencion > 2007 and altura > 1

    method espacioOcupado() = altura / 2

    //parte4
    override method parcelaIdeal(unaParcela) = unaParcela.horasSolRecibidas() == self.horasDeSolToleradas() 
}