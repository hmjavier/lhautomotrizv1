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
	 
	 
	 
	 private static  List<Provider> getDocuments(DBObject query,DBObject fields){
		 
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
		 
		 List<DBObject> providerDBObjectList = new ArrayList<DBObject>();
		 List<Provider> providerList =  new ArrayList<Provider>();

		 
		 providerDBObjectList = db.runQuery(query,fields,"providers");
		 
		 for(DBObject dbObject : providerDBObjectList){
			 providerList.add(ProviderAdaptor.toProvider(dbObject));
		 }
		 
		 db.close();
		 
		 		 
		 return providerList;
	     
	 }
	 
	 
	 
	 public static List<Provider> getAllDocuments(){
		 
		 DBObject query =  new BasicDBObject();
		 DBObject fields =  new BasicDBObject();		 
		 return  getDocuments(query,fields); 
		 
		 /*
		  * how to :
		  *  for (Provider provider : ProvidersHandler.getAllDocuments())
		  *  {
		  * 	provider.print();
		  *  }
		  * */
		 		 
	 }
	 
	 


	
}
