package com.lhweb.load.model;


import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;



public final class AutomakerAdaptor {
	
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
	 
	 	 
	 
}
