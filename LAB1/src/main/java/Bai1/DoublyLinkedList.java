/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bai1;

/**
 *
 * @author User
 */

/*
 * Create class doublyLinkedList to save Player
 * Its class contains some method: 
    - isEmpty: return size == 0, it means list empty
    - insertFirst: add Player in top of list
    - insertLast: add player in last of list
    - getFirst: return Node on the top of list
    - getLast: return Node in last of list
    - removeFirst: delete Node on the top of list
    - removeLast:  delete Node in last of list
    - removeAtPos: delete Node at any position
    - addbetween: add new Node between two given nodes
    - get: return data of node at specific position
 */
public class DoublyLinkedList<E> {

    /**
     * Create inner class Node for doublyLinkedList
     *
     * @param <E>
     */
    public static class Node<E> {

        private E data;
        private Node<E> prev;
        private Node<E> next;

        public Node(E data) {
            this.data = data;
        }

        public Node(E data, Node<E> prev, Node<E> next) {
            this.data = data;
            this.prev = prev;
            this.next = next;
        }

        /*
            Return data of Node
         */
        public E getElement() {
            return data;
        }

        /*
            Return Node is in front of it
         */
        public Node<E> getPrev() {
            return prev;
        }

        /*
            Return Node is behind it
         */
        public Node<E> getNext() {
            return next;
        }

        /*
            Create previous Node with param is specific Node
         */
        public void setPrev(Node<E> p) {
            prev = p;
        }

        /*
            Create next Node with param is specific Node
         */
        public void setNext(Node<E> n) {
            next = n;
        }
    }

    private Node<E> header; 
    private Node<E> trailer; 
    public int size = 0; 

    /*
        Constructor default
        Create Node header, trailer
     */
    public DoublyLinkedList() {
        header = new Node<>(null, null, null);
        trailer = new Node<>(null, header, null);
        header.setNext(trailer);
        size = 0;
    }

    //=====================
    /*
        Create method for Setter and Getter for Node header and trailer
     */
    public Node<E> getHeader() {
        return header.getNext();
    }

    public void setHeader(Node<E> header) {
        this.header = header;
    }

    public Node<E> getTrailer() {
        return trailer.getPrev();
    }

    public void setTrailer(Node<E> trailer) {
        this.trailer = trailer;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    //=================================
   
    
    public boolean isEmpty() {
        return size == 0;
    }

    
    public E getFirst() {
        if (isEmpty()) {
            return null;
        }
        return header.getNext().getElement();
    }

    
    public E getLast() {
        if (isEmpty()) {
            return null;
        }
        return trailer.getPrev().getElement();
    }

    
    public void addBetween(E e, Node<E> p, Node<E> s) {
        Node<E> newNode = new Node<>(e, p, s); 
        p.setNext(newNode);  
        s.setPrev(newNode); 
        size++; 
    }

 
    private E remove(Node<E> node) {
        Node<E> p = node.getPrev();
        Node<E> s = node.getNext();
        p.setNext(s);
        s.setPrev(p);
        size--;
        return node.getElement();
    }

    /*
      *input: value of object
    */
    public void insertFirst(E e) {
        addBetween(e, header, header.getNext());
    }

    /*
      *input: value of object
    */
    public void insertLast(E e) {
        addBetween(e, trailer.getPrev(), trailer);
    }

    
    public E removeFirst() {
        if (isEmpty()) {
            return null;
        }
        return remove(header.getNext());
    }

  
    public E removeLast() {
        if (isEmpty()) {
            return null;
        }
        return remove(trailer.getPrev());
    }

    /*
      *input: vi tri cua not can xoa
    */
    public void removeAtPosition(int n) {
        if (size == 0 || n < 0) { // neu size = 0 thi ko co phan tu de remove, neu vi tri < 0 thi error index
            return;
        }
        Node current = header.getNext(); // gan node dau tien trong list cho node current
        for (int i = 0; (current != null) && (i < n); i++) { // duyet den vi tri can tim
            current = current.getNext();
        }
        if (current == null) {
            return;
        }
        remove(current);
    }

    /*
      * input: vi tri cua node can tim
      * output: tra ve gia tri cua node do
    */   
    public E get(int index) {
        if (size != 0) {
            Node<E> current = header.getNext();
            for (int i = 0; (current != null) && (i < index); i++) {
                current = current.getNext();
            }
            if (current != null) {
                return current.getElement();
            }
        }
        return null;
    }
}
