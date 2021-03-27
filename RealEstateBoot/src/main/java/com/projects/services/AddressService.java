package com.projects.services;

import java.util.List;

import com.projects.entities.Address;

public interface AddressService {
	
	public List<Address> getAllAddresses();	
	public Address findAddressById(Integer id);
	public Address create(Address newAddress);
	public void delete(Integer id);
	public Address update(Integer id, Address updateAddress);

}
