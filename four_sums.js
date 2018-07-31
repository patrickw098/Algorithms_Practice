function fourSums(arr, target) {
    const one = {};
    const two = {};
    const three = {};
    const uniqueTwo = {};
    const uniqueThree = {};
    const solutions = []

    for ( let i = 0; i < arr.length; i++ ) {
        const el = arr[i];
        const diff = target - el;

        if ( three[el] !== undefined ) {
            console.log("i'm in here", three[el], el)

            three[el].forEach( arr => {
                solutions.push(arr.concat([el]));
            })
        } 

            let secondKeys = Object.keys(two)

            secondKeys.forEach(num => {

                num = parseInt(num);
                nextNum = num - el;
                let temp = new Set();

                two[num].forEach(arr => {
                    temp.add(arr.concat([el]));
                })

                if ( three[nextNum] === undefined ) {
                    uniqueThree[el] = true;
                    three[nextNum] = temp;
                } else {
                    three[nextNum] = three[nextNum].concat(temp);
                }    
            })

            let firstKeys = Object.keys(one);

            firstKeys.forEach(num => {

                num = parseInt(num);
                nextNum = num - el;
                let temp = new Set();

                one[num].forEach(arr => {
                    temp.add(arr.concat([el]));
                })

                if (two[nextNum] === undefined) {
                    uniqueTwo[el] = true;
                    two[nextNum] = temp;
                } else {
                    two[nextNum] = two[nextNum].concat(temp);
                }   
            })

            if ( one[diff] === undefined ) {
                one[diff] = [[el]]
            }    

            console.log(uniqueThree, uniqueTwo)
    }

    // let unique = {};

    // solutions.forEach( solution => {
    //     if ( unique[solution] === undefined ) {
    //         unique[solution] = solution;
    //     }
    // })

    // return Object.values(unique);

    return solutions;
}

let nums = [-3, -2, -1, 0, 0, 1, 2, 3];

console.log(fourSums(nums, 0));