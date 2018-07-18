function magicNum(num, arr, original) {
    if ( arr.length === 1 ) {
        return arr;
    }

    let returnArr = [];
    let currNum = arr[0];
    let prev = magicNum(num, arr.slice(1), original) 

    prev.forEach((el) => {
        let add = currNum + el 
        returnArr.push(add)
        let sub = currNum - el 
        returnArr.push(sub)
    })

    if ( arr.length === original.length ) {
        let boolean = false;

        returnArr.forEach((el) => {
            if ( el === num ) {          
                boolean = true;
            }
        })

        return boolean;
    }

    return returnArr;
}

console.log(magicNum(9, [7,2,3], [1,2,3]));