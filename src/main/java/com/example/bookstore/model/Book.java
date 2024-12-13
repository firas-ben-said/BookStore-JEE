package com.example.bookstore.model;

import java.util.Objects;

public class Book {
    private static int idCounter = 1;

    private String title;
    private String author;
    private double price;
    private String imageUrl;
    private int quantity;
    private int id;

    public Book(String title, String author, double price, String imageUrl) {
        this.id = idCounter++;
        this.title = title;
        this.author = author;
        this.price = price;
        this.imageUrl = imageUrl;
        this.quantity = 1;
    }

    // Getters and setters
    public int getId() { return id; }
    public String getTitle() { return title; }
    public String getAuthor() { return author; }
    public double getPrice() { return price; }
    public String getImageUrl() { return imageUrl; }
    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Book book = (Book) o;
        return getId() == book.getId();
    }

    @Override
    public int hashCode() {
        return Objects.hash(getId());
    }


}
