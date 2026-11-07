import asistente.*
import banda.*

object productora {
  var property impuesto = 0      
  var asistentes = #{}
  var bandas = []       
  // Entendí que la profe dijo que no hacía falta poner elementos en la lista o poner getters, es por fuera del enunciado.

  method gananciaTotal() = (self.recaudacionEntradas()) - (self.costoBandas())
  method recaudacionEntradas() = asistentes.sum({a => a.gastoTotalDeEntradas()})
  method costoBandas() = bandas.sum({b => b.presupuesto()})

  method entradasVendidas() = asistentes.sum({ a => a.historialEntradas().size() })
  method entradasDeUnaBanda(banda) = asistentes.sum({a => a.historialEntradas().count({e => e.banda() == banda})})
  method bandaMasPopular() = bandas.max({b => self.entradasDeUnaBanda(b)})

  method bonificarAsistentesVip() {
    asistentes.forEach({a => a.abono().bonificar()})
  }
}
