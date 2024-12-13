package com.example.bookstore.model;

import java.util.ArrayList;

public class Cart {
    private ArrayList<Book> books;

    public Cart() {
        this.books = new ArrayList<>();
    }

    public void addBook(Book book) {
        books.add(book);
    }

    public boolean removeBook(Book book) {
        return books.remove(book);

    }

    public ArrayList<Book> getBooks() {
        return books;
    }

    public void clearCart() {
        books.clear();
    }

}
