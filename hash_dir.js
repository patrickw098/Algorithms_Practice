function hashdir(obj) {
    let arr = []

    for ( var key in obj ) {
        if ( obj[key] === true ) {
            arr.push(key)
        } else {
            let sub = hashdir(obj[key])
            sub.forEach ((file) => {
                arr.push(`${key}/${file}`)
            })
        }
    }

    return arr
}

let input = {
    "a": {
        "b": {
            "c": {
                "d": {
                    "e": true
                },
                "f": true
            }
        }
    }
}

let output = hashdir(input) 
console.log(output)