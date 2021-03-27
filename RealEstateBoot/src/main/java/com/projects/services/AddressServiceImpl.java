package com.projects.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.projects.entities.Address;
import com.projects.repositories.AddressRepository;

@Service
public class AddressServiceImpl {

	@Autowired
	private AddressRepository address;
	
	public List<Address> getAllAddresses() {
		return address.findAll();
	}

	public Address findAddressById(Integer id) {
		Optional<Address> managedAddress = address.findById(id);
		return managedAddress.get();
	}

	public Address create(Address newAddress) {
		address.saveAndFlush(newAddress);
		return newAddress;
	}

	public void delete(Integer id) {
		Optional<Address> addressOpt = address.findById(id);
		Address managedAddress = null;
		if (addressOpt.isPresent()) {
			managedAddress = addressOpt.get();
			address.deleteById(managedAddress.getId());
			}
	}

	public Address update(Integer id, Address upAddress) {
		Optional<Address> addressOpt = address.findById(id);
		Address managedAddress = null;
		if (addressOpt.isPresent()) {
			managedAddress = addressOpt.get();

			managedAddress.setCity(upAddress.getCity());
			managedAddress.setStateAbv(upAddress.getStateAbv());
			managedAddress.setStreet(upAddress.getStreet());
			managedAddress.setZip(upAddress.getZip());
			
		}
		address.saveAndFlush(managedAddress);
		return managedAddress;

	}

}
