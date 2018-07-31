var myAtoi = function (str) {
    let nums = {
        "0": 0,
        "1": 1,
        "2": 2,
        "3": 3,
        "4": 4,
        "5": 5,
        "6": 6,
        "7": 7,
        "8": 8,
        "9": 9
    }

    let ans = [];
    let flag = true;
    let negative = false;

    for (let i = 0; i < str.length; i++) {
        let num = str[i]

        if (num === " " && flag) {
            continue;
        } else if (flag && num === "-") {
            flag = false;
            negative = true;
        } else if (nums[num] !== undefined) {
            flag = false;
            ans.unshift(nums[num])
        } else {
            break;
        }
    }

    let ansNum = 0

    ans.forEach((num, index) => {
        ansNum += num * Math.pow(10, index)
    })

    if (ansNum > Math.pow(2, 31)) {
        ansNum = Math.pow(2, 31) - 1
    } else if (ansNum < -1 * Math.pow(2, 31)) {
        ansNum = -1 * Math.pow(2, 31)
    }

    return negative ? 0 - ansNum : ansNum;
};


console.log(myAtoi("     -42"));