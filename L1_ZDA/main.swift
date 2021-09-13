//
//  main.swift
//  L1_Заика Дмитрий
//
//  Created by Заика Дмитрий on 09.09.2021.
//  Урок 1. Домашнее задание 

import Foundation

// MARK: - ЗАДАНИЕ 1
print ("Решение задания №1: ==================================================")
// Задание №1:  Решить квадратное уравнение.
// Формат квадратного уравления ax^2 + bx + c = 0
// Задаем коэффициенты квадратного уравлнения КОНСТАНТАМИ
let a: Float32 = 2.0
let b: Float32 = 5
let c: Float32 = 1

print("Общий вид квадратного уравнения: ", a, "x^2 + ", b, "x + ", c, "= 0")
      
//Находим ДИСКРИМИНАНТ
let discriminant: Float32 = powf(b, 2) - 4 * a * c

print("Дискриминант =", discriminant)

// Определяем наличие корней уравнения
if discriminant < 0 {
    print("Квадратное уравнение - не имеет корней")
} else if discriminant == 0 {
    print("Квадратное уравнение - имеет 1 корень")

    let x1: Float32 = (-b + sqrtf(discriminant)) / (2 * a)
    
    print("x1 =", x1)
} else { // Квадратное уравнение с заданными коэффициентами имеет 2 корня
    print("Квадратное уравнение - имеет 2 корня")
    
    let x1: Float32 = (-b + sqrtf(discriminant)) / (2 * a)
    let x2: Float32 = (-b - sqrtf(discriminant)) / (2 * a)
    
    print("x1 =", x1)
    print("x2 =", x2)
}

//MARK: ЗАДАНИЕ 2
print("\nРешение задания №2: ==================================================")
// Задание №2: Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.
// Катеты прямоугольнго треугольника обозначим - katetА и katetВ
let katetA: Float32 = 7.12
let katetB: Float32 = 4.6
print("Заданы катеты прямоугольного треугольника: a =", katetA, "b =", katetB)

// Вычисление площади прямоугольного треугольника (s)
let s: Float32 = (katetA * katetB) / 2
print("Площадь треугольника s =", s)

// Гипотенузу прямоугольного треугольника обозначим - С
let gipC: Float32 = sqrtf(powf(katetA, 2) + powf(katetB, 2))
print("Гипотенуза c =", gipC)

// Вычисление периметра прямоугольного треугольника (P)
let perimetr: Float32 = katetA + katetB + gipC
print("Периметр треугольника p =", perimetr)

//MARK: - ЗАДНИЕ 3
print("\nРешение задания №3: ===================================================")
// Задание №3: Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.

var sumUser: Int64 = 0
var persentInYear: Double = 0.0
var sumDeposit: Double = 0.0
var stringSum: String? = ""
var stringPers: String? = ""
let years: Int16 = 5

print ("Введите сумму вклада в руб. (целое число): ")
stringSum = readLine()
print ("Введите годовой процент по вкладу (разделитель '.'): ")
stringPers = readLine()

if stringSum != nil, stringPers != nil {
    let strSum = stringSum!
    let strPers = stringPers!
    
    if let sumInt = Int64(strSum) , let persDoub = Double(strPers) {
        sumUser = sumInt
        sumDeposit = Double(sumUser)
        persentInYear = persDoub / 100
    
        for _ in 1...years {
            let oneYearMoney = (sumDeposit * persentInYear)
            sumDeposit += oneYearMoney
        }
        
        print("При вкладе ", sumUser, " руб. сроком на 5 лет ваши накопления увеличатся до суммы: ", Int(sumDeposit), "руб.")
    } else {
        print("Введены некоректные числа, запустите программу заново '\(strSum)', '\(strPers)'")
    }
} else {
  print("Вы не ввели данные, запустите программу заново.")
}

