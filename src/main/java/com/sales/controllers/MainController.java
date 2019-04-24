package com.sales.controllers;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sales.exceptions.ExceptionClass;
import com.sales.models.Book;
import com.sales.models.Customer;
import com.sales.models.Loan;
import com.sales.services.BookService;
import com.sales.services.CustomerService;
import com.sales.services.LoanService;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import java.time.LocalDate;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.auditing.CurrentDateTimeProvider;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;

//Main Controller for handling Mappings

@Controller
public class MainController {

	@Autowired
	BookService bookService;
	
	@Autowired
	LoanService loanService;
	
	@Autowired
	CustomerService customerService;
	
	//Object that holds info related to the loan errors
	ExceptionClass ec;
	
	//BOOK MAPPINGS
	//=====================================================================================================
	
	//Gets an Arraylist of books and displays it on the showbooks page
	@RequestMapping(value = "/showBooks")
	public String getBooks(Model model) {
		
		ArrayList<Book> books = (ArrayList<Book>) bookService.findBooks();
		model.addAttribute("books",books);
		
		return "showBooks";
	}
	
	//Basic mapping to navigate to the addBook page
	@RequestMapping(value = "/addBook")
	public String addBookPage(@ModelAttribute("BookAdd") Book b) {
		
		return "addBook";
	}
	
	//Gets info from the form and adds the book to the database if there is no errors
	@RequestMapping(value = "/addBook",method=RequestMethod.POST)
	public String addNewCustomerPost(@Valid @ModelAttribute ("BookAdd") Book b,BindingResult result) {

		
		//If theres an error return to the addbook page and display error
		if(result.hasErrors()) {
			return "addBook";
		}
		
		bookService.addBook(b);
			
		return "redirect:showBooks";
		
	}
	
	
	//LOAN MAPPINGS
	//========================================================================================================
	
	//Gets an Arraylist of Loans and displays it on the showLoans page
	@RequestMapping(value = "/showLoans")
	public String getLoans(Model model) {
		
		ArrayList<Loan> loans = (ArrayList<Loan>) loanService.findLoans();
		model.addAttribute("loans",loans);
		
		return "showLoans";
	}
	
	//Basic mapping to navigate to the addLoan page
	@RequestMapping(value = "/newLoan")
	public String addLoanPage(@ModelAttribute("LoanAdd") Loan l) {
		
		return "newLoan";
	}
	
	//Adding a loan with all the necessary error handling
	@RequestMapping(value = "/newLoan",method=RequestMethod.POST)
	public String addNewLoanPost(@ModelAttribute ("LoanAdd") Loan l,Model model) {
		
		//Booleans change if cid or bid change
		boolean cidFound = false;
		boolean bidFound = false;
		
		Loan l1 = new Loan();
		
		//Get all books,customers,and loans
		ArrayList<Book> books = (ArrayList<Book>) bookService.findBooks();
		ArrayList<Customer> customers = (ArrayList<Customer>) customerService.findCustomers();
		ArrayList<Loan> loans = (ArrayList<Loan>) loanService.findLoans();
		
		//looping through all book objects to see if that book exists 
		//using the bid if it does it sets l1.setBook to the matching book and sets bidFound to true
		for(Book book : books) {
			
			if(l.getBook().getBid() == book.getBid()) {
				
				System.out.println(book.getBid());
				l1.setBook(book);
				bidFound = true;
				
			}
		}
		
		//looping through all customer objects to see if that customer exists
		//using the cid if it does it sets l1.setcustomer to the matching customer and sets cidFound to true
		for (Customer customer : customers) {
			if(l.getCust().getcId() == customer.getcId()) {
				
				System.out.println(customer.getcId());
				l1.setCust(customer);
				cidFound = true;
			}
		}
		
		//ERROR IF CUSTOMER AND/OR BOOK DOESN'T EXIST
		//If either boolean is false you are redirected to the error page and an error is displayed
		if(cidFound == false || bidFound == false) {
			ec = new ExceptionClass();
			
			//if the customer was not found display this error
			if(cidFound == false) {
				
				ec.setHeader("Could Not Create New Loan");
				ec.setError("No such customer: " + l.getCust().getcId() + " ");
				
				//if the book was not found too append this to the error message
				if(bidFound == false) {
					ec.setHeader("Could Not Create New Loan");
					ec.setError(ec.getError() + "No such book: " + l.getBook().getBid());
				}
			}
			//if just the book was not found
			else if(bidFound == false) {
				ec.setHeader("Could Not Create New Loan");
				ec.setError("No such book: " + l.getBook().getBid());
			}
			
			return "redirect:errorPage";
		}
		
		//ERROR IF THE BOOK IS ALREADY ON LOAN
		//Loop through the loans arraylist comparing the bid the user entered to all the loan.getBook().getBid()
		//If theres a match user is redirected to the error page where and error is displayed
		for (Loan loan : loans) {
			if(l.getBook().getBid() == loan.getBook().getBid()) {
				ec = new ExceptionClass();
				
				ec.setHeader("Could Not Create New Loan");
				ec.setError("Book: " + loan.getBook().getBid() + " ("+loan.getBook().getTitle()+
						") already on loan to Customer: "+ loan.getCust().getcId()+" ("+loan.getCust().getcName()+")");
				return "redirect:errorPage";
			}
		}

		//LOAN ADDED
		//If all those conditions are passed the date is calculated and set and the loan is added to the datebase
		
		System.out.println(l1.getLid()+ " "+ l1.getCust().getcName()+ " " + l1.getBook().getTitle());
		LocalDate date =  LocalDate.now().plusDays(l1.getCust().getLoanPeriod());
		l1.setDueDate(date.toString());
		System.out.println(date.toString());
		
		loanService.addLoan(l1);
			
		return "redirect:showLoans";
		
		

	}
	
	//Basic mapping to navigate to the deleteLoan page
	@RequestMapping(value = "/deleteLoan")
	public String deleteLoanPage(@ModelAttribute("LoanDelete") Loan l) {
		
		return "deleteLoan";
	}
	
	//Deleting a loan with all necessary error handling
	@RequestMapping(value = "/deleteLoan",method=RequestMethod.POST)
	public String deleteLoanPost(@ModelAttribute ("LoanDelete") Loan l) {
		//Get all loans
		ArrayList<Loan> loans = (ArrayList<Loan>) loanService.findLoans();
		//Boolean to see if loan was found
		boolean loanFound = false;
		
		//loop throught loans and see if that loan exists if it does set loanFound true
		for (Loan loan : loans) {
			System.out.println(l.getLid()  +" "+ loan.getLid());
			if(l.getLid().equals(loan.getLid())) {
				System.out.println("FOUND");
				loanFound = true;
			}
		}
		
		//if found delete that loan
		if(loanFound == true) {
			loanService.deleteLoan(l);
			
			return "redirect:showLoans";
		//else create a new ExceptionClass object and set its Header and Error and redirect user to errorPage
		}else {
			
			ec = new ExceptionClass();
			ec.setHeader("Could Not Delete Loan");
			ec.setError("No such Loan: " + l.getLid());
			
			return "redirect:errorPage";
		}
		

	}
	
	//MAPPINGS FOR CUSTOMERS
	//========================================================================================================
	
	//Gets an Arraylist of customers and displays it on the showCustomers page
	@RequestMapping(value = "/showCustomers")
	public String getCustomers(Model model) {
		
		ArrayList<Customer> customers = (ArrayList<Customer>) customerService.findCustomers();
		model.addAttribute("customers",customers);
		
		return "showCustomers";
	}
	
	//Navigates user to addcustomer page
	@RequestMapping(value = "/addCustomer")
	public String addCustomerPage(@ModelAttribute("CustAdd") Customer c) {
		
		return "addCustomer";
	}
	
	//Adds a customer if there are not errors and redirected to the showcustomers page
	@RequestMapping(value = "/addCustomer",method=RequestMethod.POST)
	public String addNewCustomerPost(@Valid @ModelAttribute ("CustAdd") Customer c,BindingResult result) {

		if(result.hasErrors()) {
			return "addCustomer";
		}
 
		customerService.addCustomer(c);
		
		return "redirect:showCustomers";
	}
	
	//MAPPINGS FOR ERRORPAGE AND LOGOUT
	//=========================================================================================================
	
	//adds ec object to the model and user is moved to the errorPage and error is displayed
	@RequestMapping(value = "/errorPage")
	public String errorPage(Model model) {
		
		System.out.println(ec.getHeader());
		System.out.println(ec.getError());
		
		model.addAttribute("exception",ec);
		
		return "errorPage";
	}
	
	//REFERENCE
	//http://websystique.com/spring-security/spring-security-4-logout-example/
	
	//Logs user out
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
	    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    if (auth != null){    
	        new SecurityContextLogoutHandler().logout(request, response, auth);
	    }
	    return "redirect:/index.html";
	}
}
