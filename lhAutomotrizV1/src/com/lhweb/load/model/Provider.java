package com.lhweb.load.model;


public class Provider implements PersistentDomainObject{


	
	private String _id;
	private String name;
	
	
	
	
	public Provider(){
		
	}
	
	public Provider(String name){
		this.name=name;
	}
	
	public Provider(String _id, String name){		
		this._id =_id;
		this.name=name;	
	}
	
	
	
	
	/* ---   POJO Methods*/
	public String get_id() {
		return _id;
	}
	
	public String getName() {
		return name;
	}
	
	
	public void set_id(String _id) {
		this._id = _id;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	
	
	
	
	
	/* ---   Methods from Interface*/
	public void create(){
		ProvidersHandler.create(this);		
	}
	
	public void update(){
		
	}
	
	public void delete(){
			
	}
	
	public void print(){
		System.out.println("_Id => " + this.get_id() + 
							"\nName => " + this.getName());
	}
	
	

	
}
