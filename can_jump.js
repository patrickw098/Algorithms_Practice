var canJump = function (nums) { 
    let i = 0;
    let max = nums[0];

    if ( nums.length === 1 ) return true;

    while ( max < nums.length - 1) {

        let num = nums[i];
        let tempMax = i + num;

        if ( max < tempMax ) {
            max = tempMax;
        }

        if (i === max) {
            return false;
        }

        i++;
    }

    return true;
}

let input = [1,2,3];

console.log(canJump(input));