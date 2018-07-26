 function ListNode(val) {
    this.val = val;
    this.next = null;
 }

var addTwoNumbers = function (l1, l2) {
    let head = new ListNode(null);
    let node = head
    let carry = 0;

    while (l1 !== null || l2 !== null) {
        console.log("i'm in here");
        let val1 = l1 === null ? 0 : l1.val;
        let val2 = l2 === null ? 0 : l2.val;

        let total = val1 + val2 + carry
        carry = Math.floor(total / 10);
        total = total % 10;

        node.next = new ListNode(total)
        node = node.next;

        if (l1 !== null) {
            console.log("hello")
            l1 = l1.next
        }
        if (l2 !== null) {
            console.log("goodbye")
            l2 = l2.next
        }

        console.log(l1, l2)
    }

    if (carry > 0) {
        node.next = new ListNode(carry)
    }

    return head.next
};

let one = new ListNode(1);
let eight = new ListNode(8);
let zero = new ListNode(0);

one.next = eight;

let result = addTwoNumbers(one, zero);

while ( result !== null ) {
    console.log(result.val);
    result = result.next
}