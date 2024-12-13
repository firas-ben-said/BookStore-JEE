package com.example.bookstore;


import com.example.bookstore.model.Book;

import java.util.ArrayList;

public class BookStorage {
    private static BookStorage instance;
    private ArrayList<Book> books = new ArrayList<>();
    private ArrayList<Book> cart = new ArrayList<>();

    private BookStorage() {
        books.add(new Book("The Great Gatsby", "F. Scott Fitzgerald", 10.99, "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPkwBoPqiz64V2C8SkBTJYd9DCwcfntLgQRQ&s"));
        books.add(new Book("To Kill a Mockingbird", "Harper Lee", 8.99, "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnQ472uYK5UOemhgGD7wk3xpWJr4oDbsuY-A&s"));
        books.add(new Book("1984", "George Orwell", 9.99, "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRM1k7QNP_48y1nNMkXTZxtAejkB_fIkV1ipg&s"));
        books.add(new Book("Pride and Prejudice", "Jane Austen", 7.99, "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRz5EBiO5TFfpUiwNrt3MB1n0452gvLwiMRQ&s"));
        books.add(new Book("The Catcher in the Rye", "J.D. Salinger", 6.99, "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVdPsvFMMqa0HJGRWfEcfcxDQ4v3XJ1VcPRA&s"));
    }

    public static BookStorage getInstance() {
        if (instance == null) {
            instance = new BookStorage();
        }
        return instance;
    }

    public ArrayList<Book> getCart() {
        return cart;
    }

    public ArrayList<Book> getBooks() {
        return books;
    }

    public Book getBookById(int id) {
        for (Book book : books) {
            if (book.getId() == id) {
                return book;
            }
        }
        return null;
    }

    public Book getBookByTitle(String bookTitle) {
        for (Book book : books) {
            if (book.getTitle().equals(bookTitle)) {
                return book;
            }
        }
        return null;
    }

    public void deleteBookFromCart(int id) {
        Book book = getBookById(id);
        cart.remove(book);
    }
}
