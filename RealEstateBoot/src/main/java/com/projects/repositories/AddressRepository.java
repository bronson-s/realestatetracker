package com.projects.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.projects.entities.Address;

public interface AddressRepository extends JpaRepository <Address, Integer>{
	
}
