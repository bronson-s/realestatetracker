package com.projects.entities;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class AddressTest {

	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Address address;
	
	@BeforeAll
	static void setUpBeforeClass() throws Exception {
	emf=Persistence.createEntityManagerFactory("RealEstatePU");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
	em=emf.createEntityManager();
	address=em.find(Address.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
	em.close();
	address=null;
	}
	
	@Test
	void test() {
		assertNotNull(address);
		assertEquals("hooville", address.getCity());
		assertEquals("CO", address.getStateAbv());
		assertEquals("test st", address.getStreet());
		assertEquals("00000", address.getZip());
	}
}
