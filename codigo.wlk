object productora {
  var impuesto = 0      
  var asistentes = []
  var bandas = []       

  method precioAlPublico() = 1000 + impuesto
  method impuesto(impuestoFijado) {
    impuesto = impuestoFijado
  }
  method gananciaTotal() = (self.recaudacionEntradas()) - (self.costoBandas())
  method recaudacionEntradas() = self.entradasVendidas() * self.precioAlPublico()
  method entradasVendidas() = self.todasLasEntradas().size()
  method todasLasEntradas() = asistentes.flatMap({a => a.historialEntradas()})
  method bonificarAsistentesVip() {
    asistentes.forEach({a => a.abono().bonificar()})
  }
  method costoBandas() = bandas.map({b => b.presupuesto()}).sum()
  method entradasDeUnaBanda() = self.todasLasEntradas().map({e => e.banda()})
}

class Entrada {
  const property banda 
  const property fecha                          // new Date(day = 15, month = 6, year = 2025)
  method esDelAñoPasado() = fecha.year() == new Date().year() - 1
}

class Asistente {
  const property abono
  const property historialEntradas = []
  var dinero 

  method comprar(banda, fecha) {
  try {
  if (dinero > 0)
  {
    const entrada = new Entrada (banda = banda, fecha = fecha)
    dinero -= self.montoAPagar()
    historialEntradas.add(entrada)
  }
  else {throw new NoSePuedeComprarException()}
  } catch error: NoSePuedeComprarException {error.message()}
  }
  method historialAñoPasado() = historialEntradas.filter({e => e.esDelAñoPasado()})
  method historialNombreDeBandas() = historialEntradas.map({e => e.banda().nombre()})
  method montoAPagar() = productora.precioAlPublico() - abono.descuento()
}


class NoSePuedeComprarException inherits Exception {
  override method message() = "No puede comprar entrada con saldo negativo."
}

object fan {
  method descuento() = 0
  method bonificar() {}
}

class Vip {
  var descuentoParticular
  method descuento() = productora.precioAlPublico() * (descuentoParticular / 100)
  method bonificar() {
    descuentoParticular += 1
  }
}

class Banda {
  const property nombre
  
  method canon() = 1000000
  method presupuesto() = self.canon() + self.gastoExtra()
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
  override method canon() = self.popularidad() * 1000000
}

class BandaIndie inherits Banda {
  const cantidadInstrumentos
  
  override method gastoExtra() = 500 * cantidadInstrumentos
  override method popularidad() = 3.14 * nombre.size()
}

