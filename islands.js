function islands(matrix) {
    let map = {};
    let adjacents = [[1,0],[-1,0],[0,1],[0,-1]];

    // constructs a map, dependencies are the values, the key is only inputted if the matrix[i][j] === 1, O(n * m) time.
    for ( let i = 0; i < matrix.length; i++ ) {
        for ( let j = 0; j < matrix[i].length; j++ ) {
            if ( matrix[i][j] === 1 && isEdge(i, j, matrix) ) {
                map[`${i},${j}`] = [];
            } else if ( matrix[i][j] === 1 ) {
                let adjOnes = [];

                // adds the dependencies, only adds the dependency if it's "1"
                adjacents.forEach( index => {
                    let [x,y] = index;
                    if ( matrix[i + x][j + y] === 1 ) {
                        adjOnes.push([i + x, j + y]);
                    }
                })

                // only adds the index if it has at least one dependency, otherwise it's just isolated and we don't care about it.
                if ( adjOnes.length > 0 ) {
                    map[`${i},${j}`] = adjOnes;
                }
            }
        }
    }

    // checks each of the "1" values added into the hash
    let keys = Object.keys(map);

    keys.forEach ((key) => {
        let index = key.split(",");
        let [x,y] = index;
        
        // sets it equal to the return value of the recursive search, which will return 1 if it finds an edge and 0 if it doesn't
        matrix[x][y] = isIsland(index, map);
    })

    return matrix;
}

function isEdge(i, j, matrix) {
    return i === 0 || j === 0 || i === matrix.length - 1|| j === matrix[i].length - 1
}

function isIsland(index, map, visited = []) {
    if ( map[index.toString()] === undefined ) {
        return 0;
    } else if ( map[index.toString()].length === 0 ) {
        return 1;
    } else if ( visited.indexOf(index.toString()) !== -1 ) {
        return 0;
    }

    let mapArr = map[index.toString()];
    visited.push(index.toString());

    let found = 0;

    mapArr.forEach (dependency => {
        dependency = dependency.toString();

        if ( isIsland(dependency, map, visited) === 1 ) {
            found = 1;
        } 
    })

    
    return found;
}

const testMat = [[1,1,0,0,0,1,1],
                [0,0,1,0,0,1,0],
                [1,0,1,0,0,0,1],
                [0,0,0,0,1,0,0],
                [1,1,1,1,1,1,1]]

console.log(islands(testMat));