package com.sales.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sales.models.Book;
import com.sales.models.Customer;
import com.sales.repositories.CustomerRepository;


@Service
public class CustomerService {
	@Autowired
	CustomerRepository customerRepository;
	
	//Gets all customers from the database
	public Iterable<Customer> findCustomers(){
		
		return customerRepository.findAll();
	}
	
	//adds a customer to the database
	public void addCustomer(Customer c){
		
		customerRepository.save(c);
	}
}

