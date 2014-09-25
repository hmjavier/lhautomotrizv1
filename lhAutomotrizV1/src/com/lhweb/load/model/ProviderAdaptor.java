package com.lhweb.load.model;

import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;

public class ProviderAdaptor {

	
	
	public static final DBObject toDBObject(Provider provider) {
		 
		 DBObject providerObj = new BasicDBObject();
		 
		 if(provider.get_id() != null){
			 
			 //DBObject 
			 providerObj = new BasicDBObject("_id",provider.get_id()).append( "name", provider.getName());
			 
		 }
		 else{
			 //DBObject 
			 providerObj = new BasicDBObject( "name", provider.getName());
		 }
		 
		 
		 
		 return providerObj;
		 
	 }
	
	
	
	public static final Provider toProvider(DBObject providerDBObject){
		
		Provider provider =  new Provider();
		
		provider.set_id(providerDBObject.get("_id").toString());
		provider.setName(providerDBObject.get("name").toString());
		
		
		return provider;
	}
	 
	 	 

}
