package com.sales.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sales.models.Book;
import com.sales.models.Loan;
import com.sales.repositories.LoanRepository;


@Service
public class LoanService {
	@Autowired
	LoanRepository loanRepository;
	
	//Gets all the loans from the database
	public Iterable<Loan> findLoans(){
		
		return loanRepository.findAll();
	}
	
	//adds a loan to the database
	public void addLoan(Loan l){
		
		loanRepository.save(l);
	}
	
	//deletes a loan from the database
	public void deleteLoan(Loan l) {
		
		loanRepository.delete(l);
	}
}
