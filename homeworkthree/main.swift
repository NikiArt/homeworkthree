//
//  main.swift
//  homeworkthree
//
//  Created by Nikita Boiko on 13/10/2019.
//  Copyright © 2019 Nikita Boiko. All rights reserved.
//

import Foundation

enum CarActions: String {
    case startEngine = "Запуск двигателя"
    case stopEngine = "Остановка двигателя"
    case openWindows = "Открытие окон"
    case closeWindows = "Закрытие окон"
    case getInTrunk = "Загрузка кузова"
    case getOffTrunk = "Разгрузка кузова"
}

struct Car {
    var brand: String
    var year: Int
    var volume: UInt
    var isStartEngine: Bool
    var isOpenWindows: Bool
    var currentVolume: UInt
    
    init(brand: String, year: Int, volume: UInt) {
        self.brand = brand
        self.year = year
        self.volume = volume
        isOpenWindows = false
        isStartEngine = false
        currentVolume = 0
    }
    
    mutating func action(actionType: CarActions, volume: UInt = 0) {
        switch actionType {
        case .startEngine:
            isStartEngine = true
            print("У автомобиля \(brand): Двигатель запущен")
        case .stopEngine:
            isStartEngine = false
            print("У автомобиля \(brand): Двигатель заглушен")
        case .openWindows:
            isOpenWindows = true
            print("У автомобиля \(brand): Окна открыты")
        case .closeWindows:
            isOpenWindows = false
            print("У автомобиля \(brand): Окна закрыты")
        case .getInTrunk:
            let amount = volume + currentVolume
            if amount > self.volume {
                currentVolume = self.volume
                print("У автомобиля \(brand): Превышен допустимый объем. \(amount - self.volume) осталось не загружено")
            } else {
                currentVolume += volume
            }
            print("У автомобиля \(brand): Текущая загрузка составляет \(currentVolume)")
        case .getOffTrunk:
            let amount = Int(currentVolume - volume)
            if amount < 0 {
                currentVolume = 0
                print("У автомобиля \(brand): Автомобиль разгружен полностью.")
            } else {
                currentVolume -= volume
            }
            print("У автомобиля \(brand): Текущая загрузка составляет \(currentVolume)")
        }
    }
}

struct Truck {
    var brand: String
    var year: Int
    var volume: UInt
    var isStartEngine: Bool
    var isOpenWindows: Bool
    var currentVolume: UInt
    
    init(brand: String, year: Int, volume: UInt) {
        self.brand = brand
        self.year = year
        self.volume = volume
        isOpenWindows = false
        isStartEngine = false
        currentVolume = 0
    }
    
    mutating func action(actionType: CarActions, volume: UInt = 0) {
        switch actionType {
        case .startEngine:
            isStartEngine = true
            print("У грузовика \(brand): Двигатель запущен")
        case .stopEngine:
            isStartEngine = false
            print("У грузовика \(brand): Двигатель заглушен")
        case .openWindows:
            isOpenWindows = true
            print("У грузовика \(brand): Окна открыты")
        case .closeWindows:
            isOpenWindows = false
            print("У грузовика \(brand): Окна закрыты")
        case .getInTrunk:
            let amount = volume + currentVolume
            if amount > self.volume {
                currentVolume = self.volume
                print("У грузовика \(brand): Превышен допустимый объем. \(amount - self.volume) осталось не загружено")
            } else {
                currentVolume += volume
            }
            print("У грузовика \(brand): Текущая загрузка составляет \(currentVolume)")
        case .getOffTrunk:
            let amount = Int(currentVolume - volume)
            if amount < 0 {
                currentVolume = 0
                print("У грузовика \(brand): Автомобиль разгружен полностью.")
            } else {
                currentVolume -= volume
            }
            print("У грузовика \(brand): Текущая загрузка составляет \(currentVolume)")
        }
    }
}

var carOne = Car(brand: "Honda", year: 2012, volume: 830)
var carTwo = Car(brand: "Nissan", year: 2008, volume: 1300)
var truckOne = Truck(brand: "SCANIA", year: 2012, volume: 3500)
carOne.action(actionType: .startEngine)
carTwo.action(actionType: .getInTrunk, volume: 800)
carTwo.action(actionType: .openWindows)
carTwo.action(actionType: .getInTrunk, volume: 800)
truckOne.action(actionType: .startEngine)

