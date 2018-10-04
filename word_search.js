var exist = function(board, word) {
    let hash = {};
    let visited = {};
    let last;
    const adj = [[1, 0], [-1, 0], [0, -1], [0, 1]];

    for ( let i = 0; i < word.length; i++ ) {
        for ( let j = 0; j < board.length; j++ ) {
            for ( let k = 0; k < board[j].length; k++ ) {
                let el = board[j][k];
                let visited_dup = visited;

                if ( el === word[i] && i === 0 ) {
                    let str = [j,k].toString();
                    hash[str] = el;
                    visited[str] = true;
                } else if ( el === word[i] ) {
                    console.log(el, word[i]);
                    adj.forEach( idx => {
                        let str = [j + idx[0], k + idx[1]].toString();
                        console.log(visited[str]);

                        if ( hash[str] && visited[str] === undefined) {
                            visited[str] = true;
                            hash[[j,k].toString()] = hash[str] + el;
                            last = hash[str] + el
                        } else {
                            visited = visited_dup;
                        }
                    })
                }

                if ( last === word ) {
                    break;
                }

            }
        }

        console.log(hash);
        console.log(last);
    }

    return last === word;
}

// const board =
//     [
//         ['A', 'B', 'C', 'E'],
//         ['S', 'F', 'C', 'S'],
//         ['A', 'D', 'E', 'E']
//     ]

const board = [["A", "A"]]

console.log(exist(board, "AA"));