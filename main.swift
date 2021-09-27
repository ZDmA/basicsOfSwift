//
//  main.swift
//  L3_ZDA
//
//  Created by Дмитрий Заика on 19.09.2021.
//

import Foundation
//MARK: - ЗАДАНИЕ 1
print("ЗАДАНИЕ 1")
//1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.

enum StateMotor {
    case stoped
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

struct sportCar {
    let brand: String
    let model: String
    let type: String
    let yearCreated: Int
    let countWheels: Int
    let maxVolumefuelTank: Int
    let volumeTrunk: Int
    let motorType: String

    var nowVolumeFuelTank: Int
    var stateMotor: StateMotor
    var stateWindows: StateWindows
    var usedVolumeTrunk: Int
    var yearLastRepair: Int

    mutating func manageMotor (action: ActionWithMotor) -> Bool {
        if nowVolumeFuelTank > 5 {
            switch action {
            case .start:
                self.stateMotor = StateMotor.worked
                Swift.print("\(brand) " + "\(model) - " + "Motor start")
                break
            case .stop:
                self.stateMotor = StateMotor.stoped
                Swift.print("\(brand) " + "\(model) - " + "Motor stop")
                break
            }
            return true
        } else {
            print("Don't can started motor " + "\(brand) " + "\(model) - " + "please give more fuel")
            return false
        }
    }

    mutating func manageWindows (action: ActionWithWindows) -> Bool {
        if stateMotor ==  StateMotor.worked {
            switch action {
            case .open:
                self.stateWindows = StateWindows.opened
                Swift.print("\(brand) " + "\(model) - " + "Windows are opened")
                break
            case .close:
                self.stateWindows = StateWindows.closed
                Swift.print("\(brand) " + "\(model) - " + "Windows are closed")
                break
            }
            return true
        } else {
            print("Don't can open/close windows " + "\(brand) " + "\(model) - " + "before start motor")
            return false
        }
    }

    mutating func loadingTrunk (action: ActionWithTrunk, volume: Int) -> Bool {
            switch action {
            case .load:
                if usedVolumeTrunk <= self.maxVolumefuelTank {
                    Swift.print("\(brand) " + "\(model) - " + "baggage added from ",  usedVolumeTrunk, " -> to ", usedVolumeTrunk + volume)
                    usedVolumeTrunk += volume
                    return true
                } else {
                    Swift.print("Don't added baggage " + "\(brand) " + "\(model) - " + "it's FULL")
                    return false
                }
            case .unload:
                if usedVolumeTrunk - volume > 0 {
                    Swift.print("\(brand) " + "\(model) - " + "baggage upload",  usedVolumeTrunk, " -> to ", usedVolumeTrunk -= volume)
                    usedVolumeTrunk -= volume
                    return true
                } else {
                    print("don't upload baggage" + "\(brand) " + "\(model) - " + "so match")
                    return false
                }
            }
    }
}

var ferrariS30 = sportCar.init(brand: "ferrari",
                               model: "S30",
                               type: "sportCar",
                               yearCreated: 2021,
                               countWheels: 4,
                               maxVolumefuelTank: 55,
                               volumeTrunk: 200,
                               motorType: "AXC2VC",
                               nowVolumeFuelTank: 20,
                               stateMotor: StateMotor.stoped,
                               stateWindows: StateWindows.closed,
                               usedVolumeTrunk: 100,
                               yearLastRepair: 2019)

var renoRC20 = sportCar.init(brand: "reno",
                             model: "RC20",
                             type: "sportCar",
                             yearCreated: 2020,
                             countWheels: 4,
                             maxVolumefuelTank: 42,
                             volumeTrunk: 150,
                             motorType: "AR1DC4",
                             nowVolumeFuelTank: 40,
                             stateMotor: StateMotor.stoped,
                             stateWindows: StateWindows.closed,
                             usedVolumeTrunk: 22,
                             yearLastRepair: 2020)

print(ferrariS30)
print(renoRC20)

if ferrariS30.manageMotor(action: ActionWithMotor.start) {
   print("Motor good started! \n")
} else {
    print("Motor DON'T started!\n")
}

if renoRC20.loadingTrunk(action:  ActionWithTrunk.load, volume: 50) {
    print("Load good ! \n")

} else {
     print("Bad result load \n")
}

ferrariS30.manageWindows(action: ActionWithWindows.open)
renoRC20.manageWindows(action: ActionWithWindows.open)

ferrariS30.loadingTrunk(action: ActionWithTrunk.load, volume: 200)
renoRC20.manageMotor(action: ActionWithMotor.start)
renoRC20.manageWindows(action: ActionWithWindows.open)

