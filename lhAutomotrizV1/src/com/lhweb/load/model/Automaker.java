package com.lhweb.load.model;

import java.util.List;

public class Automaker implements PersistentDomainObject {
	
	private String _id;
	private String name;
	private List<String> cars;
	
	
	
	public Automaker(){
		
	}
	
	public Automaker(String name, List<String> cars){
		this.name=name;
		this.cars=cars;
	}
	
	public Automaker(String _id, String name, List<String> cars){		
		this._id =_id;
		this.name=name;
		this.cars=cars;
	}
	
	
	
	
	/* ---   POJO Methods*/
	public String get_id() {
		return _id;
	}
	
	public String getName() {
		return name;
	}
	
	public List<String> getCars() {
		return cars;
	}
	
	public void set_id(String _id) {
		this._id = _id;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public void setCars(List<String> cars) {
		this.cars = cars;
	}
	
	
	
	
	
	/* ---   Methods from Interface*/
	public void create(){
		AutomakersHandler.create(this);		
	}
	
	public void update(){
		
	}
	
	public void delete(){
			
	}
	
	public void print(){
		System.out.println("_Id => " + this.get_id() + 
							"\nName => " + this.getName() + 
							"\nCars => " + this.getCars());
	}
	
	
	
}
