const moviesSchedules = [
    [10, 12],
    [0, 2],
    [3, 5],
    [2, 10],
    [7, 10],
    [13, 16],
    [20, 25],
    [15, 19]
];

// const optimalSchedule = jobs => {
    
//     jobs = jobs.sort((int1, int2) => {
//         return int1[1] - int2[1]
//     })

//     let optimal = {};
//     let solution = [];
//     let largest = jobs[jobs.length - 1][1];

//     for ( let i = jobs.length - 1; i >= 0; i-- ) {
//         let el = jobs[i];
//         let first = el[0];
//         let end = el[1];
        
//         while ( end <= largest && !optimal[end] ) {
//             end++;
//         }


//         let arr = optimal[end] ? optimal[end] : [];
//         arr = [el].concat(arr);
//         optimal[first] = arr;

//         if ( solution.length < arr.length ) {
//             solution = arr;
//         }
//     }
    
//     return solution;
// }



const optimalSchedule = jobs => {
    let hash = {};
    let largest = 0; 


    //create hash for later
    for ( let i = 0; i < jobs.length; i++ ) {
        let job = jobs[i];
        let start = job[0];
        let end = job[1];

        // set the largest value for later
        if ( end > largest ) {
            largest = end;
        }

        hash[start] = job;
    }

    let optimal = {};

    for ( let i = largest; i >= 0; i-- ) {
        // see if there's a value that starts at that time
        let job = hash[i] ? [hash[i]] : [];
        let end = job[0] ? job[0][1] : largest;

        let bestAfterEnd = optimal[end] ? optimal[end] : [];
        let bestIfSkipped = optimal[i + 1] ? optimal[i + 1] : [];

        bestAfterEnd = job.concat(bestAfterEnd); 

        let arr = bestAfterEnd.length < bestIfSkipped.length ? bestIfSkipped : bestAfterEnd;

        optimal[i] = arr;
    }

    return optimal[0];
}




console.log(optimalSchedule(moviesSchedules));