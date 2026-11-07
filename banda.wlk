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
  override method popularidad() = if (tienenHielo) 1000 else 0 
  override method canon() = super() * self.popularidad()
}

class BandaIndie inherits Banda {
  const cantidadInstrumentos
  
  override method gastoExtra() = 500 * cantidadInstrumentos
  override method popularidad() = 3.14 * nombre.size()
}
