//
//  main.swift
//  Clase 9
//
//  Created by Alumno on 8/4/26.
//

import Foundation

class Persona {
    var nombre: String
    fileprivate var edad: Int
    
    init(nombre: String, edad: Int) {
        self.nombre = nombre
        self.edad = edad
    }
    
    init() {
        self.nombre = "Desconocido"
        self.edad = 0
    }
    
    convenience init(nombre: String) {
        self.init(nombre: nombre, edad: 0)
    }
    
    func dameEdad() -> Int {
        return self.edad
    }
        
    func saludar() {
        print("Hola, mi nombre es \(self.nombre) y tengo \(edad) años")
    }
}

let persona1 = Persona(nombre: "Ariel", edad: 30)
persona1.saludar()

let persona2 = Persona()
persona2.saludar()

let persona3 = Persona(nombre: "Juan")
persona3.saludar()
print(persona3.dameEdad())
persona3.edad = 15
persona3.saludar()

print("-------------------------------")

struct PuntoStruct {
    var x: Int
    var y: Int
    
    func mostrar() {
        print("(\(x), \(y))")
    }
}

var p1 = PuntoStruct(x: 3, y: 4)
var p2 = p1
p2.x = 0

p1.mostrar()
p2.mostrar()

class PuntoClass {
    var x: Int
    var y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    func mostrar() {
        print("(\(x), \(y))")
    }
}

var punto1 = PuntoClass(x: 1, y: 2)
var punto2 = punto1
var punto3 = PuntoClass(x: 0, y: 0)
punto2.x = 10

punto1.mostrar()
punto2.mostrar()

print("-------------------------------")

class Estudiante : Persona {
    var carrera : String
    
    init(carrera: String, nombre: String, edad: Int) {
        self.carrera = carrera
        super.init(nombre: nombre, edad: edad)
    }
    
    override func saludar() {
        print("Hola, me llamo \(self.nombre), tengo \(self.edad) y estudio \(self.carrera)")
    }
}

let estudiante1 = Estudiante(carrera: "Ingeniería", nombre: "Carlos", edad: 22)
estudiante1.saludar()

let estudiante2 = Estudiante(carrera: "Derecho", nombre: "Julia", edad: 21)
estudiante2.saludar()

print("-------------------------------")

class Animal {
    func hacerSonido() {
        print("Sonido genrico")
    }
}

class Perro : Animal {
    override func hacerSonido() {
        print("Guau!")
    }
}

class Gato : Animal {
    override func hacerSonido() {
        print("Miau!")
    }
}

class Vaca : Animal {
    override func hacerSonido() {
        print("Muu!")
    }
}

let animales : [Animal] = [Perro(), Gato(), Vaca()]

for animal in animales {
    animal.hacerSonido()
}

print("-------------------------------")

class Banco {
    private var saldo : Double = 0.0
    
    init() {
        self.saldo = 0.0
    }
    
    func depositar(cantidad: Double) {
        if cantidad > 0 {
            self.saldo += cantidad
        } else {
            print("No se puede depositar una cantidad negativa")
        }
    }
    
    func retirar(cantidad : Double) {
        if cantidad > 0 && saldo >= cantidad {
            self.saldo -= cantidad
        } else {
            print("No se puede retirar una cantidad negativa o el saldo es insuficiente")
        }
    }
    
    func devolverSaldo() -> Double {
        return self.saldo
    }
}

let banco = Banco()
banco.depositar(cantidad: 1000)
banco.retirar(cantidad: 200)
banco.retirar(cantidad: 600)
//print(banco.saldo)
//banco.saldo = 1000000000000
print("Saldo final \(banco.devolverSaldo())")

print("-------------------------------")

class Usuario {
    var nombre: String
    var correo: String
    private var password: String
    var esta_activo: Bool
    
    init(nombre: String, correo: String, password: String, esta_activo: Bool) {
        self.nombre = nombre
        self.correo = correo
        self.password = password
        self.esta_activo = esta_activo
    }
    
    convenience init(nombre: String, correo: String, password: String) {
        self.init(nombre: nombre, correo: correo, password: password, esta_activo: true)
    }
    
    func login(pass: String) -> Bool {
        return self.password == pass
    }
    
    func cambiarPass(current_pass: String, new_pass: String) -> Bool {
        guard self.password == current_pass else {
            print("La contraseña actual es incorrecta")
            return false
        }
        guard self.esta_activo else {
            print("El usuario no esta activo")
            return false
        }
        guard new_pass.count > 6 else {
            print("La contraseña debe tener mas de seis caracteres")
            return false
        }
        self.password = new_pass
        return true
    }
    
    func activar() {
        self.esta_activo = true
    }
    
    func desactivar() {
        self.esta_activo = false
    }
    
    func descripcion() {
        print("NOMBRE: \(self.nombre), CORREO: \(self.correo), ACTIVO: \(esta_activo)")
    }
}

var user = Usuario(nombre: "Juan", correo: "juan@gmail.com", password: "1234qwer")
print(user.login(pass: "qwer1234"))
print(user.login(pass: "1234qwer"))

print(user.cambiarPass(current_pass: "1234qwer", new_pass: "1234qwer"))

user.descripcion()
