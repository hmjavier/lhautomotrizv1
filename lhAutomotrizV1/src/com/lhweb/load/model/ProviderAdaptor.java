package com.lhweb.load.model;

import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;

public class ProviderAdaptor {

	
	
	public static final DBObject toDBObject(Automaker automaker) {
		 
		 DBObject automakerObj = new BasicDBObject();
		 
		 if(automaker.get_id() != null){
			 
			 //DBObject 
			 automakerObj = new BasicDBObject("_id",automaker.get_id()).append( "name", automaker.getName())
					 															.append("cars", automaker.getCars());
			 
		 }
		 else{
			 //DBObject 
			 automakerObj = new BasicDBObject( "name", automaker.getName()).append("cars", automaker.getCars());
		 }
		 
		 
		 
		 return automakerObj;
		 
	 }
	
	
	
	public static final Automaker toAutomaker(DBObject automakerDBObject){
		
		Automaker automaker =  new Automaker();
		
		automaker.set_id(automakerDBObject.get("_id").toString());
		automaker.setName(automakerDBObject.get("name").toString());
		automaker.setCars(Database.stringFormattedToStringList(automakerDBObject.get("cars").toString()));
		
		return automaker;
	}
	 
	 	 

}
