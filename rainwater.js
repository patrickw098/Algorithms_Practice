function trapping_rainwater(arr) {
    if ( arr.length < 1) {
        return 0;
    }

    let max1 = arr[0];
    let max1Idx = 0;
    let max2;
    let max2Idx;

    for ( let i = 1; i < arr.length; i++ ) {
        let el = arr[i];

        if ( el >= max1 ) {
            max2 = max1;
            max2Idx = max1Idx;
            max1 = el;
            max1Idx = i;
            console.log("i'm in here", max1, max1Idx, max2, max2Idx);
        } 
    }

    let newArr = arr.slice(max2Idx + 1, max1Idx)

    let fill = (max1 - max2) * arr.length;

    console.log(fill);

    return trapping_rainwater(newArr) + fill + trapping_rainwater(arr.slice(max1Idx + 1))
}

console.log(trapping_rainwater([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]))