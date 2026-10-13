class Pack {
    const duracion
    const precio
    const coordinador
    const beneficios = []

    method duracion() = duracion
    method precioBase() = precio
    method beneficios() = beneficios
    method coordinadorACargo() = coordinador
    method valorFinal() {
        return self.precioBase() + beneficios.costo()
    } 
}

class Internacional inherits Pack {
  const interes
  const destino
  const escalas

  method destino() = destino
  method cantEscalas() = escalas
  method esDeInteres() = interes
}

class Nacional inherits Pack {
    const destino
    const actividades = []

    method destino() = destino
    method actividades() = actividades

}

///COORDINADOR 
class Coordinador {
  const añosXP
  const motivado
  const cantViajes
  var rol

  method añosDeExperiencia() = añosXP
  method estaMotivado() = motivado
  method cantViajesRealizados() = cantViajes
  method rolActual() = rol
  method cambiarRol(unRol) {
    if (unRol == "guia")
    rol = unRol
    else if (unRol == "asistenteLogistico")
    rol = unRol
    else if (unRol == "acompañante")
    rol = unRol
    else 
    self.error("este rol no existe")
  }
}

/// BENEFICIOS 
class BeneficiosOpcionales {
  const tipo
  const costo
  const vigente

  method tipo() = tipo
  method costo() = costo
  method vigente() = vigente
}
