import UIKit

struct Person{
    var name:String
    var age:Any
}
let person = Person(name:"ios",age:23)
print(person.age)
//2
struct Personn{
    var name:String
    var age:Any
}
struct Developer{
    var stack:String
}
let person1 = Personn(name:"ios",age:23)
let deve = Developer(stack: "ios")
print(person1.name)
print(deve.stack)
//3
struct PersonDetails{
    var name:String
    var age:Any
    
    func sayHello(){
        print("say hello to"+name)
    }
}
let persondet = PersonDetails(name:"sahithi",age:23)
persondet.sayHello()
//4
struct Car{
    var make:String
    var year:Int
    var colour:String
    
    func startEngine(){
        print(make + "eengine is started")
    }
    func drive(){
        print("driving"+make)
    }
    func park(){
        print("parked")
    }
}
let firstCar = Car(make: "Honda", year: 2010, colour: "blue")
let secondCar = Car(make: "BMW", year: 2020, colour: "black")

firstCar.startEngine()
secondCar.drive()
