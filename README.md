object productora {
  var impuesto = 0      // Se debe cambiar cuando la productora quiera, considero que debe cambiarse desde la variable porque al hacer un
                        // impuesto(impuestoFijado) pierdo Encapsulamiento
  var entradasVendidas = []
  var shows = []        // Lista de todas las bandas que hicieron shows, si una misma banda hace 2 shows se debe agregar dos veces
  
  method impuesto(impuestoFijado) {     // A pesar de perder Encapsulamiento esta funcion la hago porque puede variar cuando la productora quiera
    impuesto = impuestoFijado
  }
  method precioAlPublico() = 1000 + impuesto
  method vender(entrada) {
    entradasVendidas.add(entrada)
  }
  method gananciaTotal() = (entradasVendidas.size() * self.precioAlPublico()) - (shows.map({b => b.presupuesto()}))
  method entradasVendidas() = entradasVendidas.size()
  method bandaMasPopular() = entradasVendidas.max({e=> })
  method bonificarAsistentesVip() {
    Asistente.descuentoParticular(Asistente.descuentoParticular() +1)
  }
}

class Entrada {
  const property banda 
  const fecha = dia + mes + año
  const dia
  const mes
  const año
  method esDelAñoPasado() = año == 2025
}

class Asistente {
  const abono
  const historialEntradas = []
  var dinero 
  var property descuentoParticular

  method comprar(entrada) {
  try {
  if (dinero > 0)
  {
    productora.vender(entrada)
    dinero -= productora.precioAlPublico() - abono.descuento()
    historialEntradas.add(entrada)
  }
  else {throw new NoSePuedeComprarException()}
  } catch error: NoSePuedeComprarException {error.message()}
  }
  method historialAñoPasado() = historialEntradas.filter({e => e.esDelAñoPasado()})
  method historialNombreDeBandas() = historialEntradas.map({e => e.banda().nombre()})
}


class NoSePuedeComprarException inherits Exception {
  override method message() = "No puede comprar entrada con saldo negativo."
}

object fan {
  method descuento(asistente) = 0
}

object vip {
  method descuento(asistente) = productora.precioAlPublico() * (asistente.descuentoParticular() / 100)
}

class Banda {
  const property nombre
  const canon = 1000000

  method presupuesto() = canon + self.gastoExtra()
  method gastoExtra() 
  method popularidad()
} 

class BandaDeRock inherits Banda {
  const cantidadDeSolos

  override method gastoExtra() = 10000
  override method popularidad() = 100 * cantidadDeSolos
}

class BandaDeTrap inherits Banda {
  const tienenHielo

  override method gastoExtra() = 0
  override method popularidad() { if (tienenHielo) {return 1000}
                                  else {return 0}
  }
  override method presupuesto() = self.popularidad() + self.gastoExtra() 
}

class BandaIndie inherits Banda {
  const cantidadInstrumentos
  
  override method gastoExtra() = 500 * cantidadInstrumentos
  override method popularidad() = 3.14 * nombre.size()
}
