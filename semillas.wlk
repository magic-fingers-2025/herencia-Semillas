import parcelas.*

class Planta {

    const anioObtencion 
    const altura

   
    method horasDeSolToleradas()= 0 
    method esFuerte() = self.horasDeSolToleradas()>10
    method daNuevasSemillas() = self.esFuerte() 
    method anioDeObtencion() = anioObtencion 
    method altura() = altura
  
}