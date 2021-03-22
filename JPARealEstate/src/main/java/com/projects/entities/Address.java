package com.projects.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Address {
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
private int id;
private String street;
private String city;
@Column(name="state_abbrv")
private String stateAbv;
private String zip;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getStreet() {
	return street;
}
public void setStreet(String street) {
	this.street = street;
}
public String getCity() {
	return city;
}
public void setCity(String city) {
	this.city = city;
}
public String getStateAbv() {
	return stateAbv;
}
public void setStateAbv(String stateAbv) {
	this.stateAbv = stateAbv;
}
public String getZip() {
	return zip;
}
public void setZip(String zip) {
	this.zip = zip;
}
@Override
public int hashCode() {
	final int prime = 31;
	int result = 1;
	result = prime * result + ((city == null) ? 0 : city.hashCode());
	result = prime * result + id;
	result = prime * result + ((stateAbv == null) ? 0 : stateAbv.hashCode());
	result = prime * result + ((street == null) ? 0 : street.hashCode());
	result = prime * result + ((zip == null) ? 0 : zip.hashCode());
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
	Address other = (Address) obj;
	if (city == null) {
		if (other.city != null)
			return false;
	} else if (!city.equals(other.city))
		return false;
	if (id != other.id)
		return false;
	if (stateAbv == null) {
		if (other.stateAbv != null)
			return false;
	} else if (!stateAbv.equals(other.stateAbv))
		return false;
	if (street == null) {
		if (other.street != null)
			return false;
	} else if (!street.equals(other.street))
		return false;
	if (zip == null) {
		if (other.zip != null)
			return false;
	} else if (!zip.equals(other.zip))
		return false;
	return true;
}
@Override
public String toString() {
	return "Address [id=" + id + ", street=" + street + ", city=" + city + ", stateAbv=" + stateAbv + ", zip=" + zip
			+ "]";
}
public Address(int id, String street, String city, String stateAbv, String zip) {
	super();
	this.id = id;
	this.street = street;
	this.city = city;
	this.stateAbv = stateAbv;
	this.zip = zip;
}
public Address() {
	super();
}


}
