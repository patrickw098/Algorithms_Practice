var findMedianSortedArrays = function (nums1, nums2) {
    let sorted = [];

    while ( Math.abs(sorted.length - ( nums1.length + nums2.length) ) > 1 ) {
        if ( nums1.length === 0 ) {
            console.log("1");
            console.log(nums1, nums2, sorted)
            sorted.push(nums2.shift());
        } else if (nums2.length === 0) {
            console.log("2");
            sorted.push(nums1.shift());
        } else if ( nums1[0] < nums2[0] ) {
            console.log("3");
            sorted.push(nums1.shift());
        } else {
            console.log("4");
            sorted.push(nums2.shift());
        }
    }

    let lowest;

    if ( nums1.length === undefined || nums2 === undefined ) {
        lowest = nums1[0] || nums2[0]
    } else {
        lowest = nums1[0] < nums2[0] ? nums1[0] : nums2[0]
    }

    console.log(nums1, nums2, sorted, lowest)

    return sorted.length === ( nums1.length + nums2.length ) ? ( sorted[sorted.length - 1] + lowest )/ 2 : lowest
};

console.log(findMedianSortedArrays([1,3],[2]));