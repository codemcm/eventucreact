package com.uc.demo.rest;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import com.uc.demo.Entity.GuestEntity;
import com.uc.demo.dao.GuestDao;

@RestController
@RequestMapping("guest")
//RequestMaping: en que url van a responder todos los metodos de aqui
public class GuestRest {

	@Autowired
	private GuestDao guestDAO;
	
	@RequestMapping(value="hellow", method=RequestMethod.GET)
	//@GetMapping  //localhost:8080
	public String hello() {
		//podriamos usar @RequestMapping(value="hello", method=RequestMethod.GET)
		//@GetMapping ->No define una url, toma el de la clase
		return "Hola";
	}
	
//	@GetMapping
//	@ResponseBody//sin esta ya retorna el json
//	public ResponseEntity<GuestEntity> getGuest(){
//		GuestEntity guest= new GuestEntity();
//		
//		guest.setGuestId(1);
//		guest.setName("Ricardo");
//		guest.setLastName("Soriano Sosa");
//		guest.setActive(true);
//		guest.setCreatedBy(1);
//		return ResponseEntity.ok(guest);
//	}
	@GetMapping
	public ResponseEntity<List<GuestEntity>> getGuests(){
		List<GuestEntity> guests=  guestDAO.findAll();
		return ResponseEntity.ok(guests);
	}
	
	@RequestMapping(value="{guestId}") //
	public ResponseEntity<GuestEntity> getByID(@PathVariable("guestId") int guestId){
		Optional<GuestEntity> optionalGuest = guestDAO.findById(guestId);
		if(optionalGuest.isPresent()) {
			return  ResponseEntity.ok(optionalGuest.get());
		}else {
			return ResponseEntity.noContent().build();
		}
	}
	
	@PostMapping
	public ResponseEntity<GuestEntity> create(GuestEntity guest){
		GuestEntity newGuest = guestDAO.save(guest); 
		return ResponseEntity.ok(newGuest);
	}
	@DeleteMapping(value="{guestId}")
	public ResponseEntity<Void> delete(@PathVariable("guestId") int guestId){
		guestDAO.deleteById(guestId); 
		return ResponseEntity.ok(null);
	}
	
	@PutMapping
	public ResponseEntity<GuestEntity> update(@RequestBody GuestEntity guest){
		Optional<GuestEntity> optionalGuest = guestDAO.findById(guest.getGuestId());
		if(optionalGuest.isPresent()) {
			GuestEntity updateGuest = optionalGuest.get();
			updateGuest.setName(guest.getName());
			updateGuest.setLastName(updateGuest.getLastName());
			updateGuest.setActive(guest.getActive());
			guestDAO.save(updateGuest);
			return ResponseEntity.ok(updateGuest);
		}else {
			return ResponseEntity.notFound().build();
		}
		
	}
}