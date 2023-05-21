package com.group3.tofu.employee.security;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import org.springframework.security.provisioning.UserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class EmployeeSecurityConfig {

	@Autowired
	private DataSource dataSource;
	
	@Bean
	public UserDetailsManager userDetailsManager(DataSource dataSource) {

		JdbcUserDetailsManager jdbcUserDetailsManager = new JdbcUserDetailsManager(dataSource);

		jdbcUserDetailsManager
				.setUsersByUsernameQuery("select account, password, enabled from Employee where account = ?");

		jdbcUserDetailsManager
				.setAuthoritiesByUsernameQuery("select account, authority from Employee where account = ?");
		return jdbcUserDetailsManager;
	}

	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.jdbcAuthentication()
		.dataSource(dataSource)
		.usersByUsernameQuery("select account, password, enabled from Employee where account = ?")
		.authoritiesByUsernameQuery("select account, authority from Employee where account = ?")
		.passwordEncoder(new BCryptPasswordEncoder());
	}

	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {

		http.authorizeRequests()
				.antMatchers("/login_emp", "/authenticateTheUser", "/login_emp?logout").permitAll() //設置不管有無登入都可以直接訪問(permitAll)
				.antMatchers(HttpMethod.GET, "/info/employee/").hasAnyRole("MANAGER","EMPLOYEE")
				.antMatchers(HttpMethod.GET, "/employee/getEmployeePhoto/*").hasAnyRole("MANAGER","EMPLOYEE")
				.antMatchers(HttpMethod.GET, "/employee/edit_my_profile").hasAnyRole("MANAGER","EMPLOYEE")
				.antMatchers(HttpMethod.PUT, "/employee/edit/**").hasAnyRole("MANAGER","EMPLOYEE")
				.antMatchers(HttpMethod.GET, "/employee/check").hasAnyRole("MANAGER","EMPLOYEE")
				.antMatchers(HttpMethod.GET, "/employee/todayscheck").hasAnyRole("MANAGER","EMPLOYEE")
				.antMatchers(HttpMethod.GET, "/employee/checks").hasAnyRole("MANAGER","EMPLOYEE")
				.antMatchers(HttpMethod.POST, "/employee/check").hasAnyRole("MANAGER","EMPLOYEE")
				.antMatchers(HttpMethod.PUT, "/employee/check").hasAnyRole("MANAGER","EMPLOYEE")
				.antMatchers(HttpMethod.GET, "/employee/").hasAnyRole("MANAGER","EMPLOYEE")
				
				.antMatchers(HttpMethod.GET, "/employee/leave/application").hasAnyRole("MANAGER","EMPLOYEE")
				.antMatchers(HttpMethod.POST, "/employee/leave/application").hasAnyRole("MANAGER","EMPLOYEE")
				.antMatchers(HttpMethod.GET, "/employee/leave/approval").hasRole("MANAGER")
				.antMatchers(HttpMethod.PUT, "/employee/leave/approval").hasRole("MANAGER")
				.antMatchers(HttpMethod.PUT, "/employee/leave/approve/**").hasRole("MANAGER")
				.antMatchers(HttpMethod.PUT, "/employee/leave/reject/**").hasRole("MANAGER")
				.antMatchers(HttpMethod.GET, "/employee/leave/**").hasAnyRole("MANAGER","EMPLOYEE")
				
				.antMatchers(HttpMethod.PUT, "/employee/task/management_book/finished/**").hasAnyRole("MANAGER","EMPLOYEE")
				.antMatchers(HttpMethod.PUT, "/employee/task/management_mtn/finished/**").hasAnyRole("MANAGER","EMPLOYEE")
				.antMatchers(HttpMethod.PUT, "/employee/task/management_book/edit/**").hasAnyRole("MANAGER","EMPLOYEE")
				.antMatchers(HttpMethod.PUT, "/employee/task/management_mtn/edit/**").hasAnyRole("MANAGER","EMPLOYEE")
				.antMatchers(HttpMethod.GET, "/employee/task/management_mtn").hasRole("MANAGER")
				.antMatchers(HttpMethod.GET, "/employee/task/management_book").hasRole("MANAGER")
				.antMatchers(HttpMethod.PUT, "/employee/task/management_mtn").hasRole("MANAGER")
				.antMatchers(HttpMethod.PUT, "/employee/task/management_book").hasRole("MANAGER")
				.antMatchers(HttpMethod.GET, "/employee/task/**").hasAnyRole("MANAGER","EMPLOYEE")
				
				.antMatchers(HttpMethod.GET, "/employee/checkrecord").hasRole("MANAGER")
				.antMatchers(HttpMethod.GET, "/employee/**").hasRole("MANAGER")
				.antMatchers(HttpMethod.POST, "/employee/**").hasRole("MANAGER")
				.antMatchers(HttpMethod.PUT, "/employee/**").hasRole("MANAGER")
				.antMatchers(HttpMethod.DELETE, "/employee/**").hasRole("MANAGER")
				
				.and()
					.formLogin()
					.loginPage("/login_emp")
					.loginProcessingUrl("/authenticateTheUser")
					.failureUrl("/login_emp?error")
					.permitAll()
					.defaultSuccessUrl("/employee/")
					
				.and()
					.logout()
					.logoutUrl("/logout")
					.logoutSuccessUrl("/login_emp?logout")
					.permitAll()
				.and()
					.exceptionHandling()
					.accessDeniedPage("/access-denied");

		http.httpBasic();

		http.csrf().disable();

		return http.build();

	}

}
