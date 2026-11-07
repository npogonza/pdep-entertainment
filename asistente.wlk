import abono.*
import entrada.*

class Asistente {
  const property abono
  const property historialEntradas = []
  var dinero 

  method comprar(unaEntrada) {
  try {
  if (dinero > 0)
  {
    dinero -= self.montoAPagar(unaEntrada)
    historialEntradas.add(unaEntrada)
  }
  else {throw new NoSePuedeComprarException()}
  } catch error: NoSePuedeComprarException {error.message()}
  }
  method historialAnioPasado() = historialEntradas.filter({e => e.esDelAnioPasado()})
  method historialNombreDeBandas() = historialEntradas.map({e => e.banda().nombre()}).asSet()
  method montoAPagar(entrada) = entrada.precioAlPublico() - abono.descuento(entrada)
  method gastoTotalDeEntradas() = historialEntradas.sum({e => e.precioAlPublico()})
  method dinero() = dinero // Por si se necesita para pruebas
}

class NoSePuedeComprarException inherits Exception {
  override method message() = "No puede comprar entrada con saldo negativo o 0."
}