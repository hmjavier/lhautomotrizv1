package com.lhweb.load.model;

import java.util.ArrayList;
import java.util.List;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;

public class ProvidersHandler {


	
	 
	 public static void create(Provider provider){  
	
		 Database db =  new Database();
		 db.getService();	
		 
		 /*stuff to do when create, call methods from Database.java class*/
		 db.insert("providers",ProviderAdaptor.toDBObject(provider));		 
		 db.close();
		 
	 }
	 
	 
	 
	 private static  List<Automaker> getDocuments(DBObject query,DBObject fields){
		 
		 /**
		  * The inputs are dbObjects that's why is private , not mix this DB classes 
		  * in other projects classes.
		  * 
		  * How to use it.
		  * 
		  * DBObject query =  new BasicDBObject("name","AlfaRomeo");
		 	DBObject fields =  new BasicDBObject("cars",1).append("_id", 0);		 
		 	getDocuments(query,fields).get(0).print();
		 
		  */
		 
		 Database db =  new Database();
		 db.getService();
		 
		 List<DBObject> automakerDBObjectList = new ArrayList<DBObject>();
		 List<Automaker> automakerList =  new ArrayList<Automaker>();

		 
		 automakerDBObjectList = db.runQuery(query,fields,"automakers");
		 
		 for(DBObject dbObject : automakerDBObjectList){
			 automakerList.add(AutomakerAdaptor.toAutomaker(dbObject));
		 }
		 
		 db.close();
		 
		 		 
		 return automakerList;
	     
	 }
	 
	 
	 
	 public static List<Automaker> getAllDocuments(){
		 
		 DBObject query =  new BasicDBObject();
		 DBObject fields =  new BasicDBObject();
		 
		 return  getDocuments(query,fields); 
		 		 
	 }
	 
	 


	
}
