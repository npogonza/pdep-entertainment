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
  method historialNombreDeBandas() = historialEntradas.map({e => e.banda().nombre()})
  method montoAPagar(entrada) = entrada.precioAlPublico() - abono.descuento()
  method gastoTotalDeEntradas() = historialEntradas.sum({e => self.montoAPagar(e)})
}

class NoSePuedeComprarException inherits Exception {
  override method message() = "No puede comprar entrada con saldo negativo."
}