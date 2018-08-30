var mySqrt = function (x) {
    let original = x;
    let half = x / 2;

    while ( original / half < half ) {
        half /= 2;
    }

    half = Math.floor(half);

    while ( original / half >= half ) {
        if ( original / half === half ) {
            half += 1;
            break;
        }

        half++;
    }

    return x === 0 ? 0 : half - 1;
};

console.log(mySqrt(7))
console.log(mySqrt(8))
console.log(mySqrt(9))
console.log(mySqrt(10))
console.log(mySqrt(11))
console.log(mySqrt(12))