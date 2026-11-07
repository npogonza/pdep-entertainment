import productora.*

class Entrada {
  const property banda 
  const property fecha                          // new Date(day = 15, month = 6, year = 2025)
  method esDelAnioPasado() = fecha.year() == new Date().year() - 1
  method precioAlPublico() = 1000 * (1 + productora.impuesto() / 100)
}