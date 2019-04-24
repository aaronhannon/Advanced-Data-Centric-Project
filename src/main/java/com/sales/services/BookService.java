package com.sales.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sales.models.Book;
import com.sales.repositories.BookRepository;

@Service
public class BookService {

	@Autowired
	BookRepository bookRepository;
	
	//Gets all the books from the database
	public Iterable<Book> findBooks(){
		
		return bookRepository.findAll();
	}
	
	//Adds a book to the database
	public void addBook(Book b){
		
		bookRepository.save(b);
	}
}
