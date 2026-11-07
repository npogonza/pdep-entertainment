object fan {
  method descuento(entrada) = 0
  method bonificar() {}         
  // Esto no lo saco porque a pesar del issue para que se pueda bonificar
  // a cualquier asistente, si no tendría que filtrarlos de una manera extraña
}

class Vip {
  var descuentoParticular
  method descuento(entrada) = entrada.precioAlPublico() * (descuentoParticular / 100)
  method bonificar() {
    descuentoParticular += 1
  }
}