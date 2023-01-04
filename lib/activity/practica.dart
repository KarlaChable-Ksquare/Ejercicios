import 'dart:math';

class Exce {
  elevarCuadrado(List<int> numeros) {
    List cuadrados = [];
    for (var numero in numeros) {
      cuadrados.add(numero * numero);
    }
    return cuadrados;
  }

// void main() {
//   print(reverseWords('Hola Mundo'));
// }

  String reverseWords(String s) {
    return s.split('').reversed.join('');
  }

// void main() {
//   print(factorial(5));
// }

  int factorial(int n) {
    int acc = 1;
    for (var i = 1; i <= n; i++) {
      acc *= i;
    }
    return acc;
  }

// void main() {
//   print(toUpperCase(['apple', 'banana', 'pear']));
// }

  List<String> toUpperCase(List<String> lista) {
    List<String> uppers = [];
    for (var palabra in lista) {
      uppers.add(palabra.toUpperCase());
    }
    return uppers;
  }

/*
2.-Escriba una función que tome un mapa de claves y valores 
y elimine todas las claves cuyos valores son nulos.
 * */
  void main() {
    Map<dynamic, dynamic> products = {
      "product1": {
        "name": "Product 1",
        "price": 10.99,
        "description": "This is the first product"
      },
      "product2": {
        "name": "Product 2",
        "price": null,
        "description": "This is the second product"
      },
      "product3": {"name": "Product 3", "price": 15.99, "description": null}
    };
    //print(products);
    print(removeNullValues(products));
  }

  Map<dynamic, dynamic> removeNullValues(Map<dynamic, dynamic> map) {
    Map<dynamic, dynamic> newMap = {};
    map.forEach((key, value) {
      if (value is Map) {
        newMap[key] = removeNullValues(value);
      } else if (value != null) {
        newMap[key] = value;
      }
    });
    return newMap;
  }

/*
Ejercicio 1
Given an integer array nums of length n, you want to create an array ans of length 2n where ans[i] == nums[i] and ans[i + n] == nums[i] for 0 <= i < n (0-indexed).
Specifically, ans is the concatenation of two nums arrays.
Return the array ans.
*/

  List getConcatenation(List lista) {
    List newList = [...lista, ...lista];
    return newList;
  }

/*
Ejercicio 2
Given a zero-based permutation nums (0-indexed), build an array ans of the same length where ans[i] = nums[nums[i]] for each 0 <= i < nums.length and return it.

A zero-based permutation nums is an array of distinct integers from 0 to nums.length - 1 (inclusive).
*/

  List buildArray(List array) {
    List arraySorted = List.from(array);
    for (var i = 0; i < array.length; i++) {
      arraySorted[i] = array[array[i]];
    }
    return arraySorted;
  }

/*
Ejercicico 3
A decimal number is called deci-binary if each of its digits is either 0 or 1 without any leading zeros. For example, 101 and 1100 are deci-binary, while 112 and 3001 are not.

Given a string n that represents a positive decimal integer, return the minimum number of positive deci-binary numbers needed so that they sum up to n.
*/

  int minPartitions(String n) {
    //return n.split('').map((v) => int.parse(v)).toList().reduce(max);

    List numList = n.split('').toList();
    numList.sort();
    return int.parse(numList.last);
  }

/*
Ejercicio 4
Given a valid (IPv4) IP address, return a defanged version of that IP address.
A defanged IP address replaces every period "." with "[.]".
*/

  String defangIPaddr(String address) {
    String addressIP = address.replaceAll('.', '[.]');
    return addressIP;
  }

/*
Ejercicio 5
Given two integers num1 and num2, return the sum of the two integers.
*/
  int sum(int num1, int num2) {
    int suma = num1 + num2;
    return suma;
  }

/*
Ejercicio 6
Given an array nums. We define a running sum of an array as runningSum[i] = sum(nums[0]…nums[i]).
Return the running sum of nums.
*/
  List<int> runningSum(List<int> nums) {
    for (var i = 1; i < nums.length; i++) {
      nums[i] += nums[i - 1];
      //suma inversa
    }
    return nums;
  }

/*
Ejercicio 7
There is a programming language with only four operations and one variable X:
++X and X++ increments the value of the variable X by 1.
--X and X-- decrements the value of the variable X by 1.
Initially, the value of X is 0.

Given an array of strings operations containing a list of operations, return the final value of X after performing all the operations.
*/
  int finalValueAfterOperations(List<String> operations) {
    int acc = 0;
    operations.forEach((elementX) {
      elementX.contains('++') ? (acc += 1) : (acc -= 1);
    });
    return acc;
  }

/*
Ejercicio 8
Given the array nums consisting of 2n elements in the form [x1,x2,...,xn,y1,y2,...,yn].
Return the array in the form [x1,y1,x2,y2,...,xn,yn].
*/
  List shuffle(List nums, int n) {
    List arreglo = [];
    for (var i = 0; i < n; i++) {
      arreglo.add((nums.sublist(0, n)[i]));
      arreglo.add((nums.sublist(n, nums.length)[i]));
    }
    return arreglo;
  }

  //forEach().- Runs a function on each element in the list
  List frutillas(List frutas) {
    frutas.forEach((fruta) {
      //print(fruta);
    });
    return frutas;
  }

  // map().- Produces a new list after transforming each element in a given list
  List frutis(List frutas) {
    frutas.map((fruta) {
      fruta = 'I love $fruta';
    }).toList();
    return frutas;
  }
}

//https://codeburst.io/top-10-array-utility-methods-you-should-know-dart-feb2648ee3a2

void main() async {
  var each =
      Exce().frutillas(['naranja', 'sandia', 'melon', 'manzana', 'platano']);
  //print(each);

  var map = Exce().frutis(['naranja', 'sandia', 'melon', 'manzana', 'platano']);
  print(map);

  //Ejercicio 1
  //print(getConcatenation([1, 2, 3]));
  //print(buildArray([0, 2, 1, 5, 3, 4]));
  //print(minPartitions('32'));
  //print(defangIPaddr("1.1.1.1"));
  //print(sum(8, 12));
  //print(runningSum([1, 2, 3, 4]));
  //print(finalValueAfterOperations(["--X", "X++", "X++"]));
  //print(shuffle([2, 5, 1, 3, 4, 7], 3));
}
