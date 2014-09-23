package com.lhweb.load.model;



public interface PersistentDomainObject {
	
	/**
	 * All classes of objects that  we want to store on  database (mongoDB)
	 * must implement this  interface.
	 * */
	
	public void create(); /* create a new document in DB*/
	public void update(); /* update document in DB*/	
	public void delete(); /* remove document in DB*/
	public void print(); /* print class/document */
	
	// TODO getAll() method must be changed to getTop because in production environment 
	//				it could retrieve a lot of data and it causes slowness 
	//public List<?> getAll();
	
	
	
	
}
