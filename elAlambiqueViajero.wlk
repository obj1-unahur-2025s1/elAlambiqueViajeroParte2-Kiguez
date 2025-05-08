object luke{
    var cantidadViajes = 0
    var recuerdo = null
    var vehiculo = alambiqueVeloz

    method cantidadViajes() = cantidadViajes 

    method viajar(lugar){
        if (lugar.puedeLlegar(vehiculo)) {
            cantidadViajes = cantidadViajes + 1
            recuerdo = lugar.recuerdoTipico()
            vehiculo.desgaste()
        }
    }
    method recuerdo() = recuerdo
    method vehiculo(nuevo) {vehiculo = nuevo}
}

object alambiqueVeloz {
    var rapido = true
    var combustible = 20
    const consumoPorViaje = 10
    var patente = "AB123JK"
    method puedeFuncionar() = combustible >= consumoPorViaje
    method desgaste() {
        combustible = combustible - consumoPorViaje
    }
    method rapido() = rapido
    method patenteValida() = patente.startsWith("A")
    method combustible() = combustible
    method velocidad() = 80
}

object paris{
    method recuerdoTipico() = "Llavero Torre Eiffel"
    method puedeLlegar(movil) =  movil.puedeFuncionar() 
    
}

object buenosAires{
    method recuerdoTipico() = "Mate"
    method puedeLlegar(auto) =  auto.rapido() 
}

object bagdad {
    var recuerdo = "bidon de petroleo"
    method recuerdoTipico() = recuerdo
    method recuerdo(nuevo) {recuerdo = nuevo }
    method puedeLlegar(cualquierCosa) = true
}

object lasVegas{
    var homenaje = paris
    method homenaje(lugar) {homenaje = lugar}
    method recuerdoTipico() = homenaje.recuerdoTipico()
    method puedeLlegar(vehiculo) = homenaje.puedeLlegar(vehiculo)
}

object antigualla {
    var gangsters = 7
    method puedeFuncionar() = gangsters.even()
    method rapido() = gangsters > 6
    method desgaste(){
        gangsters = gangsters -1
    }
    method patenteValida() = chatarra.rapido() 
     method velocidad() = 60

}
object chatarra {
    var cañones = 10
    var municiones = "ACME"
    method puedeFuncionar() = municiones == "ACME" and cañones.between(6,12)
    method rapido() = municiones.size() < cañones
    method desgaste(){
        cañones = (cañones / 2).roundUp(0)
        if (cañones < 5 )
          municiones = municiones + " Obsoleto"
    }
    method patenteValida() = municiones.take(4) == "ACME" 
    method cañones() = cañones
     method velocidad() = 50

}

object convertible{
    var convertido = antigualla
    method puedeFuncionar() = convertido.puedeFuncionar() 
    method rapido() = convertido.rapido()
    method desgaste(){
        convertido.desgaste()
    }
    method convertir(vehiculo){
        convertido = vehiculo
    }
    method patenteValida() = convertido.patenteValida()
     method velocidad() = convertido.velocidad()
}

object hurlingham{
   method puedeLlegar(vehiculo) =
     vehiculo.puedeFuncionar() and vehiculo.rapido() and vehiculo.patenteValida()
  method recuerdoTipico() = "sticker de la Unahur"
}


object moto{
    method rapido() = true
    method puedeFuncionar() = not self.rapido()
    method desgaste() {}
    method patenteValida() = false
    method velocidad() = 100
}

object carrera{

    var ciudad = hurlingham

    const aceptados = []

    const rechazados = []

    method aceptados() = aceptados

    method rechazados() = rechazados

    method ciudad() = ciudad

    method inscribirAuto(auto) {
        if(ciudad.puedeLlegar(auto)){
            aceptados.add(auto)
        }
        else rechazados.add(auto)
    }


     method cambiarCiudad(nuevaCiudad) {
        ciudad = nuevaCiudad
        rechazados.addAll(aceptados)
        aceptados.clear()
        aceptados.addAll(rechazados.filter({a=>ciudad.puedeLlegar(a)}))
        rechazados.removeAll(aceptados)
    }


    method irALaCarrera() {
        aceptados.forEach({a=>a.desgaste()})
    }


    method ganador() {
        return
            aceptados.max({a=>a.velocidad()})
    }
}

object antiguallaBlindada { 
    const gangsters = ["juan" , "pedro" , "tobias" , "matias" , "lucas" , "ignacio" , "cristian"]
    method puedeFuncionar() = gangsters.size().even()
    method rapido() = gangsters.size() > 6
    method desgaste(){
        gangsters.remove(gangsters.anyOne())
    }
    method patenteValida() = chatarra.rapido()
    method velocidad() {
        return
            gangsters.sum({g=>g.size()})
    }
    method subirGangster(gangster) {
        gangsters.add(gangster)
    }
    method bajarGangster(gangster) {
        gangsters.remove(gangster)
    }
    method gangsters() = gangsters
}


object superPerrari {
    method rapido() = true
    method puedeFuncionar() = not self.rapido()
    method desgaste() {}
    method patenteValida() = true
    method velocidad() = 90
    method SabotearAuto() {}  
}


object superConvertible {
    const autos = [alambiqueVeloz , moto , antiguallaBlindada]
    var convertido = autos.max({a=>a.velocidad()})
    method puedeFuncionar() = convertido.puedeFuncionar()
    method rapido() = convertido.rapido()
    method desgaste(){
        convertido.desgaste()
    }
    method patenteValida() = convertido.patenteValida()
    method velocidad() = convertido.velocidad()
}