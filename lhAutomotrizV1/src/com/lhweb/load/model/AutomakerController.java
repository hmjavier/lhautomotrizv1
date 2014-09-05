package com.lhweb.load.model;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;

public class AutomakerController {

	
	 
	 public static void create(Automaker automaker){
	
		 Database db =  new Database();
		 db = DatabaseService.getService(db);	
		 
		 /*stuff to do when create, call methods from Database.java class*/
		 db.insert("automakers",AutomakerAdaptor.toDBObject(automaker));		 
		 
		 
		 DatabaseService.releaseService(db);
		 
	 }
	 
	 

	 
	 public static  List<Automaker> getDocuments(){
		 
		 List<DBObject> automakerDBObjectList = new ArrayList<DBObject>();
		 List<Automaker> automakerList =  new ArrayList<Automaker>();
		 DBObject query = new BasicDBObject("name", "Audi");
		 
		 
		 Database db =  new Database();
		 db = DatabaseService.getService(db);		 
		 
		 DBObject findQuery = new BasicDBObject();
		 
		 Automaker queryText =  new Automaker("Audi",Arrays.asList(""));
		 findQuery = AutomakerAdaptor.toDBObject(queryText);
		 
		 automakerDBObjectList = db.runQuery(findQuery, "automakers");
		 System.out.println(findQuery);
		 System.out.println(automakerDBObjectList);
	     
		 
		 DatabaseService.releaseService(db);
		 
		 return automakerList;
	     
	 }
	 
	 
		
		public static List<String> getCarsByAutomaker(){
			List<String> cars =  new ArrayList<String>();		
			
			 Database db =  new Database();
			 db = DatabaseService.getService(db);	
			 HashMap<String,Object> resultSet =  new HashMap<String, Object>();
			 
			 HashMap<String,Object> query = new HashMap<String, Object>();
			 query.put("name", "Audi");
			 //resultSet = db.select(query, collectionName);
			 DatabaseService.releaseService(db);
			 
			return cars;
		}
		
		public static List<HashMap<Object,Object>> getAll(){
			List<HashMap<Object,Object>> resultSet = new ArrayList<HashMap<Object,Object>>();
			
			 Database db =  new Database();
			 db = DatabaseService.getService(db);	
			 
			 resultSet =  db.getAllDocuments("automakers");
			 
			 System.out.println(resultSet);
			 
			 DatabaseService.releaseService(db);
			
			return resultSet;
		}
		
	
	
}
