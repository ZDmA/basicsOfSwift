//
//  main.swift
//  L1_Заика Дмитрий
//
//  Created by Заика Дмитрий on 09.09.2021.
//  Урок 1. Домашнее задание 

import Foundation


print ("Решение задания №1: ==================================================")
// Задание №1:  Решить квадратное уравнение.
// Формат квадратнго уравления ax^2 + bx + c = 0
// Задаем коэффициенты квадратного уравлнения КОНСТАНТАМИ
let a : Float32 = 2.0
let b : Float32 = 5
let c : Float32 = 1

print("Общий вид квадратного уравнения: ", a, "x^2 + ", b, "x + ", c, "= 0")
      
//Находим ДИСКРИМИНАНТ
let Discriminant:Float32 = powf(b, 2) - 4 * a * c

print("Дискриминант =", Discriminant)

// Определяем наличие корней уравнения
if Discriminant < 0
{
    print("Квадратное уравнение - не имеет корней")
}
// Квадратное уравнение с заданными коэффициентами имеет 1 корень
else if Discriminant == 0
{
    print ("Квадратное уравнение - имеет 1 корень")
    
    let x1 : Float32 = (-b + sqrtf(Discriminant)) / (2 * a)
    
    print("x1 =", x1)
}
// Discriminant > 0 - Квадратное уравнение с заданными коэффициентами имеет 2 корня
else
{
    print ("Квадратное уравнение - имеет 2 корня")
    
    let x1 : Float32 = (-b + sqrtf(Discriminant)) / (2 * a)
    let x2 : Float32 = (-b - sqrtf(Discriminant)) / (2 * a)
    
    print("x1 =", x1)
    print("x2 =", x2)
}

print ("\nРешение задания №2: ==================================================")
// Задание №2: Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.
// Катеты прямоугольнго треугольника обозначим - А и В
let A : Float32 = 7.12
let B : Float32 = 4.6

print("Заданы катеты прямоугольного треугольника: A =", A, "B =", B)

// Вычисление площади прямоугольного треугольника (S)
let S : Float32 = (A * B) / 2
print("Площадь треугольника S =", S)

// Гипотенузу прямоугольного треугольника обозначим - С
let C : Float32 = sqrtf(powf(A, 2) + powf(B, 2))
print("Гипотенуза С =", C)

// Вычисление периметра прямоугольного треугольника (P)
let P : Float32 = A + B + C
print("Периметр треугольника P =", P)

print("\nРешение задания №3: ===================================================")
// Задание №3: Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.

var sumUser : Int64 = 0
var persentInYear : Double = 0.0
var sumDeposit : Double = 0.0
var stringSum : String? = ""
var stringPers : String? = ""
let years : Int16 = 5

print ("Введите сумму вклада в руб. (целое число): ")
stringSum = readLine()
print ("Введите годовой процент по вкладу (разделитель '.'): ")
stringPers = readLine()

if stringSum != nil && stringPers != nil
{
    let strSum = stringSum!
    let strPers = stringPers!
    
    if let sumInt = Int64(strSum) , let persDoub = Double(strPers)
    {
        sumUser = sumInt
        sumDeposit = Double(sumUser)
        persentInYear = persDoub / 100
    
        for _ in 1...years
        {
            let OneYearMoney = (sumDeposit * persentInYear)
            sumDeposit += OneYearMoney
        }
        
        print("При вкладе ", sumUser, " руб. сроком на 5 лет ваши накопления увеличатся до суммы: ", Int(sumDeposit), "руб.")
    }
    else
    {
        print("Введены некоректные числа, запустите программу заново.")
    }
}
else
{
  print("Вы не ввели данные, запустите программу заново.")
}

