package com.projects.controllers;

import java.util.List;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.projects.entities.Address;
import com.projects.services.AddressServiceImpl;

@RequestMapping("api")
@RestController
public class AddressController {

	private AddressServiceImpl addSvc;
	
	@GetMapping("addresses")
	public List<Address> getAllAddresses(){
		return addSvc.getAllAddresses();	
	}
	@GetMapping("address/{id}")
	public Address findAddressById(@PathVariable Integer id){
		return addSvc.findAddressById(id);
	}
	@PostMapping("address")
	public Address create(@RequestBody Address newAddress) {
		return addSvc.create(newAddress);
	}
	@DeleteMapping("address/{id}")
	public void delete(@PathVariable Integer id) {
		addSvc.delete(id);
	}
	@PutMapping("address/{id}")
	public Address update(@PathVariable int id,@RequestBody Address updateAddress) {
		return addSvc.update(id, updateAddress);
	}
	}
