class Practice1 {
  num calculateAge(int birthYear) {
    int currentYear = 2030;
    return currentYear - birthYear;
  }
}

class Practice2 {
  num calculateAgeFromDOB(String birthday) {
    int currentYear = 2030;
    List date = birthday.split('-');
    int year = int.parse(date[0]);
    int age = currentYear - year;
    return age;
  }
}

class Practice3 {
  bool isEven(num even) {
    return (even % 2 == 0) ? true : false;
  }
}

class Practice4 {
  bool isYearLeap(int year) {
    return (year % 4 == 0) && ((year % 100 != 0) || (year % 400 == 0));
  }
}

class Practice5 {
  getLastElement(List theList) {
    return theList.last;
  }
}

class Practice6 {
  bool hasEqualChar(String list1, String list2) {
    return list1.length == list2.length;
  }
}

class Practice7 {
  List getOddList(int number) {
    List numbers = List.generate(number, (number) => number);
    return numbers.where((number) => number.isOdd).toList(growable: true);
  }
}

class Practice8 {
  num factorial(int number) {
    int accumulate = 1;
    for (var i = 1; i <= number; i++) {
      accumulate *= i;
    }
    return accumulate;
  }
}

class Practice9 {
  num getCount({required String input, required String char}) {
    int acount = 0;
    for (int i = 0; i < input.length; i++) {
      if (input[i] == char) {
        acount++;
      }
    }
    return acount;
  }
}

class Practice10 {
  String reverseString(String input) {
    List splitted = input.split('');
    List reversedList = List.from(splitted);
    for (var i = 0; i < splitted.length; i++) {
      reversedList[i] = splitted[splitted.length - 1 - i];
    }
    return reversedList.join('');
  }
}

class Practice11 {
  num findALargestNumber(List numbers) {
    numbers.sort((b, a) => a.compareTo(b));
    return numbers.first;
  }
}

class Practice12 {
  String findALongWord(List words) {
    String largeWord = '';
    for (int i = 0; i < words.length; i++) {
      if (words[i].length > largeWord.length) {
        largeWord = words[i];
      }
    }
    return largeWord;
  }
}

class Practice13 {
  Map getCharCount(String word) {
    List splitted = word.split('');
    Map count = Map();
    splitted.forEach((element) => count[element] =
        !count.containsKey(element) ? (1) : (count[element] + 1));
    return count;
  }
}

class Practice14 {
  List filterData({required List<int> input, required int value}) {
    input.removeWhere((item) => item >= value);
    return input;
  }
}

class Practice15 {
  getCharPosition(String word, String char) {
    int indexChar = word.indexOf(char);
    return (indexChar >= 0) ? indexChar + 1 : null;
  }
}

class Practice16 {
  getCharPosition(String word, String char) {
    int positionI = 0;
    for (var i = 0; i < word.length; i++) {
      if (word[i] == char) {
        positionI = i + 1;
        break;
      }
    }
    return (positionI > 0) ? positionI : null;
  }
}

void main() {
  var prac1 = Practice1().calculateAge(1993);
  print(prac1);
}
