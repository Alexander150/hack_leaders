# user = User.create(username: "teacher", password: "password", user_type: "teacher")
# user = User.create(username: "student", password: "password", user_type: "student")
# task1 = Task.create(title: "Задача №1", description: "Написать функцию сложения 2х чисел")
# task2 = Task.create(title: "Задача №2", description: "Написать функцию умножения 2х чисел")
# task3 = Task.create(title: "Задача №3", legend: "Дан массив чисел.", description: "Написать функцию, которая создаст массив с четными числами и массив с нечетными числами")
# test1 = Test.create!(task_id: 1, inputs: "1, 2", outputs: "3")
# test2 = Test.create!(task_id: 1, inputs: "5, 10", outputs: "15")
# test3 = Test.create!(task_id: 1, inputs: "100, 351", outputs: "451")
# test4 = Test.create!(task_id: 1, inputs: "129, 351", outputs: "480")
# test5 = Test.create!(task_id: 1, inputs: "1, -1", outputs: "0")
# test6 = Test.create!(task_id: 1, inputs: "10, -12", outputs: "-2")
# test7 = Test.create!(task_id: 1, inputs: "110, 12", outputs: "122")
# test8 = Test.create!(task_id: 1, inputs: "11, 1256", outputs: "1267")
# test9 = Test.create!(task_id: 1, inputs: "157, 431", outputs: "588")
# test10 = Test.create!(task_id: 1, inputs: "131, 139", outputs: "270")
# test1 = Test.create!(task_id: 2, inputs: "1, 2", outputs: "2")
# test2 = Test.create!(task_id: 2, inputs: "5, 10", outputs: "50")
# test3 = Test.create!(task_id: 2, inputs: "100, 351", outputs: "35100")
# test4 = Test.create!(task_id: 2, inputs: "129, 351", outputs: "45279")
# test5 = Test.create!(task_id: 2, inputs: "1, -1", outputs: "-1")
# test6 = Test.create!(task_id: 2, inputs: "10, -12", outputs: "-120")
# test7 = Test.create!(task_id: 2, inputs: "110, 12", outputs: "1320")
# test8 = Test.create!(task_id: 2, inputs: "11, 1256", outputs: "13816")
# test9 = Test.create!(task_id: 2, inputs: "157, 431", outputs: "67667")
# test10 = Test.create!(task_id: 2, inputs: "131, 139", outputs: "18209")
lang1 = Language.create!(name: "Python")
lang2 = Language.create!(name: "Ruby")
lang3 = Language.create!(name: "C++")
lang4 = Language.create!(name: "Pascal")
lang5 = Language.create!(name: "Java")
lang6 = Language.create!(name: "Java Script")