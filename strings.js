//given a string of random numbers dashes and spaces e.g. "343- 55 999 - 0 "
//format it to return as "343-559-990"
//but it should not end with a single digit at the end
//so "34355999" should return "343-559-99"
//"3435599" should return "343-55-99"

function formatStrings(str) {
    let reg = new RegExp(str);
    str = str.replace(/-|\s/g, "");
    let ans = [];
    let uneven = false;

    if ( str.length % 3 === 1) {
        uneven = true;
    }

    for ( let i = 0; i < str.length; i += 3 ) {
        if ( uneven && i + 4 === str.length ) {
            ans.push(str.slice(i, i + 2));
            if ( i + 2 < str.length ) {
                ans.push(str.slice(i + 2));
            }

            break;
        } else {
            ans.push(str.slice(i, i + 3));
        }
    }

    return ans.join("-")
} 

console.log(formatStrings("6257"));