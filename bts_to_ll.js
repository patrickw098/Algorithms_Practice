class Node {
    constructor(options) {
        this.left = options.left;
        this.right = options.right;
        this.val = options.val;
    }
}

node0 = new Node({ left: null, right: null , val: 0})
node2 = new Node({ left: null, right: null, val: 2 })
node1 = new Node({ left: node0, right: node2, val: 1 })
node4 = new Node({ left: null, right: null, val: 4 })
node6 = new Node({ left: null, right: null, val: 6 })
node5 = new Node({ left: node4, right: null, val: 5 })
node3 = new Node({ left: node1, right: node5, val: 3 })

function bst(node) {
    if ( node.right === null || node.left === null) {
        console.log(node.right);
        if ( node.right || node.left ) {
            if ( node.right  ) {
                node.left = node.right;
                node.right.left = node
                return [node, node.right];
            } else {
                node.right = node.left;
                node.left.right = node;
                return [node.left, node];
            }
        } else {
            return [node];
        }
    }

    let left = bst(node.left);
    let right = bst(node.right);

    leftFirst = left[0];
    leftLast = left[left.length - 1];
    rightFirst = right[0];
    rightLast = right[right.length - 1];
    
    node.right = rightFirst;
    node.left = leftLast;
    rightFirst.left = node;
    leftLast.right = node;
    rightLast.right = leftFirst;
    leftFirst.left = rightLast;

    
    return [leftFirst, rightLast];
}

let node = bst(node3);
console.log(node);
node = node[0];
console.log(node.val);
node = node.right;
console.log(node.val);
node = node.right;
console.log(node.val);
node = node.right;
console.log(node.val);
node = node.right;
console.log(node.val);
node = node.right;
console.log(node.val);
node = node.right;
console.log(node.val);
node = node.right;


// function bst_to_ll(node, stack = []){
//     if ( node.right === null ) {
//         let parent = stack.pop();
//         if ( node.val > parent.val ) {
//             node.left = parent;
//             parent.right = node;
//         } else {
//             grandparent = stack.pop() 
//             node.left = grandparent;
//             node.right = parent;
//             grandparent.right = node; 
//         }

//         return node;
//     }

//     stack.push(node);

//     let last = bst_to_ll(node.right, stack);
//     let first = bst_to_ll(node.left, stack);

//     return node;
// }

// let node = bst_to_ll(node3);

// function printVal(node, first) {
//     node = node.next

//     while ( node !== first ) {
//         console.log(node.val)
//         node = node.right 
//     }

//     console.log("done");
// }

// printVal(node, node);