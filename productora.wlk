import asistente.*
import banda.*

object productora {
  var property impuesto = 0      
  var asistentes = #{}
  var bandas = []       

  method gananciaTotal() = (self.recaudacionEntradas()) - (self.costoBandas())
  method recaudacionEntradas() = asistentes.sum(a => a.gastoTotalDeEntradas())
  method costoBandas() = bandas.sum({b => b.presupuesto()})

  method entradasVendidas() = asistentes.sum({ a => a.historialEntradas().size() })
  method entradasDeUnaBanda(banda) = asistentes.map(a => a.historialEntradas()).sum({e => e.banda() == banda})
  method bandaMasPopular() = bandas.max({b => self.entradasDeUnaBanda(b)})

  method bonificarAsistentesVip() {
    asistentes.forEach({a => a.abono().bonificar()})
  }
}
