package com.sales.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

//Sets up username=user and password=user
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter{ 
  @Override
  public void configure(HttpSecurity httpSecurity) throws Exception{
    httpSecurity.authorizeRequests()
     .antMatchers("/addBook", "/addCustomer", "/newLoan", "/deleteLoan", "/showBooks", "/showCustomers", "/showLoans")
     .hasRole("USER")
     .and()
     .formLogin();
    
    httpSecurity.logout()                                                                
    .logoutUrl("/logout")                                                 
    .logoutSuccessUrl("/index")                                           
    .invalidateHttpSession(true)                                                                                                                 
    .and();
  }

  @Autowired
  public void configureGlobal(AuthenticationManagerBuilder auth) 
						throws Exception {
    auth.inMemoryAuthentication()
      .withUser("user").password("user").roles("USER");
  }
}
