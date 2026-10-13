class Pack {
    const duracion
    const precio
    const coordinador
    const beneficios = []

    method duracion() = duracion
    method precioBase() = precio
    method beneficios() = beneficios
    method cantBeneficios() {
        return beneficios.size()
    }
    method coordinadorACargo() = coordinador
    method costoTotalDeBeneficios() {
        return beneficios.sum({b=>b.costo()})
    }
    method valorFinal() {
        return self.precioBase() + self.costoTotalDeBeneficios()
    } 
    method esPremium()
}

class Internacional inherits Pack {
  const interes
  const destino
  const escalas

  method destino() = destino
  method cantEscalas() = escalas
  method esDeInteres() = interes
  override method valorFinal() {
    return super() + super() * 0.2
  }
  override method esPremium() {
    return self.esDeInteres() && 
            self.duracion() > 20 &&
            self.cantEscalas() == 0
  }
}

class Nacional inherits Pack {
    const destino
    const actividades = []

    method destino() = destino
    method actividades() = actividades
    method cantDeActividades() {
        return actividades.size()
    }
    override method esPremium() {
        return self.duracion() > 10 && coordinador.esAltamenteCalificado()
    }
}

class Provincial inherits Nacional {
    const cantCiudades

    method cantCiudadesAVisitar() = cantCiudades
    override method esPremium() {
      return self.cantDeActividades() > 4 &&
          self.cantCiudadesAVisitar() > 5
          self.cantBeneficios() >= 3
    }
    override method valorFinal() {
        return if (self.esPremium())
            super() + super() * 0.05
            else 
                super()
    }
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
  method esAltamenteCalificado() {
    return self.cantViajesRealizados() > 20 && self.cumpleRol()
  }
  method cumpleRol() {
    return if (rol == "guia") self.estaMotivado() 
        else if (rol == "asistenteLogistico") self.añosDeExperiencia() >= 3
        else true
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

