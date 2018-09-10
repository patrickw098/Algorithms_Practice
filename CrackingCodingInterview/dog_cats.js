class MyLinkedList {
    constructor(head = null, tail = null) {
        this.head = head;
        this.tail = tail;
    }

    getHead() {
        return this.head;
    }

    enqueue(node) {
        if ( this.head === null ) {
            this.head = node;
        } else if ( this.tail === null ) {
            this.tail = node;
            this.head.next = node;
        } else {
            this.tail.next = node;
            this.tail = node;
        }

        return node;
    }

    dequeue() {
        let node = this.head;
        this.head = this.head.next;
        return node;
    }

    delete(node) {
        node.name = node.next.name;
        node.next = node.next.next;

        return node;
    }
}

class MyNode {
    constructor(name = "", type = "") {
        this.name = name;
        this.type = type;
        this.next = null;
    }
}

class DogCatQueue {
    constructor() {
        this.cats = [];
        this.dogs = [];
        this.all = new MyLinkedList()
    }

    enqueue(name, type) {
        let node = new MyNode(name, type);

        if ( node.type === "cat" ) {
            this.cats.push(node);
        } else {
            this.dogs.push(node);
        }

        this.all.enqueue(node);
    }

    dequeueAny() {
        let animal = this.all.dequeue();
        
        if ( animal.type === "cat" ) {
            this.cats.unshift();
        } else {
            this.dogs.unshift();
        }

        let node = new MyNode(animal.name, animal.type );

        return node;
    }

    dequeueDog() {
        let node = this.dogs.shift();
        let newNode = new MyNode( node.name, node.type )

        this.all.delete(node);

        return newNode;
    }

    dequeueCat() {
        let node = this.cats.shift();
        let newNode = new MyNode( node.name, node.type );

        this.all.delete(node);

        return newNode;
    }
}

let shelter = new DogCatQueue();
shelter.enqueue("mini", "cat")
shelter.enqueue("rover", "dog")
shelter.enqueue("milk", "cat")
shelter.enqueue("tea", "dog")