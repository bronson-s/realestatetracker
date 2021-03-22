package com.projects.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class User {
@Id
private int id;
@Column(name="first_name")
private String firstName;
@Column(name="last_name")
private String lastName;
private String username;
private String password;
private String email;


@Override
public String toString() {
	return "User [id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", username=" + username
			+ ", password=" + password + ", email=" + email + "]";
}
public User(int id, String firstName, String lastName, String username, String password, String email) {
	super();
	this.id = id;
	this.firstName = firstName;
	this.lastName = lastName;
	this.username = username;
	this.password = password;
	this.email = email;
}
public User() {
	super();
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getFirstName() {
	return firstName;
}
public void setFirstName(String firstName) {
	this.firstName = firstName;
}
public String getLastName() {
	return lastName;
}
public void setLastName(String lastName) {
	this.lastName = lastName;
}
public String getUsername() {
	return username;
}
public void setUsername(String username) {
	this.username = username;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
@Override
public int hashCode() {
	final int prime = 31;
	int result = 1;
	result = prime * result + id;
	return result;
}
@Override
public boolean equals(Object obj) {
	if (this == obj)
		return true;
	if (obj == null)
		return false;
	if (getClass() != obj.getClass())
		return false;
	User other = (User) obj;
	if (id != other.id)
		return false;
	return true;
}
}
