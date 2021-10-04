//
//  main.swift
//  L4_ZDA
//
//  Created by Дмитрий Заика on 23.09.2021.
//

import Foundation

enum StateMotor {
    case stoped
    case warming
    case worked
}

enum ActionWithMotor {
    case start
    case stop
}

enum StateWindows {
    case closed
    case opened
}

enum ActionWithWindows {
    case open
    case close
}

enum ActionWithTrunk {
    case load
    case unload
}

enum Fuel {
    case Petrol
    case Disel
    case Gas
    case Electro
}


//MARK: - Class Car
class Car {
    let brand: String
    let model: String
    let type: String
    let yearCreated: Int
    let powerHorse: Int
    let placePassengers: Int
    let maxVolumeFuelTank: Int
    let volumeTrunk: Int
    let motorType: String

    var nowVolumeFuelTank: Int
    var stateMotor: StateMotor
    var stateWindows: StateWindows
    var usedVolumeTrunk: Int

    static var count = 0

    init(brand: String, model: String, type: String, yearCreated: Int,
         powerHorse: Int, placePassengers: Int, maxVolumeFuelTank: Int,
         volumeTrunk: Int, motorType: String, nowVolumeFuelTank: Int,
         stateMotor: StateMotor, stateWindows: StateWindows,
         usedVolumeTrunk: Int) {
        self.brand = brand
        self.model = model
        self.type = type
        self.yearCreated = yearCreated
        self.powerHorse = powerHorse
        self.placePassengers = placePassengers
        self.maxVolumeFuelTank = maxVolumeFuelTank
        self.volumeTrunk = volumeTrunk
        self.motorType = motorType

        self.nowVolumeFuelTank = nowVolumeFuelTank
        self.stateMotor = stateMotor
        self.stateWindows = stateWindows
        self.usedVolumeTrunk = usedVolumeTrunk

        Car.count += 1
    }

    deinit {
        Car.count -= 1
    }

    static func countInfo() {
        print("Всего создано \(self.count) автомобилей")
    }

    func loadingTrunk(action: ActionWithTrunk, volume: Int) { }
    func loadingFuel (typeFuel: Fuel)
    func startMotor() {}
    func stopMotor() {}

}
//MARK: - Class TrunkCar
final class TrunkCar: Car {
    let trailer: String
    let volumeCargoSection: Int

    init(brand: String, model: String, type: String, yearCreated: Int,
         powerHorse: Int, placePassengers: Int, maxVolumeFuelTank: Int,
         volumeTrunk: Int, motorType: String, nowVolumeFuelTank: Int,
         stateMotor: StateMotor, stateWindows: StateWindows,
         usedVolumeTrunk: Int, trailer: String,
         volumeCargoSection: Int ) {

        self.trailer = trailer
        self.volumeCargoSection = volumeCargoSection

        super.init(brand: brand, model: model, type: type,
                   yearCreated: yearCreated,
                   powerHorse: powerHorse, placePassengers: placePassengers,
                   maxVolumeFuelTank: maxVolumeFuelTank,
                   volumeTrunk: volumeTrunk, motorType: motorType,
                   nowVolumeFuelTank: nowVolumeFuelTank,
                   stateMotor: stateMotor, stateWindows: stateWindows,
                   usedVolumeTrunk: usedVolumeTrunk)
    }

    override func loadingTrunk(action: ActionWithTrunk, volume: Int) {
        print("В \(brand) \(model) отсутствует багажник (Это TrunkCar)")
    }
}

//MARK: - Class SportCar
final class SportCar: Car {
    let raceType: String

    init(brand: String, model: String, type: String, yearCreated: Int,
         powerHorse: Int, placePassengers: Int, maxVolumeFuelTank: Int,
         volumeTrunk: Int, motorType: String, nowVolumeFuelTank: Int,
         stateMotor: StateMotor, stateWindows: StateWindows,
         usedVolumeTrunk: Int, raceType: String) {

        self.raceType = raceType

        super.init(brand: brand, model: model, type: type,
                   yearCreated: yearCreated,
                   powerHorse: powerHorse, placePassengers: placePassengers,
                   maxVolumeFuelTank: maxVolumeFuelTank,
                   volumeTrunk: volumeTrunk, motorType: motorType,
                   nowVolumeFuelTank: nowVolumeFuelTank,
                   stateMotor: stateMotor, stateWindows: stateWindows,
                   usedVolumeTrunk: usedVolumeTrunk)
    }

    override func loadingTrunk(action: ActionWithTrunk, volume: Int) {
        switch action {
        case .load:
            if super.usedVolumeTrunk <= super.maxVolumeFuelTank {
                print("\(brand) " + "\(model) - " + "baggage added from ",  usedVolumeTrunk, " -> to ", usedVolumeTrunk + volume)
                usedVolumeTrunk += volume
            } else {
                print("Don't added baggage " + "\(brand) " + "\(model) - " + "it's FULL")
            }
        case .unload:
            if usedVolumeTrunk - volume > 0 {
                Swift.print("\(brand) " + "\(model) - " + "baggage upload",  usedVolumeTrunk, " -> to ", usedVolumeTrunk -= volume)
                usedVolumeTrunk -= volume
            } else {
                print("don't upload baggage" + "\(brand) " + "\(model) - " + "so match")
            }
        }
    }

}

var ferrari: SportCar = SportCar.init(brand: "Ferrari", model: "akroX", type: "SportCar", yearCreated: 2021, powerHorse: 480, placePassengers: 1, maxVolumeFuelTank: 55, volumeTrunk: 30, motorType: "QWER", nowVolumeFuelTank: 35, stateMotor: StateMotor.stoped, stateWindows: <#T##StateWindows#>, usedVolumeTrunk: <#T##Int#>, raceType: <#T##String#>)



