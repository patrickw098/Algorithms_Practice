var spiralOrder = function (matrix) {
    if ( matrix.length === 0 ) {
        return [];
    }
    let firstHalf = matrix[0];
    let secondHalf = [];
    let nextMatrix = [];

    for ( let i = 1; i < matrix.length; i++ ) {
        if ( i === matrix.length - 1 ) {
            for ( let j = 0; j < matrix[i].length; j++ ) {
                secondHalf.unshift(matrix[i][j])
            }
        } else {
            firstHalf.push(matrix[i][matrix[i].length - 1])
            if (matrix[i].length > 1) {
                secondHalf.unshift(matrix[i][0]);

                if (matrix[i].length > 2) {
                    nextMatrix.push(matrix[i].slice(1, matrix[i].length - 1))
                }
            }
        }
    }

    let iteration = firstHalf.concat(secondHalf);

    return iteration.concat(spiralOrder(nextMatrix));
};

let input = 
    [[1, 11], [2, 12], [3, 13], [4, 14], [5, 15], [6, 16], [7, 17], [8, 18], [9, 19], [10, 20]]

console.log(spiralOrder(input));