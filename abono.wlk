object fan {
  method descuento() = 0
}

class Vip {
  var descuentoParticular
  method descuento() = productora.precioAlPublico() * (descuentoParticular / 100)
  method bonificar() {
    descuentoParticular += 1
  }
}