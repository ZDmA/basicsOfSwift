//
//  main.swift
//  2l_ZDA
//
//  Created by Дмитрий Заика on 15.09.2021.
//

import Foundation

print("Домашняя работа №2")


//MARK: - ЗАДАНИЕ 1
print("\n ЗАДАНИЕ 1")
//Написать функцию, которая определяет, четное число или нет.
func isEven (the name: Int) -> Bool {
    return name >= 0 ? true : false
}

let temperature = [10, 45, -12, -1, 0, 2, 3, 0, -90]

for current in 0...temperature.count - 1 {
    print("\(current + 1) ", isEven(the: temperature[current]))

}

//MARK: - ЗАДАНИЕ 2
print("\n ЗАДАНИЕ 2")
//Написать функцию, которая определяет, делится ли число без остатка на 3.
func isMultipleOfThree (the digit: Int) -> Bool {
    return digit % 3 == 0 ? true : false
}

for current in 0...temperature.count - 1 {
    if isMultipleOfThree(the: temperature[current]) {
        print("\(current + 1)) \(temperature[current]) - делится без остатка на 3")
    } else {
        print("\(current + 1)) \(temperature[current]) - не делится без остатка на 3")
    }

}

//MARK: - ЗАДАНИЕ 3
print("\n ЗАДАНИЕ 3")
// Создать возрастающий массив из 100 чисел.
var ageEmployees = [21, 22, 23, 24]

for i in ageEmployees.count...99 {
    ageEmployees.append(ageEmployees[i - 1] + 1)
}
print(ageEmployees)

//MARK: - ЗАДАНИЕ 4
print("\n ЗАДАНИЕ 4")
// Удалить из этого массива все четные числа и все числа, которые не делятся на 3
var index = 0

while index < ageEmployees.count - 1 {
    if ageEmployees[index] % 2 == 0 || !isMultipleOfThree(the: ageEmployees[index]) {
        ageEmployees.remove(at: index)
    } else {
       index += 1;
    }
}
print(ageEmployees)

//MARK: - ЗАДАНИЕ 5
print("\n ЗАДАНИЕ 5")
//Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов

var digits = [1, 1, 2]
func addDigitFibonachi(array: inout [Int]) {
    let index = array.count
    if index >= 2 {
        array.append(array[index - 2] + array[index - 1])
    } else if index > 0 {
        array.append(array[index])
    } else {
        array.append(1)
    }
}

for _ in 1...50 {
    addDigitFibonachi(array: &digits)
}
print(digits)

//MARK: - ЗАДАНИЕ 6
print("\n ЗАДАНИЕ 6")
// Заполнить массив из 100 элементов различными простыми числами (делится только на себя и на единицу).

var tempArray = [1, 2]

//заполняем массив числами
for i in (tempArray.count - 1)...99 {
    tempArray.append(tempArray[i] + 1)
}
print("Исходный массив чисел", tempArray)

//исключаем не простые числа
var startI = 2
var endI = tempArray.count
var ind = startI
var isNeedIncreaseIndex = true

while ind < endI {
    for j in startI...tempArray[ind] - 1 {
        if tempArray[ind] % j == 0 {
            tempArray.remove(at: ind)
            endI = tempArray.count
            isNeedIncreaseIndex = false
            break
        }
    }
    if isNeedIncreaseIndex {
        ind += 1
    } else {
        isNeedIncreaseIndex = true
    }
}
print("Массив с простыми числами", tempArray)
