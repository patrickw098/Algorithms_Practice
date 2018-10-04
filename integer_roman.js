// var intToRoman = function (num) {
//     let hash = {
//         1: "I",
//         4: "IV",
//         5: "V",
//         9: "IX",
//         10: "X",
//         40: "XL",
//         50: "L",
//         90: "XC",
//         100: "C",
//         400: "CD",
//         500: "D",
//         900: "CM",
//         1000: "M",
//     };

//     let res = "";
//     let string = num.toString();

//     for ( i = 0; i < string.length; i++ ) {
//         let el = string[i];
//         let multiplier = string.length - i - 1;
//         let j = 0;

//         while ( j < multiplier ) {
//             el += "0";
//             console.log("this",el);
//             j++;
//         }

//         if ( hash[el] ) {
//             res += hash[el];
//         } else {
//             let num = el[0]
//             el = el.slice(1);
//             console.log(el);
//             console.log("wat", num);

//             if ( num - 5 > 0 ) {
//                 res += hash[5 + el]
//                 num = num - 5;
//             }

//             el = "1" + el;
//             console.log("no", el);
//             k = 0;

//             while ( k < num ) {
//                 let char = hash[el]
//                 res += char
//                 k++;
//             }
//         }
//     }

//     return res;
// };

// console.log(intToRoman(58));

var candi = [
    [1000, 'M'],
    [900, 'CM'],
    [500, 'D'],
    [400, 'CD'],
    [100, 'C'],
    [90, 'XC'],
    [50, 'L'],
    [40, 'XL'],
    [10, 'X'],
    [9, 'IX'],
    [5, 'V'],
    [4, 'IV'],
    [1, 'I'],
];
var intToRoman = function (num) { // 11m
    var res = '';
    while (num > 0) {
        var i = 0;
        for (; candi[i][0] > num; i += 1);
        res += candi[i][1];
        num -= candi[i][0];
    }

    return res;
};

console.log(intToRoman(58));